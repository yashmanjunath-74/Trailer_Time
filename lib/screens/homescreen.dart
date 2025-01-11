import 'package:flutter/material.dart';
import 'package:trailertime/models/nowplayingmovie.dart';
import 'package:trailertime/models/top_rated.dart';
import 'package:trailertime/models/upcomingmoviemodel.dart';
import 'package:trailertime/screens/searchscrenn.dart';
import 'package:trailertime/services/apiservice.dart';
import 'package:trailertime/widget/coustumcrosel.dart';
import 'package:trailertime/widget/moviecard.dart';
import 'package:trailertime/widget/nowplayingmoviecard.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

Apiservice apiservice = Apiservice();

late Future<Upcomingmoviemodel> upcoming;
late Future<Nowplaying> nowplaying;
late Future<TopRated> toprated;

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    upcoming = apiservice.getupcomingmovie();
    nowplaying = apiservice.getnowplayingmovie();
    toprated = apiservice.gettopratedmovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.png',
            height: 100,
            width: 150,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Searchscreen()));
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<TopRated>(
                  future: toprated,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Coustumcrosel(data: snapshot.data!);
                    } else {
                      return const SizedBox();
                    }
                  }),
              SizedBox(
                  height: 200,
                  child: Moviecard(
                      feture: upcoming, Moviename: "Up coming Movie")),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: Nowplayingmoviecard(
                    feture: nowplaying, Moviename: "Now playing"),
              )
            ],
          ),
        ));
  }
}
