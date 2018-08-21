import 'package:flutter/material.dart';
import 'package:emall/models/ad.dart';
import 'package:emall/widgets/slider_indicator.dart';
import 'package:emall/api/config.dart';
import 'dart:async';

class HomeBanner extends StatefulWidget {
  final List<Ad> banners;

  const HomeBanner({Key key, this.banners}) : super(key: key);
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int sliderIndex = 0;
  bool runing = false;
  PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = new PageController();
    super.initState();
    run();
  }

  void run() async {
    this.runing = true;
    while (this.runing) {
      await Future.delayed(new Duration(seconds: 5));
      if (mounted) {
        this.setState(() {
          this.sliderIndex = this.sliderIndex == widget.banners.length - 1
              ? 0
              : this.sliderIndex + 1;
          this.controller.animateToPage(
            this.sliderIndex,
            duration: new Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 10.0, //阴影效果
          child: AspectRatio(
              aspectRatio: 375.0 / 175.0,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
                children: widget.banners
                  .map((ad) => GestureDetector(
                  onTap: () {
                    final adType = ad.adType;
                    print(adType);
                    //跳转指定页面
                  },
                  child: Image(image: NetworkImage(Config.ImgagePath+ad.pic),
                  ),
                ))
                .toList(),
              ),
          ),
        ),
        Padding(
            padding:const EdgeInsets.only(bottom: 20.0),
            child: SliderIndicator(count: widget.banners.length,index: sliderIndex),
        )
      ],
    );
  }
}