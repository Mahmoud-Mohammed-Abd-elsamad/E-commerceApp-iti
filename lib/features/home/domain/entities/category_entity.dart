class CategoriesEntity {
  int? results;
  List<Data>? data;

  CategoriesEntity({this.results, this.data});

  CategoriesEntity.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}


class Data {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
        this.name,
        this.slug,
        this.image,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
