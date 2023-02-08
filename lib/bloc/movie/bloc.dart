import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/bloc/movie/states.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/services/api/index.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieGetAll>((event, emit) async {
      // event = movieTest,  emit = bloc
      // return gj bolno return gevel 1 udaa butsaadag bol emit n duusahgui ajilaad baidag bainga utga bitsaana.
      emit(MovieLoading());
      try {
        final api = ApiService();
        final res = await api.getRequest("/63e34fe6ace6f33a22d90d88", true);
        print(res.data);
        List<MovieModel> data = MovieModel.fromList(res.data['record']);
        emit(MovieSuccess(data));
      } catch (ex) {
        emit(MovieFailure(ex.toString()));
      }
    });
  }
}
