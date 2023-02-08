import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/utils/index.dart';
import 'package:provider/provider.dart';

class MyBottomSheet extends StatelessWidget {
  final MovieModel data;

  const MyBottomSheet(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   title: Text(data.title),
            // ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                SizedBox(
                  width: size,
                  height: size * 1.3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        data.imgUrl,
                        width: size,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //color: Colors.amber,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_circle,
                                color: Colors.grey.withOpacity(0.5),
                                size: 80,
                              ),
                              SizedBox(height: 25),
                              Text(
                                data.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data.publishedYear} | ${Utils.integerMinToString(data.durationMin)} | ${data.type}",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff777777)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 40,
                            )),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () => provider.addWishList(data.id),
                            icon: Icon(
                              provider.isWishMovue(data)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              size: 40,
                            )),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Тайлбар",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      data.description ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            ))
          ],
        ),
      );
    });
  }
}
