import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detail.dart';
import 'package:movie/widget/my_bottomsheet.dart';
import 'package:movie/widget/my_dialog.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;
  const MovieCard(this.data, {super.key});

  void _onCardTap(BuildContext context) {
    //showBottomSheet(context: context, builder: (context) => MyBottomSheet());
    // showModalBottomSheet(
    //     context: context, builder: (context) => MyBottomSheet());
    showDialog(
        context: context,
        builder: (context) => MyDialog(data),
        useSafeArea: false); // ip der deed tal awna
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 3 - 20;
    return InkWell(
      onTap: () => _onCardTap(context),
      child: Column(
        children: [
          Container(
            height: size * 1.5,
            width: size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(data.imgUrl), fit: BoxFit.fill)),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: size,
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}
