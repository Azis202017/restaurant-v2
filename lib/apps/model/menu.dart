import 'package:json_annotation/json_annotation.dart';

import 'categories.dart';
part 'menu.g.dart';
@JsonSerializable(includeIfNull : true, explicitToJson: true)
class Menu {
  List<Categories>? foods;
  List<Categories>? drinks;
  Menu({this.foods,this.drinks});
  factory Menu.fromJson(Map<String,dynamic> json) => _$MenuFromJson(json);
  Map<String,dynamic> toJson() => _$MenuToJson(this);
}