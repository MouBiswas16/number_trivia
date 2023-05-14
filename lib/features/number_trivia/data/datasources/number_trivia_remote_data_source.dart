// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/error/exception.dart';

import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client? client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

  @override
  Future<NumberTriviaModel> getConreteNumberTrivia(int number) =>
      _getTriviaFromUrl(
        "http:numberapi.com/$number",
      );

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() => _getTriviaFromUrl(
        "http:numberapi.com/random",
      );

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client?.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response?.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response!.body));
    } else {
      throw ServerException();
    }
  }
}
