class ShopLoginModel {
  final String? id;
  final String? username;
  final String? phoneNo;
  final String? role;
  final String? status;
  final String? createdDate;
  final String? deviceToken;

  ShopLoginModel({
    this.id,
    this.username,
    this.phoneNo,
    this.role,
    this.status,
    this.createdDate,
    this.deviceToken,
  });

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) {
    return ShopLoginModel(
      id: json["id"]?.toString(),
      username: json["username"] ?? "",
      phoneNo: json["phone_no"] ?? "",
      role: json["role"] ?? "",
      status: json["status"] ?? "",
      createdDate: json["created_date"] ?? "",
      deviceToken: json["device_token"] ?? "",
    );
  }
}
