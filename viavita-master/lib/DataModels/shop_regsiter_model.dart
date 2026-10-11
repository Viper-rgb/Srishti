class ShopRegisterModel {
  final int? shopkeeperId;
  final String? name;
  final String? phoneNumber;
  final String? emailId;
  final String? state;
  final String? district;
  final String? address;
  final int? shopCategoryId;
  final String? idProof;

  ShopRegisterModel({
    this.shopkeeperId,
    this.name,
    this.phoneNumber,
    this.emailId,
    this.state,
    this.district,
    this.address,
    this.shopCategoryId,
    this.idProof,
  });

  factory ShopRegisterModel.fromJson(Map<String, dynamic> json) {
    return ShopRegisterModel(
      // Safely parse String/Int/Null to int
      shopkeeperId: int.tryParse(json['shopkeeper_id']?.toString() ?? '0'),
      
      name: json['name']?.toString() ?? '',
      
      phoneNumber: json['phone_number']?.toString() ?? '',
      
      // key is 'emailid' in your JSON
      emailId: json['emailid']?.toString() ?? '',
      
      state: json['state']?.toString() ?? '',
      
      district: json['district']?.toString() ?? '',
      
      address: json['address']?.toString() ?? '',
      
      // Safely parse String/Int/Null to int
      shopCategoryId: int.tryParse(json['shop_category_id']?.toString() ?? '0'),
      
      idProof: json['id_proof']?.toString() ?? '',
    );
  }
}