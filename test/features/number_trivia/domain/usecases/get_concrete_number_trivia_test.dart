// ignore_for_file: unused_local_variable, prefer_const_declarations, prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia_screen/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia_screen/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia_screen/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'should get trivia for the number from the repository',
    () async {
      //arrage
      when(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase?.execute(number: tNumber);
      //assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
