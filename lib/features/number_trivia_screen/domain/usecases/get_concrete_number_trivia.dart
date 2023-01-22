import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia_screen/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia_screen/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failures.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({
    required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
