import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:assignment_test/modals/usermodal.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiSevices {
  static String baseURL =
      'http://adminapp.tech/sharefeelings/api/posts?category=12&subcategory=15';

  static Future<Map> getPosts() async {
    Response response = await get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);

      return body;
    } else {
      throw "Failed to load data";
    }
  }

  static Future<List<UserModel>?> getBooks() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await http.get(Uri.parse(url));

      var jsonMap = jsonDecode(response.body);
      List<dynamic> data = jsonMap;

      List<UserModel> rs =
          List<UserModel>.from(data.map((e) => UserModel.fromJson(e)));
      print(rs.length);
      return rs;
    } on SocketException {
      print('No Internet connection ');
    } on FormatException {
      print("Bad response format ");
    }
    return null;
  }
}
