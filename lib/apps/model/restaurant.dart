import 'package:json_annotation/json_annotation.dart';
import 'package:resto/apps/model/customer_review.dart';

import 'categories.dart';
import 'menu.dart';
part 'restaurant.g.dart';
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Restaurant {
  bool? error;
  String? message;
  int? count;
  int? founded;
  List<RestaurantsDetails>? restaurants;
  RestaurantsDetails? restaurant;
  Restaurant({this.error, this.message, this.founded, this.count, this.restaurant,this.restaurants});
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class RestaurantsDetails {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  String? address;
  double? rating;
  List<Categories>? categories;
  Menu? menus;
  List<CustomerReview>? customerReviews;
  RestaurantsDetails({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });
  factory RestaurantsDetails.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantsDetailsToJson(this);
}
