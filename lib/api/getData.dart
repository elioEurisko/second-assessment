import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class getData with ChangeNotifier {
  static fetchData(method) async {
    Uri url;
    if (method == 'current') {
      url = Uri.https('api.weatherapi.com', '/v1/current.json', {
        'q': '34.02139053920694,35.647088393446026',
        'key': 'e544d902367748edb3961932232106'
      });
    } else {
      url = Uri.https('api.weatherapi.com', '/v1/forecast.json', {
        'q': '34.02139053920694,35.647088393446026',
        'key': 'e544d902367748edb3961932232106'
      });
    }
print('method $method');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      var result = jsonResponse;
      print('http result: $result.');
      return result;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
