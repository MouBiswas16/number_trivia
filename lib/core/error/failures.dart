// ignore_for_file: prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
