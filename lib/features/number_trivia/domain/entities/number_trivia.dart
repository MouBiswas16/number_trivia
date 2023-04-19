// ignore_for_file: recursive_getters, prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe

import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  NumberTrivia({
    required this.text,
    required this.number,
  }) : super();
}
