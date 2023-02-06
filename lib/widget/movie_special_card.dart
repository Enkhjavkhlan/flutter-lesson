import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detail.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  final List<int> wishListids;
  final void Function(int) onToggleWishList;
  const MovieSpecialCard(this.data, this.onToggleWishList, this.wishListids,
      {super.key});

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                MovieDetailPage(data, wishListids, onToggleWishList)));
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return InkWell(
      onTap: () => _onCardTap(context),
      child: Container(
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
      ),
    );
  }
}
