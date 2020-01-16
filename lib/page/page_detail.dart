import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int _index;

  DetailPage(this._index);

  @override
  _DetailPageState createState() => _DetailPageState(_index);
}

class _DetailPageState extends State<DetailPage> {
  int _index;

  _DetailPageState(this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("详情$_index"),
        ));
  }
}
