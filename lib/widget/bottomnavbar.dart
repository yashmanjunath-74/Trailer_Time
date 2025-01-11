import 'package:flutter/material.dart';
import 'package:trailertime/screens/homescreen.dart';
import 'package:trailertime/screens/newmovie.dart';
import 'package:trailertime/screens/newshot.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                height: 100,
                icon: Icon(
                  Icons.play_circle_fill_sharp,
                  size: 70,
                ),
              ),
              Tab(
                icon: Icon(Icons.newspaper),
                text: "News & Hot",
              )
            ],
            unselectedLabelColor: Color(0xFF999999),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: const TabBarView(children: [homescreen(), Newmovie(), newshot()]),
      ),
    );
  }
}
