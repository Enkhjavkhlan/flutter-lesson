import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieGetAll extends MovieEvent {
  const MovieGetAll();
  @override
  List<Object?> get props => [];
}
