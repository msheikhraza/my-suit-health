import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<Response> baseApi(String url, String method, {dynamic body}) async {
    var response;
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    switch (method) {
      case 'post':
        {
          response = await http
              .post(Uri.parse(url),
                  headers: userHeader, body: json.encode(body))
              .timeout(const Duration(seconds: 30));
        }
        break;
      case 'get':
        {
          response = await http
              .get(Uri.parse(url), headers: userHeader)
              .timeout(const Duration(seconds: 30));
        }
        break;
      case 'put':
        {
          response = await http
              .put(Uri.parse(url), headers: userHeader, body: json.encode(body))
              .timeout(const Duration(seconds: 30));
        }
        break;
      case 'delete':
        {
          response = await http
              .delete(Uri.parse(url),
                  headers: userHeader, body: json.encode(body))
              .timeout(const Duration(seconds: 30));
        }
        break;
      default:
        {
          log('Invalid choice');
        }
        break;
    }
    return response;
  }
}
