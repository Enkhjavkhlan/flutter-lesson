import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie/bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/bloc/movie/states.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/widget/movie_card.dart';
import 'package:movie/widget/movie_special_card.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final _bloc = MovieBloc();
  bool _loading = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _bloc.add(MovieGetAll());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MovieBloc, MovieState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is MovieLoading) {
                setState(() {
                  _loading = true;
                });
              }
              if (state is MovieSuccess) {
                setState(() {
                  _loading = false;
                });
              }
              if (state is MovieFailure) {
                setState(() {
                  _loading = false;
                });
              }
            })
      ],
      child: Consumer<CommonProvider>(
        builder: (context, provider, child) {
          return _loading
              ? Center(
                  child: SizedBox(
                      child:
                          CircularProgressIndicator(color: Colors.blueAccent)),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "top".tr(),
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
                              provider.specialData.length,
                              (index) => MovieSpecialCard(
                                  provider.specialData[index])),
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
                          children: List.generate(provider.movies.length,
                              (index) => MovieCard(provider.movies[index])),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
