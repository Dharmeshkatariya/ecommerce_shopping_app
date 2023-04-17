class ProductData {
   ProductData();
  late final int id;
  late final String categoryName;
  late final String productName;
  late final String description;
  late final String image;
  late final int totalReview;
  late final int totalRateValue;
  final double productPrice = 50;

  ProductData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryName = json['category_name'];
    productName = json['product_name'];
    description = json['description'];
    image = json['image'];
    totalReview = json['total_review'];
    totalRateValue = json['total_rate_value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['product_name'] = productName;
    _data['description'] = description;
    _data['image'] = image;
    _data['total_review'] = totalReview;
    _data['total_rate_value'] = totalRateValue;
    return _data;
  }
}