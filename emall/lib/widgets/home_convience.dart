import 'package:flutter/material.dart';

class HomeConvience extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 85.0,
      child: Row(
        children: <Widget>[
          ConvienceView(title: '限时折扣'),
          ConvienceView(title: '秒杀'),
          ConvienceView(title: '权益'),
          ConvienceView(title: '赠送'),
          ConvienceView(title: '大转盘'),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}


class ConvienceView extends StatefulWidget {
  final String title;
  const ConvienceView({Key key, this.title}) : super(key: key);

  _ConvienceViewState createState() => _ConvienceViewState();
}

class _ConvienceViewState extends State<ConvienceView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          new Icon(
              Icons.language,
              size: 40.0,
          ),
          new Text(
            widget.title,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}