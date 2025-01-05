import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/models/user_model.dart';
import 'package:myclinic/utils/http/http.dart';

class AuthenticationServices {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> _storeToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> _storeID(String id) async {
    await _storage.write(key: 'id', value: id);
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<void> userSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      dynamic res = await KHTTP.post(
        endpoint: "/user/signup",
        body: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      User().setUser(UserModel.fromJson(res["user"]));
      await _storeToken(res["user"]["token"]);
      await _storeID(res["user"]["id"]);
    } catch (e) {
      if (e.toString().contains("User already exists")) {
        throw "User already exists";
      }
      throw Exception("Server Error: ${e.toString()}");
    }
  }

  Future<void> updateUser({
    String? name,
    String? email,
    String? bloodType,
    String? gender,
    String? birthDate,
    String? allergyToMedications,
    String? medicalHistory,
    String? height,
    String? weight,
  }) async {
    try {
      String? token = await getToken();
      String? id = await getID();
      await KHTTP.post(
        endpoint: "/user/update_info",
        body: {
          "id": id,
          if (name != null && name.isNotEmpty) "name": name,
          if (email != null && email.isNotEmpty) "email": email,
          if (bloodType != null && bloodType.isNotEmpty)
            "blood_type": bloodType,
          if (gender != null && gender.isNotEmpty) "gender": gender,
          if (birthDate != null && birthDate.isNotEmpty)
            "birth_date": birthDate,
          if (allergyToMedications != null && allergyToMedications.isNotEmpty)
            "allergy_to_medications": allergyToMedications,
          if (medicalHistory != null && medicalHistory.isNotEmpty)
            "medical_history": medicalHistory,
          if (height != null && height.isNotEmpty) "height": height,
          if (weight != null && weight.isNotEmpty) "weight": weight,
        },
        token: token,
      );
    } catch (e) {
      if (e.toString().contains("User already exists")) {
        throw "User already exists";
      }
      throw Exception("Server Error: ${e.toString()}");
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      dynamic res = await KHTTP.post(
        endpoint: "/user/login",
        body: {
          "email": email,
          "password": password,
        },
      );
      if (res["message"] != null) {
        throw res["message"];
      }
      User().setUser(UserModel.fromJson(res["user"]));
      await _storeToken(res["user"]["token"]);

      await _storeID(res["user"]["id"]);
    } catch (e) {
      if (e.toString().contains("User not found")) throw "User not found";
      throw "Password is incorrect";
    }
  }

  Future<void> finUser({required String email}) async {
    try {
      dynamic res = await KHTTP.post(
        endpoint: "/user/find_user",
        body: {
          "email": email,
        },
      );
      if (res["error"] == null) {
        throw "Email Already exist";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
