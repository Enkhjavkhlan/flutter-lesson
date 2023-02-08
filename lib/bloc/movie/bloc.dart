import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/bloc/movie/states.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/services/api/index.dart';
import 'package:provider/provider.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieGetAll>((event, emit) async {
      if (Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!,
              listen: false)
          .movies
          .isEmpty) {
        // event = movieTest,  emit = bloc
        // return gj bolno return gevel 1 udaa butsaadag bol emit n duusahgui ajilaad baidag bainga utga bitsaana.
        emit(MovieLoading());
        try {
          final api = ApiService();
          final res = await api.getRequest("/63e34fe6ace6f33a22d90d88", true);
          print(res.data);
          List<MovieModel> data = MovieModel.fromList(res.data['record']);
          Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!,
                  listen: false)
              .setMovies(data);
          //provider.movies d data ogno.
          emit(MovieSuccess());
        } catch (ex) {
          emit(MovieFailure(ex.toString()));
        }
      } else {
        //movies data tai buyu omnon unshtsan bhd
      }
    });
    on<MovieGetInfo>((event, emit) async {
      emit(MovieLoading());
      try {
        final api = ApiService();
        final res = await api.getRequest("/63e37a70ebd26539d078fe9f", true);
        print(res.data);
        MovieModel data = MovieModel.fromJson(res.data['record']);

        emit(MovieSuccessDetail(data));
      } catch (ex) {
        emit(MovieFailure(ex.toString()));
      }
    });
  }
}
