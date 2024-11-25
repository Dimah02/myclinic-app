class DoctorModel {
  String? id;
  String? name;
  String? specialization;
  String? about;
  String? photo;
  List<Review>? reviews;
  double averageRating;
  List<Appointment>? appointments;

  DoctorModel({
    this.id,
    required this.name,
    required this.specialization,
    this.about,
    this.photo,
    this.reviews,
    this.averageRating = 0.0,
    this.appointments,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        specialization: json['specialization'] as String?,
        about: json['about'] as String?,
        photo: json['photo'] as String?,
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e))
            .toList(),
        averageRating: json['averageRating'] as double? ?? 0.0,
        appointments: (json['appointments'] as List<dynamic>?)
            ?.map((e) => Appointment.fromJson(e))
            .toList(),
      );
}

class Review {
  String? userId;
  String? userName;
  int rating;
  String? comment;
  DateTime? date;

  Review({
    this.userId,
    this.userName,
    required this.rating,
    this.comment,
    this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        userId: json['_id'] as String?,
        userName: json['userName'] as String?,
        rating: json['rating'] as int,
        comment: json['comment'] as String?,
        date: DateTime.parse(json['date']),
      );
}

class TimeSlot {
  String? start;
  String? end;
  bool available;

  TimeSlot({
    required this.start,
    required this.end,
    this.available = true,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        start: json['start'] as String?,
        end: json['end'] as String?,
        available: json['available'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
        'available': available,
      };
}

class Appointment {
  DateTime? date;
  List<TimeSlot>? time;

  Appointment({
    required this.date,
    this.time,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        date: DateTime.parse(json['date']),
        time: (json['time'] as List<dynamic>?)
            ?.map((e) => TimeSlot.fromJson(e))
            .toList(),
      );
}
