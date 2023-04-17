class CategoryData {
  CategoryData();
  late final int id;
  late final String categoryName;
  late final String categoryThumb;

  CategoryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryName = json['category_name'];
    categoryThumb = json['category_thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['category_thumb'] = categoryThumb;
    return _data;
  }
}