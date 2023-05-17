// part 'number_trivia_event.dart';
// part 'number_trivia_state.dart';

// class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
//   NumberTriviaBloc() : super(NumberTriviaInitial()) {
//     on<NumberTriviaEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'package:bloc/bloc.dart';
// import './bloc.dart';

import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  @override
  NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
