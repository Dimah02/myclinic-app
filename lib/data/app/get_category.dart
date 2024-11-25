import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/models/clinic_model.dart';
import 'package:myclinic/utils/http/http.dart';

class CategoryService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<List<ClinicModel>> getClinics() async {
    try {
      String? token = await getToken();
      dynamic res = await KHTTP.get(
        endpoint: "/clinics",
        token: token,
      );
      List<ClinicModel> clinics = [];
      for (var clinic in res["clinics"]) {
        ClinicModel clinicModel = ClinicModel.fromJson(clinic);
        clinics.add(clinicModel);
      }
      return clinics;
    } catch (e) {
      if (e.toString().contains("User already exists")) {
        throw "User already exists";
      }
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
