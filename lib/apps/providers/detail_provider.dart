import 'package:flutter/material.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/services/api_service.dart';

enum ResultState { loading, hasData, error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  String id;
  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _detailRestaurant(id);
    notifyListeners();
  }
  late RestaurantsDetails _restaurantsDetails;
  late ResultState _state;
  ResultState get state => _state;
  late String _message;
  String get message => _message;
  RestaurantsDetails get resultRestaurant => _restaurantsDetails;
  Future<dynamic> _detailRestaurant(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.detailRestaurant(id);

      _state = ResultState.hasData;
      notifyListeners();
      return _restaurantsDetails = restaurant;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error $e';
    }
  }
}
