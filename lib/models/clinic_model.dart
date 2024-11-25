import 'package:myclinic/models/doctor_model.dart';

class ClinicModel {
  String? id;
  String? name;
  String? image;
  List<DoctorModel>? doctors;

  ClinicModel({
    this.id,
    this.name,
    this.doctors,
    this.image,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        id: json['_id'] as String?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        doctors: (json['doctors'] as List<dynamic>?)
            ?.map((doctorJson) => DoctorModel.fromJson(doctorJson))
            .toList(),
      );
}
