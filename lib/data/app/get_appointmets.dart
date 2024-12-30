import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/utils/http/http.dart';

class GetAppointmentService extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  List<AppointmentModel>? _appointmetns;

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  List<AppointmentModel>? get appointmetns => _appointmetns;

  Future<List<AppointmentModel>> getCurrentAppointments() async {
    try {
      String? token = await getToken();
      String? id = await getID();
      dynamic res = await KHTTP.post(
        endpoint: "/users/$id/appointments",
        token: token,
      );
      List<AppointmentModel> app = [];
      for (var appointment in res['appointments']) {
        app.add(AppointmentModel.fromJson(appointment));
      }

      _appointmetns = app;
      notifyListeners();

      return app;
    } catch (e) {
      print("Error: $e");
      throw Exception("Server Error: ${e.toString()}");
    }
  }

  Future<List<AppointmentModel>> getHistory() async {
    try {
      String? token = await getToken();
      String? id = await getID();
      dynamic res = await KHTTP.post(
        endpoint: "/users/$id/allappointments",
        token: token,
      );
      List<AppointmentModel> app = [];
      if (res['appointments'] != null) {
        for (var appointment in res['appointments']) {
          app.add(AppointmentModel.fromJson(appointment));
        }
      }

      return app;
    } catch (e) {
      print("Error: $e");
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
