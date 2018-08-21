import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String text;
  final String selectedIconName;
  final String normalIconName;
  final bool selected;

  TabBarItem({this.text, this.selectedIconName,this.normalIconName, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Color(0xffd90e3d);
    final Color normalColor = Color(0xff888888);

    return Container(
      height: 48.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
              image: AssetImage(selected ? selectedIconName : normalIconName),
              width: 32.0,
              height: 32.0,
              fit: BoxFit.contain,),
          Text(
            text,
            style: TextStyle(
              fontSize: 11.0,
              color: selected ? selectedColor : normalColor,
            ),
          )
        ],
      ),
    );
  }
}
