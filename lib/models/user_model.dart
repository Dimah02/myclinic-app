class UserModel {
  String? name;
  String? photo;
  String? email;
  String? bloodType;
  String? gender;
  String? birthDate;
  String? allergyToMedications;
  String? medicalHistory;
  int? height;
  int? weight;

  UserModel({
    required this.name,
    required this.photo,
    required this.email,
    this.bloodType,
    this.gender,
    this.birthDate,
    this.allergyToMedications,
    this.medicalHistory,
    this.height,
    this.weight,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      email: json['email'] ?? '',
      bloodType: json['blood_type'] ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birth_date'] ?? '',
      allergyToMedications: json['allergy_to_medications'] ?? '',
      medicalHistory: json['medical_history'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
    );
  }
}
