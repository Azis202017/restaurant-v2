import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddReviewProvider extends ChangeNotifier {
  Future<void> postReview(String id, String name, String review) async {
    Uri url = Uri.parse('https://restaurant-api.dicoding.dev/review');
    var hasilResponse = await http.post(
      url,
      body: {
        "id": id,
        "name": name,
        "review": review,
      },
    );
    var data = json.decode(hasilResponse.body)['customerReviews'];
    print(data);
    notifyListeners();
    return data;
  }
}
