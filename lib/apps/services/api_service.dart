import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resto/apps/model/restaurant.dart';

class ApiService extends ChangeNotifier{
  String baseUrl = 'https://restaurant-api.dicoding.dev';
  Future<Restaurant> fetchAllRestaurant() async {
    final response = await http.get(Uri.parse('$baseUrl/list'));
    if(response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    }else {
      throw Exception('tidak bisa mendapatkan data');
    }
  }
  Future<Restaurant> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse('https://restaurant-api.dicoding.dev/search?q=$query'));
    if(response.statusCode == 200 ) {
      return Restaurant.fromJson(json.decode(response.body));
    }else {
      throw Exception('Pencarian tidak berhasil mendapatkan data');
    }
  }
  Future<RestaurantsDetails> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/detail/$id'));
    if(response.statusCode == 200) {
      final result = json.decode(response.body)['restaurant'];
      notifyListeners();
      return RestaurantsDetails.fromJson(result);

    }else {
      throw Exception("Gagal mendapatkan data");
    }
  }
   
  
}
