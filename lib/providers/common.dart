import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListids = [];
  int currentIdx = 0;
  bool isLogged = true;
  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  List<MovieModel> get wishMovies =>
      movies.where((element) => isWishMovue(element)).toList();

  void addWishList(int id) {
    if (wishListids.contains(id))
      wishListids.remove(id);
    else
      wishListids.add(id);
    notifyListeners();
  }

  bool isWishMovue(MovieModel data) {
    return wishListids.any((element) => element == data.id);
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void onLoggin() {
    isLogged = true;
    notifyListeners();
  }

  void onLogout() {
    isLogged = false;
    notifyListeners();
  }
}
