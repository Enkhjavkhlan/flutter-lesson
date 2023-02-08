import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieGetAll extends MovieEvent {
  const MovieGetAll();
  @override
  List<Object?> get props => [];
}

//63e37a70ebd26539d078fe9f
class MovieGetInfo extends MovieEvent {
  final int id;
  const MovieGetInfo(this.id);
  @override
  List<Object?> get props => [id];
}
