import 'dart:convert';

import 'package:birdcall/screens/player.dart';
import 'package:birdcall/screens/utils/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repository.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          FutureBuilder(
            future: Provider.of<Repository>(context, listen: false).fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "An error occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26,
                        ),
                        child: InkWell(
                          focusColor: Colors.redAccent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => Player(
                                      id: snapshot.data![index].id,
                                      gen: snapshot.data![index].gen,
                                      sp: snapshot.data![index].sp,
                                      en: snapshot.data![index].en,
                                      cnt: snapshot.data![index].cnt,
                                      loc: snapshot.data![index].loc,
                                      type: snapshot.data![index].type,
                                      file: snapshot.data![index].file,
                                      sono: snapshot.data![index].sono,
                                      length: snapshot.data![index].length,
                                    )),
                              ),
                            );
                          },
                          child: CustomCard(
                            gen: snapshot.data![index].gen,
                            sp: snapshot.data![index].sp,
                            en: snapshot.data![index].en,
                            //cnt: snapshot.data![index].cnt,
                            loc: snapshot.data![index].loc,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
