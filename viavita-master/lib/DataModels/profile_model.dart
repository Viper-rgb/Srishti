class ProfileModel {
  final int id;
  final String name;
  final String gender;
  final String phoneNumber;
  final String emailId;
  final String address;
  final String avatar;
  final String createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.emailId,
    required this.address,
    required this.avatar,
    required this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      emailId: json['email_id'],
      address: json['address'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
    );
  }
}
