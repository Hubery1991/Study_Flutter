import 'package:flutter/material.dart';
import 'package:emall/widgets/home_banner.dart';
import 'dart:convert';
import 'package:emall/models/ad.dart';
import 'package:emall/widgets/home_convience.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Ad> adList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //network request here
    Ad myAd1 = Ad(adType: 1000, pic:'home/home-banner-activity.jpg');
    Ad myAd2 = Ad(adType: 2000, pic: 'home/home-gift-banner.jpg');
    adList = [myAd1,myAd2];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        title: Text(
          '积分云商',
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffd90e3d),
      ),
      body: new Container(
        child: new ListView(
          primary: true,
          children: <Widget>[
            new HomeBanner(banners: adList),
            new HomeConvience()
          ],
        ),
      ),
    );
  }

}