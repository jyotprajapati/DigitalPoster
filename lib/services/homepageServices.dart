import 'dart:convert';

import 'package:dposter/Models/categoryModel.dart';
import 'package:http/http.dart' as http;

import '../Constant/globalVariables.dart';

class HomepageServices {
  Future<List<CategoryModel>> getCategories() async {
    try {
      String endPoint = "public/getcategory";
      var apiUrl = Uri.parse(baseUrl + endPoint);
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<CategoryModel> categories = jsonResponse['data']
            .map<CategoryModel>((json) => CategoryModel.fromJson(json))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
