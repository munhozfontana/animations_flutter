import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  final String title;
  const ImplicitAnimationsPage({Key key, this.title = "ImplicitAnimations"})
      : super(key: key);

  @override
  _ImplicitAnimationsPageState createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  String owl_url =
      'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[Image.network(owl_url)],
      ),
    );
  }
}
