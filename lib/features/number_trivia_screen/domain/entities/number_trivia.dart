// ignore_for_file: recursive_getters

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class NumberTrivia extends Equatable {
  final String text;
  final int number;

  const NumberTrivia({
    required this.text,
    required this.number,
  }) : super();

  @override
  List<Object?> get props => props;
}
