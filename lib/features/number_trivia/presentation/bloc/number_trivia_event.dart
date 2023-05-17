// part of 'number_trivia_bloc.dart';

// abstract class NumberTriviaEvent extends Equatable {
//   const NumberTriviaEvent();

//   @override
//   List<Object> get props => [];
// }

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  NumberTriviaEvent([List props = const <dynamic>[]]) : super(props);
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
