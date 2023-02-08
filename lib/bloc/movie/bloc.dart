import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/bloc/movie/states.dart';
import 'package:movie/services/api/index.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieTest>((event, emit) async {
      // event = movieTest,  emit = bloc
      // return gj bolno return gevel 1 udaa butsaadag bol emit n duusahgui ajilaad baidag bainga utga bitsaana.
      emit(MovieLoading());
      try {
        final api = ApiService();
        final data2 = await api.getRequest("/packages/dio", true);
        print(data2.data);
        emit(MovieSuccess([]));
      } catch (ex) {
        emit(MovieFailure(ex.toString()));
      }
    });
  }
}
