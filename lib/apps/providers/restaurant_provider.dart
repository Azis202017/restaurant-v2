import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/services/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }
  late Restaurant _restaurantResult;
  late ResultState _state;
  String _message = '';
  String get message => _message;
  Restaurant get result => _restaurantResult;
  ResultState get state => _state;
  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.fetchAllRestaurant();
      if (restaurant.restaurants!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message =
          "Tidak ada internet nyalahkan terlebih dahulu wifi atau data anda";
    }
  }
}
