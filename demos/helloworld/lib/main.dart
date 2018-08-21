import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:isolate';
import 'config.dart';
import 'package:url_launcher/url_launcher.dart';


//dart 中单行函数或方法的简写
//void main() => runApp(new MyApp());

//void main() {
//  runApp(new SampleApp());
//}

//void main() => runApp(new CustomApp());

//void main() => runApp(new MaterialApp(home: new DemoApp()));

void main() {
  runApp(new LauncherApp());
}

class LauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'preview',
      theme: new ThemeData(
        primaryColor: Colors.yellow[400]
      ),
      home: new RaisedButton(
          child: new Text('preview baidu webpage',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.pink
                          ),),
          onPressed: _showBaiDuWebPage()),
    );
  }

  _showBaiDuWebPage() async {
    const baiduLink = "https://www.baidu.com";
    if (await canLaunch(baiduLink)) {
      await launch(baiduLink);
    } else {
      throw 'Could not launch $baiduLink';
    }
  }
}

/** Flutter for web developer */
TextStyle bold24Roboto = new TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
);

var container = new Container(
  child: new Center(
    child: new Text(
      "Lorem ipsum",
      style: bold24Roboto,
    ),
  ),
  width: 300.0,
  height: 240.0,
  color: Colors.brown,
);


var container2 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        "Hello Hubery",
        style: bold24Roboto,
      ),
        decoration: new BoxDecoration(
          color: Colors.red[400],
        ),
        padding: new EdgeInsets.all(16.0),
        width: 240.0,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


var container3 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        "Hubery 小海".toUpperCase(),
        style: new TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          letterSpacing: 4.0,
          fontWeight: FontWeight.w900
        ),
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400],
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 375.0,
  height: 240.0,
  color: Colors.grey[300],
);

var container4 = new Container(
  child: new Center(
    child: new Container(
      child: new RichText(
          text: new TextSpan(
            style: bold24Roboto,
            children: <TextSpan>[
              new TextSpan(text: "Lorem    "),
              new TextSpan(
                text: "ipsum",
                style: new TextStyle(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 48.0,
                )
              )
            ]
          ),
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400],
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 375.0,
  height: 240.0,
  color: Colors.green[300],
);

var container5 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        "Lorem ipsum dolor sit amet, consec etur",
        style: new TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      padding: new EdgeInsets.all(16.0),
      decoration: new BoxDecoration(
        color: Colors.red[400],
      ),
    ),
  ),
  width: 375.0,
  height: 240.0,
  color: Colors.green[300],
);

class MyApp extends StatelessWidget {
  @override
//  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      theme: new ThemeData(
//        primaryColor: Colors.teal,
//      ),
//      home: RandomWords(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('flutter first lesson what'),
//        ),
//        body: new Center(
//            child: new RandomWords(),
////          child: new Text(wordPair.asPascalCase),
////          child: new Image.network('https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2860562845,2830174104&fm=173&app=25&f=JPEG?w=218&h=146&s=3F1A6A81014332E05A2C84990100E0C3')
//        ),
//      ),
//    );
//  }

  /** Flutter for Web开发者 */
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'flutter for web developer',
      theme: new ThemeData(
          primaryColor:Colors.redAccent
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('web developer'),
        ),
        body: new loginNameApp(),
      ),
    );
  }



}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>(); //创建集合变量用来存储用户喜欢收藏的单词

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
        );
        final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
           )
        .toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved suggestions'),
          ),
          body: new ListView(children: divided),
        );
        },
      ),
    );
  }

  @override
  Widget build (BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

/** Flutter for Android developer */

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData.light(),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();

}

class _SampleAppPageState extends State<SampleAppPage> {
  //默认文字内容
//  String textToShow = "I like Flutter";
//
//  void _updateText() {
//    setState(() {
//      textToShow = "Flutter is Awesome!";
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Sample App"),
//      ),
//      body: new Center(
//        child: new Text(textToShow),
//      ),
//      floatingActionButton: new FloatingActionButton(
//          onPressed: _updateText,
//          tooltip: "Update Text",
//        child: new Icon(Icons.update),
//      ),
//    );
//  }

  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();

    getIPAddress();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  @override
  Widget build(BuildContext context) {
    print(widgets);
    return Scaffold(
      appBar: AppBar(
        title: new Text('http demo'),
      ),
      body: getBody()
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Row ${widgets[i]['title']}"),
      ),
      onTap: () {
        print('row $i');
      },
    );
  }


  loadData() async {
    String dataURL =  reqPath.jsonData;
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  getIPAddress() {
    http.get(reqPath.ipaddress).then((value) {
      print('当前的IP地址：'+json.decode(value.body)['origin']);
    }).catchError((error) {
      print(error);
    });
  }
}


class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}
class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(painter: new SignaturePainter(_points)),
    );
  }
}
class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
}

class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {
      print("点击了按钮啦！");
    },child: new Text(label));
  }
}

class CustomApp extends StatelessWidget {
  Widget build(BuildContext context) => new Center(
    child: new CustomButton('深圳市腾讯科技有限公司'),
  );
}


class RouterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '导航路由',
      routes: <String, WidgetBuilder> {
        '/a' : (BuildContext context) => new CustomApp(),
        '/b' : (BuildContext context) => new DemoApp(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Hello 导航"
          ),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text('Column One'),
            new Text('Column Tow'),
            new Text('Column Three'),
            new Text('Column Four'),
            new CustomApp(),
            new loginNameApp(),
          ],
        ),
      ),
    );
  }
}

class loginNameApp extends StatelessWidget {
  Widget build(BuildContext context) {
       return new TextField(
         textAlign: TextAlign.left,
         decoration: new InputDecoration(
           hintText: '请输入您的手机号'
         ),
       );
  }
}

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http request'.toUpperCase(),
      theme: new ThemeData(
        primaryColor: Colors.greenAccent[300]
      ),
      home: new SampleAppPage(),
    );
  }
}
