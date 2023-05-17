// ignore_for_file: prefer_const_constructors_in_immutables, recursive_getters, invalid_required_positional_param, import_of_legacy_library_into_null_safe, override_on_non_overriding_member

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecasses/usecase.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> calls(
    // it should be call instead of calls, bcz it gets an error thats why its calls just for make code problem free
    Params params,
  ) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class Params extends Equatable {
  final int number;

  Params(@required this.number) : super();
}
