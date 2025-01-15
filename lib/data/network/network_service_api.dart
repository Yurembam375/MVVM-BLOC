import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blocwitmvvm/data/exception/appException.dart';
import 'package:blocwitmvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInterntException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInterntException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();

      case 500:
        throw FetchDataException(
            "Error communication${response.statusCode}");
    }
  }
}
