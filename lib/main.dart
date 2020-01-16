import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page/page_home.dart';
import 'page/page_listener.dart';
import 'page/page_discover.dart';
import 'page/page_acount.dart';

void main() {
  print("main入口");
  IntrinsicWidth()
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp(), debugShowCheckedModeBanner: false,);
  }
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp>  {
  final NAV_ITEM = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(Icons.collections), title: Text("我听")),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text("发现")),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text("账号")),
  ];
  final NAV_PAGE = [HomePage(), ListenerPage(), DiscoverPage(), AcountPage()];

  var _index = 0;
  var currentPage;


  @override
  void initState() {
    super.initState();

    currentPage = NAV_PAGE[_index];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          items: NAV_ITEM,
          onTap: (index) {
            setState(() {
              _index = index;
              currentPage = NAV_PAGE[_index];
            });
          },
        )
    );
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
