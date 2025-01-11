import 'package:flutter/material.dart';
import 'package:trailertime/models/nowplayingmovie.dart';
import 'package:trailertime/utils/utils.dart';

class Nowplayingmoviecard extends StatelessWidget {
  final String Moviename;
  final Future<Nowplaying> feture;

  const Nowplayingmoviecard(
      {super.key, required this.feture, required this.Moviename});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Nowplaying>(
        future: feture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Moviename,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                                // margin: EdgeInsets.all(3),
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '$imageurl${data[index].posterPath}',
                                    fit: BoxFit.fitHeight,
                                  ),
                                )),
                          );
                        }))
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
