import 'package:flutter/material.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 2;
  // List<Widget> _totalPage = [MoviesPage(_wishListIds), WishListPage(), ProfilePage()];
  late List<Widget> _totalPage;

  List<int> _wishListIds = [];

  @override
  void initState() {
    super.initState();
    _totalPage = [
      MoviesPage(_wishListIds, _toggleWishList),
      WishListPage(_wishListIds, _toggleWishList),
      ProfilePage()
    ];
  }

  void _toggleWishList(int idx) {
    setState(() {
      if (_wishListIds.any((e) => e == idx)) {
        _wishListIds.remove(idx);
      } else
        _wishListIds.add(idx);
    });
  }

  void setCurrentIndex(int val) {
    setState(() {
      _currentindex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff36393f),
      body: SafeArea(
        child: _totalPage[_currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (value) => setCurrentIndex(value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Кино"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Дуртай"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профайл"),
        ],
      ),
    );
  }
}
