import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  final String title;
  const ImplicitAnimationsPage({Key key, this.title = "ImplicitAnimations"})
      : super(key: key);

  @override
  _ImplicitAnimationsPageState createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  double opacity = 0.0;
  String owl_url =
      'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
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
          )
        ],
      ),
    );
  }
}
