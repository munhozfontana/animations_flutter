import 'dart:async';
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

  //align
  double xAlign = 1.0;
  double yAlign = 1.0;
  double widthAlign = 50;
  double heightAlign = 50;
  double rotate = 0;

  //AnimatedContainer
  var animatedContainer = false;
  var callback;

  @override
  void initState() {
    Timer.periodic(
        Duration(seconds: 2),
        (Timer t) => setState(() {
              if (xAlign > 0 || yAlign > 0) {
                xAlign = -1;
                yAlign = -1;
                widthAlign = 50;
                heightAlign = 50;
                rotate = 0;
              } else {
                xAlign = 1;
                yAlign = 1;
                widthAlign = 150;
                heightAlign = 150;
                rotate = pi / 4;
              }
            }));
    super.initState();
  }

  void shapShift() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightPage = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height / 100) * 30;

    var width = MediaQuery.of(context).size.width;

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
            curve: Curves.easeInOutBack,
            opacity: opacity,
          ),
          Divider(
            height: 50,
          ),
          //****** ShapShift *******
          Container(
            height: heightPage,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 128,
                  height: heightPage / 2,
                  child: AnimatedContainer(
                    margin: EdgeInsets.all(margin.clamp(0, 1.0)),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    duration: Duration(seconds: 2),
                    curve: Curves.elasticOut,
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
              ],
            ),
          ),
          Divider(
            height: 50,
          ),
          Container(
            height: heightPage,
            child: AnimatedAlign(
              child: AnimatedContainer(
                color: Colors.red,
                width: widthAlign,
                height: heightAlign,
                transform: Matrix4.rotationZ(rotate),
                duration: Duration(seconds: 1),
                curve: Curves.elasticIn,
              ),
              duration: Duration(seconds: 2),
              alignment: Alignment(xAlign, yAlign),
              curve: Curves.easeInOutQuint,
            ),
          ),
          Divider(
            height: 50,
          ),
          Container(
            height: heightPage,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  animatedContainer = !animatedContainer;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  width: animatedContainer ? width : 100.0,
                  height: animatedContainer ? 100.0 : heightPage,
                  color: randomColor(),
                  alignment: animatedContainer
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutQuint,
                  child: FlutterLogo(
                    size: animatedContainer ? 25 : 75,
                    duration: Duration(seconds: 1),
                    curve: Curves.elasticOut,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
