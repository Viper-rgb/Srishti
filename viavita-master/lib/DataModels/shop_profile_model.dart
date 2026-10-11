

class ShopprofileModel {
  final String userId;
  final String username;
  final String phoneNo;
  final String role;
  final String status;
  final String createdDate; 
  final String shopkeeperId;
  final String name;
  final String phoneNumber;
  final String emailid;
  final String state;
  final String district;
  final String address;
  final String idProof;
  final String shopCategoryId;

  ShopprofileModel({
    required this.userId,
    required this.username,
    required this.phoneNo,
    required this.role,
    required this.status,
    required this.createdDate,
    
    required this.shopkeeperId,
    required this.name,
    required this.phoneNumber,
    required this.emailid,
    required this.state,
    required this.district,
    required this.address,
    required this.idProof,
    required this.shopCategoryId,
  });

  factory ShopprofileModel.fromJson(Map<String, dynamic> json) {
    return ShopprofileModel(
      userId: json["user_id"] ?? "",
      username: json["username"] ?? "",
      phoneNo: json["phone_no"] ?? "",
      role: json["role"] ?? "",
      status: json["status"] ?? "",
      createdDate: json["created_date"] ?? "",
      
      shopkeeperId: json["shopkeeper_id"] ?? "",
      name: json["name"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      emailid: json["emailid"] ?? "",
      state: json["state"] ?? "",
      district: json["district"] ?? "",
      address: json["address"] ?? "",
      idProof: json["id_proof"] ?? "",
      shopCategoryId: json["shop_category_id"] ?? "",
    );
  }

}