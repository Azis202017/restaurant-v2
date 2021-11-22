// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      founded: json['founded'] as int?,
      count: json['count'] as int?,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantsDetails.fromJson(
              json['restaurant'] as Map<String, dynamic>),
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurantsDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'founded': instance.founded,
      'restaurants': instance.restaurants?.map((e) => e.toJson()).toList(),
      'restaurant': instance.restaurant?.toJson(),
    };

RestaurantsDetails _$RestaurantsDetailsFromJson(Map<String, dynamic> json) =>
    RestaurantsDetails(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      pictureId: json['pictureId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      menus: json['menus'] == null
          ? null
          : Menu.fromJson(json['menus'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      customerReviews: (json['customerReviews'] as List<dynamic>?)
          ?.map((e) => CustomerReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantsDetailsToJson(RestaurantsDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'address': instance.address,
      'rating': instance.rating,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'menus': instance.menus?.toJson(),
      'customerReviews':
          instance.customerReviews?.map((e) => e.toJson()).toList(),
    };
