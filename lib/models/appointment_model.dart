class AppointmentModel {
  DateTime? date;
  String? id;
  String? docotrId;
  String? docotrName;
  String? photo;
  String? doctorSpecialization;
  String? userId;
  String? time;
  String? status;

  AppointmentModel({
    required this.date,
    required this.id,
    required this.docotrId,
    required this.docotrName,
    required this.doctorSpecialization,
    required this.userId,
    required this.time,
    required this.status,
    required this.photo,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        date: DateTime.parse(json['date']),
        id: json['_id'],
        docotrId: json["doctor"]['_id'],
        docotrName: json["doctor"]['name'],
        photo: json["doctor"]['photo'],
        doctorSpecialization: json["doctor"]['specialization'],
        userId: json['user'],
        time: json['time'],
        status: json['status'],
      );
}
