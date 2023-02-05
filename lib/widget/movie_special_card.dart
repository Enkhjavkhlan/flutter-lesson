import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  const MovieSpecialCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return Container(
      height: size * 1.5,
      width: size,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(data.imgUrl), fit: BoxFit.fill)),
      child: Icon(
        Icons.play_circle,
        color: Colors.grey.withOpacity(0.7),
        size: 50,
      ),
    );
  }
}
