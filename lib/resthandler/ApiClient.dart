import 'dart:convert';

import 'package:assignment/models/ResponseModel.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._();

  static final ApiClient apiClient = ApiClient._();

  static String baseUrl = 'http://www.mocky.io/v2/5ed00a8a32000066c2e3d869';

  Future<List<ResponseModel>> fetchData() async {
    try {
      var response = await await http.get(baseUrl);
      print(json.decode(response.body));
      Iterable l=json.decode(response.body);
      List<ResponseModel> listResponse =List<ResponseModel>.from(json.decode(response.body).map((x) => ResponseModel.fromJson(x)));
//      List<ResponseModel>.from(json.decode(response.body));
      return listResponse;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
