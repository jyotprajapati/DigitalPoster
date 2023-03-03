import 'dart:convert';

import 'package:dposter/Models/categoryFrameModel.dart';
import 'package:dposter/Models/categoryModel.dart';
import 'package:http/http.dart' as http;

import '../Constant/globalVariables.dart';
import '../Models/customCategoryModel.dart';

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

  Future<CategoryFramesModel> getCategoryFrames(
      {required int categoryNumber}) async {
    try {
      String endPoint = "public/getcategory_frames";
      var apiUrl = Uri.parse(baseUrl + endPoint);
      var response = await http.post(apiUrl, body: {
        "category_id": "$categoryNumber",
      });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse['data'][0]);
        CategoryFramesModel categoryFrames = jsonResponse['data'][0]
            .map((json) => CategoryFramesModel.fromJson(json));
        print(categoryFrames);
        return categoryFrames;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CustomCategoryModel>> getCustomCategories() async {
    try {
      String endPoint = "public/get_custom_categories";
      var apiUrl = Uri.parse(baseUrl + endPoint);
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<CustomCategoryModel> categories = jsonResponse['data']
            .map<CustomCategoryModel>(
                (json) => CustomCategoryModel.fromJson(json))
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
