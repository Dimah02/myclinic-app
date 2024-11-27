import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/utils/http/http.dart';

class GetDoctorService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<DoctorModel> getDoctor({required String id}) async {
    try {
      String? token = await getToken();
      dynamic res = await KHTTP.get(
        endpoint: "/doctors/$id",
        token: token,
      );
      DoctorModel doctor = DoctorModel.fromJson(res);
      return doctor;
    } catch (e) {
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
