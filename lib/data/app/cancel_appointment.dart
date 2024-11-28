import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/utils/http/http.dart';

class CancelAppointmentService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<dynamic> cancelAppointment({required String appID}) async {
    try {
      String? token = await getToken();
      dynamic res = await KHTTP.post(
        endpoint: "/appointments/$appID/cancel",
        token: token,
      );
      print(res);

      return res;
    } catch (e) {
      print("Error: $e");
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
