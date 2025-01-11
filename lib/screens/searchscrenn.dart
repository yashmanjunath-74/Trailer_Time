import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trailertime/models/searchmodel.dart';
import 'package:trailertime/services/apiservice.dart';
import 'package:trailertime/utils/utils.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchcontroller = TextEditingController();
  Apiservice apiservice = Apiservice();

  Searchmodel? searchedmovie;

  void search(String query) {
    apiservice.getsearchmovie(query).then((results) {
      setState(() {
        searchedmovie = results as Searchmodel?;
        print(Searchscreen);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CupertinoSearchTextField(
                controller: searchcontroller,
                padding: const EdgeInsets.all(10),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  Icons.cancel,
                  color: Colors.black,
                ),
                backgroundColor: Colors.black.withOpacity(0.1),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    search(searchcontroller.text);
                  }
                },
              ),
              searchedmovie == null
                  ? const SizedBox.shrink()
                  : GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchedmovie!.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.2 / 2),
                      itemBuilder: (context, index) {
                        return searchedmovie!.results[index].backdropPath ==
                                null
                            ? Column(
                                children: [
                                  Image.asset(
                                    "assets/logo.png",
                                    height: 200,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          '$imageurl${searchedmovie!.results[index].backdropPath}',
                                          height: 200,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                ],
                              );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
