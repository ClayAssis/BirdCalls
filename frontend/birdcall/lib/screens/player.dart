// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:birdcall/screens/utils/new_box.dart';
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String id;
  final String gen;
  final String sp;
  final String en;
  final String cnt;
  final String loc;
  final String type;
  final String file;
  final String sono;
  final String length;

  const Player({
    Key? key,
    required this.id,
    required this.gen,
    required this.sp,
    required this.en,
    required this.cnt,
    required this.loc,
    required this.type,
    required this.file,
    required this.sono,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NewBox(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ),
                    const Text("P L A Y E R"),
                    const SizedBox(
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                flex: 6,
                child: NewBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/player.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                en,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$gen $sp",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Country: $cnt",
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Type: $type",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 300,
                                height: 39,
                                child: Text(
                                  loc,
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('0:00'),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.play_arrow)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.repeat)),
                    Text(length),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const LinearProgressIndicator(
                minHeight: 10,
                value: 0.5,
                color: Colors.green,
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
