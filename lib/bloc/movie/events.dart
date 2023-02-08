import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieTest extends MovieEvent {
  const MovieTest();
  @override
  List<Object?> get props => [];
}
