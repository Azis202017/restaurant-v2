import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';
@JsonSerializable(includeIfNull: true)
class Categories {
  String? name;
  Categories({this.name});
  factory Categories.fromJson(Map<String,dynamic> json) => _$CategoriesFromJson(json);
  Map<String,dynamic> toJson() => _$CategoriesToJson(this);

}