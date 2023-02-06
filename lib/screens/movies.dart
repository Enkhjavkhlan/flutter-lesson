import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/widget/movie_card.dart';
import 'package:movie/widget/movie_special_card.dart';

class MoviesPage extends StatefulWidget {
  final List<int> wishListId;
  final void Function(int) onToggleWishList;
  const MoviesPage(this.wishListId, this.onToggleWishList, {super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    //print("res: $res");
    return MovieModel.fromList(jsonDecode(res));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _specialData = snapshot.data!.length > 3
                ? snapshot.data!.sublist(0, 3)
                : snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Шилдэг",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          _specialData.length,
                          (index) => MovieSpecialCard(_specialData[index],
                              widget.onToggleWishList, widget.wishListId)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Бүх кинонууд",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => MovieCard(snapshot.data![index],
                              widget.wishListId, widget.onToggleWishList)),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
