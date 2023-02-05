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
  int _currentindex = 0;
  List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];

  void setCurrentIndex(int val) {
    setState(() {
      _currentindex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _totalPage[_currentindex],
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
