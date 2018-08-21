import 'package:flutter/material.dart';
import 'package:emall/pages/main.dart';

class TabPage extends StatefulWidget {
  @override
  TabPageState createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(
        length: 5,  //需要控制的Tab页面数量
        vsync: this //动画效果的异步处理 默认格式
    );
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            DiscoverPage(),
            ShopcarPage(),
            RightsPage(),
            MinePage()
          ]),
      bottomNavigationBar: Material(
        color: Colors.grey[100],
        child: TabBar(
            isScrollable: false,
            indicatorColor: Colors.transparent,
            controller: controller,
            tabs: <Widget>[
              TabBarItem(
                text: '首页',
                selectedIconName: 'assets/images/tabbar/icon_home_HL.png',
                normalIconName: 'assets/images/tabbar/icon_home.png',
                selected: selectedIndex == 0,
              ),
              TabBarItem(
                text: '发现',
                selectedIconName: 'assets/images/tabbar/icon_discover_HL.png',
                normalIconName: 'assets/images/tabbar/icon_discover.png',
                selected: selectedIndex == 1,
              ),
              TabBarItem(
                text: '购物车',
                selectedIconName: 'assets/images/tabbar/icon_shopcar_HL.png',
                normalIconName: 'assets/images/tabbar/icon_shopcar.png',
                selected: selectedIndex == 2,
              ),
              TabBarItem(
                text: '权益中心',
                selectedIconName: 'assets/images/tabbar/icon_interest_HL.png',
                normalIconName: 'assets/images/tabbar/icon_interest.png',
                selected: selectedIndex == 3,
              ),
              TabBarItem(
                text:'我的',
                selectedIconName: 'assets/images/tabbar/icon_mine_HL.png',
                normalIconName: 'assets/images/tabbar/icon_mine.png',
                selected: selectedIndex == 4,
              )
            ]
        ),
      ),
    );
  }
}