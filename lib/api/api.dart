import 'package:dio/dio.dart';
import 'package:flutter_uas/model/response_category.dart';
import 'dart:async';

class Api {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=id&apiKey=b98ca1b3d8b84afabd28e81899bfb489';

  void printOutError(error, StackTrace stacktrace) {
    print('Exception occured: $error with stacktrace: $stacktrace');
  }

  Future<ResponseC> getAll() async {
    try {
      final response = await _dio.get(_baseUrl);
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getBisnis() async {
    try {
      final response = await _dio.get('$_baseUrl&category=business');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getHiburan() async {
    try {
      final response = await _dio.get('$_baseUrl&category=entertainment');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getKesehatan() async {
    try {
      final response = await _dio.get('$_baseUrl&category=health');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getSains() async {
    try {
      final response = await _dio.get('$_baseUrl&category=science');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getOlahraga() async {
    try {
      final response = await _dio.get('$_baseUrl&category=sport');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }

  Future<ResponseC> getTechnology() async {
    try {
      final response = await _dio.get('$_baseUrl&category=technology');
      return ResponseC.fromJson(response.data);
    } catch (error, stacktrace) {
      printOutError(error, stacktrace);
      return ResponseC.withError('$error');
    }
  }
}

