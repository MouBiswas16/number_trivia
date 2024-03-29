// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  NumberTriviaLocalDataSourceImpl? dataSource;
  MockSharedPreferences? mockSharedPreferences;

  setUp(
    () {
      mockSharedPreferences = mockSharedPreferences;
      dataSource = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences,
      );
      group(
        "getLastNumberTrivia",
        () {
          final tNumberTriviaModel = NumberTriviaModel.fromJson(
              json.decode(fixture("trivia_cached.json")));
          test(
            "should return NumberTrivia from SharedPreferences when there is one in the cache",
            () async {
              // arrange
              when(mockSharedPreferences?.getString(any))
                  .thenReturn(fixture("trivia_cached.json"));
              // act
              final result = await dataSource?.getLastNumberTrivia();
              // assert
              verify(mockSharedPreferences?.getString(CACHED_NUMBER_TRIVIA));
              expect(result, equals(tNumberTriviaModel));
            },
          );
          test(
            "should throw CacheExeption when there is not a cached value",
            () async {
              // arrange
              when(mockSharedPreferences?.getString(any)).thenReturn(null);
              // act
              final call = dataSource?.getLastNumberTrivia;
              // assert
              expect(() => call, throwsA(TypeMatcher<CacheException>));
            },
          );
        },
      );
    },
  );

  group(
    "cacheNumberTrivia",
    () {
      final tNumberTriviaModel =
          NumberTriviaModel(text: "test trivia", number: 1);

      test(
        "should call SharedPrefernces to cache the data",
        () async {
          // act
          dataSource?.cacheNumberTrivia(tNumberTriviaModel);
          // assert
          final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
          verify(mockSharedPreferences?.setString(
              CACHED_NUMBER_TRIVIA, expectedJsonString));
        },
      );
    },
  );
}
