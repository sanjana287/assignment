import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IEXcloud {
  final String api= "http://app.quotemedia.com/data/getQuotes.json?symbols=ORCL&webmasterId=104202";
  // final String key= "104202";
  
  Future fetchData(String symbol) async {
    try {
      var response = await http.get(
          Uri.parse(api));
      if (response.statusCode == 200) {
        return response.body;
      }
      else
        return Future.error("Unauthorised Request");
    }
    catch(e) {
      return Future.error(e);
    }
  }
}