class ShopCategoryModel {
  final String id;
  final String categoryTitle;

  ShopCategoryModel({required this.id, required this.categoryTitle});

  factory ShopCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShopCategoryModel(
       id: json["id"]!.toString(),
      categoryTitle: json["category_title"] ?? "",

     
    );
  }
}