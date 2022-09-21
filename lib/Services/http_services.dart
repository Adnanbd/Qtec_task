import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qtec_task/Models/search_result.dart';

//https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice
class HttpService {
  final String baseUrl = "https://panel.supplyline.network/api/";
  final String searchUrl = "product/search-suggestions/?";
  final String productDetailsUrl = 'product-details/';
  

  Future<SearchResult> getHomeResponse(int limit, int offset, String searchText) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl${searchUrl}limit=$limit&offset=$offset&search=$searchText"));
      print("111 Status Code = ${response.statusCode}");
      print("111 Body = ${response.body}");

      if (response.statusCode == 200) {
        SearchResult result = SearchResult.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        return result;
      } else {
        throw "Unable to get the result";
      }
    } catch (e) {
      throw Exception("111Error == $e");
    }
  }

}
