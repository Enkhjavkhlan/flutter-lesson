import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel data;
  const MovieDetailPage(this.data, {super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Provider.of<CommonProvider>(context, listen: false).isLogged) {
        Provider.of<CommonProvider>(context, listen: false).changeCurrentIdx(2);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Нэвтрэнэ үү")));
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 34, 37),
        body: SafeArea(
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
                          widget.data.imgUrl,
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
                                  widget.data.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.data.publishedYear} | ${widget.data.durationMin} | ${widget.data.type}",
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
                              onPressed: () =>
                                  provider.addWishList(widget.data.id),
                              icon: Icon(
                                provider.isWishMovue(widget.data)
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
                        widget.data.description ?? '',
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
        ),
      );
    });
  }
}
