import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:developer';

import 'package:blocwitmvvm/data/exception/appException.dart';
import 'package:blocwitmvvm/data/network/base_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInterntException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request timed out, please try again.');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    if (kDebugMode) {
      log('Request URL: $url');
      log('Request Data: ${jsonEncode(data)}'); // Ensure data is logged as JSON
    }
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'}, // Add headers
            body: jsonEncode(data), // Encode data to JSON
          )
          .timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInterntException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request timed out, please try again.');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      // case 400:
      //   throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }
}
