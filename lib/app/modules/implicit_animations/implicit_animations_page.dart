import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  final String title;
  const ImplicitAnimationsPage({Key key, this.title = "ImplicitAnimations"})
      : super(key: key);

  @override
  _ImplicitAnimationsPageState createState() => _ImplicitAnimationsPageState();
}

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  // Fade-in
  double opacity = 0.0;
  String owl_url =
      'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

  // ShapShift
  Color color = Colors.red;
  double borderRadius = 0;
  double margin = 0;

  void shapShift() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          //******* Fade-in *******
          Image.network(owl_url),
          MaterialButton(
            child: Text(
              'Show details',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () => setState(() {
              opacity = 1;
            }),
          ),
          AnimatedOpacity(
            child: Column(
              children: <Widget>[
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
            duration: Duration(seconds: 2),
            opacity: opacity,
          ),
          Divider(
            height: 50,
          ),
          //****** ShapShift *******

          SizedBox(
            width: 128,
            height: 128,
            child: AnimatedContainer(
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              duration: Duration(milliseconds: 400),
            ),
          ),
          MaterialButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'change',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => shapShift(),
          ),
          Divider(
            height: 50,
          ),
        ],
      ),
    );
  }
}
