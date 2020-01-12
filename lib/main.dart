import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final BANNER_IMG = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578827470037&di=b838b38b3938362d0b7b3b6d02e6d3ad&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20173_9_15%2Fa1haev3491717986619.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579422201&di=f42347e0f335dd0cbae1cf248e9c0c5d&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.cache.netease.com%2Fent%2F2016%2F5%2F12%2F20160512153345cbb8a.png",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2356369480,143228265&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=566160464,3173066033&fm=26&gp=0.jpg",
    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3237521912,3063271955&fm=26&gp=0.jpg"
  ];

  final NAV_ITEM = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.collections), title: Text("我听")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.mail), title: Text("发现")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text("账号")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("喜马拉雅"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              BANNER_IMG[index],
              fit: BoxFit.fitHeight,
              height: 300,
            );
          },
          itemCount: BANNER_IMG.length,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: NAV_ITEM,
        ));
  }
}

//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:himalaya_flutter/data/state.dart';
//import 'package:redux/redux.dart';
//import 'data/state.dart';
//void main() {
//  final store =
//      Store<CountState>(countReduce, initialState: CountState.initState());
//  runApp(TestApp(store));
//
//
//}

//class TestApp extends StatelessWidget {
//  final Store<CountState> countStore;
//
//  TestApp(this.countStore);
//
//  @override
//  Widget build(BuildContext context) {
//    return new StoreProvider(
//        store: countStore,
//        child: MaterialApp(
//          home:
//              StoreConnector(builder: (BuildContext context, CountState state) {
//            return TestHomePage(title: "page f h", countState: state);
//          }, converter: (Store<CountState> store) {
//            return store.state;
//          }),
//        ));
//  }
//}
//
//class TestHomePage extends StatefulWidget {
//  final String title;
//  final CountState countState;
//
//  TestHomePage({Key key, this.title, this.countState}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              '当前计数${countState.countIndex}',
//              style: Theme.of(context).textTheme.display1,
//            )
//          ],
//        ),
//      ),
//      floatingActionButton:
//          StoreConnector(builder: (BuildContext context, VoidCallback cb) {
//        return FloatingActionButton(
//          onPressed: cb,
//          child: Icon(Icons.add),
//        );
//      }, converter: (Store<CountState> store) {
//        return () => store.dispatch(EActions.Increase);
//      }),
//    );
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    throw UnimplementedError();
//  }
//}
//
//
//class MainAPP extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: Scaffold(
//            body: Stack(
//          children: <Widget>[new Positioned(top: 60, child: listCargeroy())],
//        )));
//  }
//
//  Widget listCargeroy() {
//    List<Widget> _list = new List();
//    var cargroyArray = const ["分类", "推广", "排行", "区域", "全站", "社区"];
//
//    for (var c in cargroyArray) {
//      _list.add(Stack(
//        children: <Widget>[
//          Positioned(
//              child: Text(c,
//                  style:
//                      TextStyle(color: Colors.lightGreenAccent, fontSize: 30)))
//        ],
//      ));
//    }
//    return ListView(scrollDirection: Axis.horizontal, children: _list);
//  }
//}
