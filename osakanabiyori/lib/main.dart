import 'package:flutter/material.dart';

// 同じプロジェクトの別ファイル（hoge.dart）からプログラムを読み込む場合 import 'hoge.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int currentIndex = 0;

  // タブバーを構成するページのList（TabItemが仮に置かれている）
  final List<Widget> tabs = [
    // このTabItemを作ったプログラムに置き換えることによってページを実現する 
    TabItem("お魚一覧"),
    TabItem("レシピ一覧"),
    TabItem("お気に入り"),
    TabItem("info"),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // タブバーを実現している部分
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: new Text("お魚一覧"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_dining),
            title: new Text("レシピ一覧"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.star_border),
            title: new Text("お気に入り"),
          ),
          BottomNavigationBarItem(  
            icon: new Icon(
              Icons.info_outline),
            title: new Text("info"),          
          ),
        ],
      ),
    );
  }
}

// そのページの名前をappBarに表示するプログラム（仮に置いているので、最後は消える）
class TabItem extends StatelessWidget {
  final String title;
  const TabItem(this.title) : super();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text (
            this.title, 
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}