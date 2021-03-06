import 'package:json_annotation/json_annotation.dart';

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['image'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
    };

@JsonSerializable()
class Category {
  String image;
  String title;

  Category(this.image, this.title);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return 'Category{image: $image, title: $title}';
  }

}