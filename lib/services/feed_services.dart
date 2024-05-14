import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/feed_model.dart';

import './api_status.dart';

class FeedServices {
  static Future<Object?> getFeed() async {
    try {
      var url = Uri.parse('https://rubidya.com/api/users/get-media');
      print(url);
      var response = await http.get(url,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I',
    });

      if (response.statusCode == 200) {
        print("api success");
        return Success(response: feedFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 102, errorResponse: 'Unknown Error');
    }
  }
}