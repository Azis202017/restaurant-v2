import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/services/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  String query;
  SearchRestaurantProvider({required this.apiService, required this.query}) {
    _searchRestaurant(query);
    notifyListeners();
  }
  late Restaurant _restaurantResult;
  late String _message; 
  String get message => _message;
  late ResultState _state;
  Restaurant get result => _restaurantResult;
  ResultState get state => _state;
  Future<dynamic> _searchRestaurant(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.searchRestaurant(query);
      if (restaurant.restaurants!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "empty data";
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "error $e";
    }
  }
}
