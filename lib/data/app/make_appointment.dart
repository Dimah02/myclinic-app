import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/utils/http/http.dart';

class MakeAppointmentService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<dynamic> makeAppointment({
    required String docotrID,
    required String date,
    required String time,
  }) async {
    try {
      String? token = await getToken();
      String? id = await getID();
      dynamic res = await KHTTP.post(
        endpoint: "/appointments",
        token: token,
        body: {
          "doctorId": docotrID,
          "userId": id,
          "date": DateTime.parse(date).toIso8601String(),
          "time": time,
        },
      );
      print(res);

      return res;
    } catch (e) {
      print("Error: $e");
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
