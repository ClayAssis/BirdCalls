import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String gen;
  final String sp;
  final String en;
  //final String cnt;
  final String loc;

  const CustomCard({
    Key? key,
    required this.gen,
    required this.sp,
    required this.en,
    //required this.cnt,
    required this.loc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Text(
          "$gen $sp",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          "English: $en",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 10.0),
        //Text(
        //"Country: $cnt",
        //textAlign: TextAlign.center,
        //style: const TextStyle(
        //color: Colors.white,
        //fontSize: 16.0,
        //),
        //),
        const SizedBox(height: 10.0),
        Text(
          "Loc: $loc",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
