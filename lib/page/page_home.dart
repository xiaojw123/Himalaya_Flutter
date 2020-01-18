import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:himalaya_flutter/data/bean.dart';
import 'package:himalaya_flutter/page/page_detail.dart';
import '../common/params.dart';
import "package:dio/dio.dart";
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final TAB_ARRAY = ["推荐", "VIP", "小说", "直播", "儿童", "音乐", "电台", "专题"];
  var tabCtrl;
  var recommendTitlte = "";
  var recItemBeanList = List<HotRecommendItem>();

  List getPageWiget() {
    var pageList = List<Widget>();
    for (var i = 0; i < TAB_ARRAY.length; i++) {
      var page;
      if (i == 0) {
        page = getRecmmendPage();
      } else {
        page = getOtherPage(i);
      }
      pageList.add(page);
    }
    return pageList;
  }

  Widget getRecmmendPage() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Banner(),
        Zone(),
        Column(
          children: recItemBeanList.map((e) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Column(
                children: <Widget>[
                  Text(
                    e.title,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      height: 2,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProgramListPage()));
                      },
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                        children: e.items.map((e) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                  e.coverLarge,
                                  fit: BoxFit.fill,
                                  width: 109,
                                  height: 109,
                                ),
                                Text(
                                  e.title,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  e.intro,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ))
                ],
              ),
            );
          }).toList(),
        ),
      ],
    ));
  }

  Widget getOtherPage(num index) {
    return Center(
      child: Text("$num()"),
    );
  }

  @override
  void initState() {
    super.initState();
    var future = getRecommendList();
    future.then((val) {
      print("val_" + val.statusMessage);
      if (val.statusCode == 200) {
        String data = val.data.toString();
        print("RES_DATA___" + data + "__l_");
        Map<String, dynamic> map = json.decode(data);
//        String title = map["hotRecommends"]["title"];

        Map<String, dynamic> hotRecMap = map["hotRecommends"];
        setState(() {
          recommendTitlte = hotRecMap["title"];
          List hotRecItems = hotRecMap["list"];
          recItemBeanList = List<HotRecommendItem>();
          for (var hotItem in hotRecItems) {
            var itemList = hotItem["list"];
            var recommendItemList = List<RecommendItem>();
            for (var item in itemList) {
              print("img url_" + item["coverLarge"]);
              var recommendItem = RecommendItem(
                  item["title"], item["intro"], item["coverLarge"]);
              recommendItemList.add(recommendItem);
            }
            recItemBeanList
                .add(HotRecommendItem(hotItem["title"], recommendItemList));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    tabCtrl =
        TabController(initialIndex: 0, length: TAB_ARRAY.length, vsync: this);
    ScreenUtil.init(context, width: 1080, height: 1920);

    return Scaffold(
      backgroundColor: Color(0xD3D3D3),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: TabBar(
          controller: tabCtrl,
          isScrollable: true,
          tabs: TAB_ARRAY.map((e) => Tab(text: e)).toList(),
          indicatorColor: Colors.white,
          indicatorWeight: 1,
          labelStyle: TextStyle(fontSize: 18),
          unselectedLabelStyle: TextStyle(fontSize: 15),
        ),
      ),
      body: TabBarView(
        controller: tabCtrl,
        children: getPageWiget(),
      ),
    );
  }

  Future<Response> getRecommendList() async {
    var dio = Dio();
    return await dio.get(
        "http://mobile.ximalaya.com/mobile/discovery/v3/recommend/hotAndGuess",
        queryParameters: {
          "code": "43_310000_3100",
          "device": "android",
          "version": "5.4.45"
        },
        options: Options(
          responseType: ResponseType.plain,
        ));
  }
}

class Banner extends Container {
  BuildContext mContext;
  final BANNER_IMG = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578827470037&di=b838b38b3938362d0b7b3b6d02e6d3ad&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20173_9_15%2Fa1haev3491717986619.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579422201&di=f42347e0f335dd0cbae1cf248e9c0c5d&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.cache.netease.com%2Fent%2F2016%2F5%2F12%2F20160512153345cbb8a.png",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2356369480,143228265&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=566160464,3173066033&fm=26&gp=0.jpg",
    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3237521912,3063271955&fm=26&gp=0.jpg"
  ];

  @override
  Widget get child => Container(
      height: ScreenUtil().setHeight(600),
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            mContext = context;
            return Image.network(
              BANNER_IMG[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: BANNER_IMG.length,
          loop: true,
          scrollDirection: Axis.horizontal,
          duration: 300,
          autoplay: true,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.0, right: 20.0),
              builder: SwiperPagination.dots),
          onTap: (index) {
//            Navigator.of(mContext).push(MaterialPageRoute(builder: (context) {
//              return DetailPage(index);
//            }));
          }));
}

class Zone extends Container {
  @override
  Widget get child => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                "imges/ic_rank.png",
                width: 45,
                height: 45,
              ),
              Text("经典必听")
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("imges/ic_daily.png", width: 45, height: 45),
              Text("每日听单")
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("imges/ic_sleep.png", width: 45, height: 45),
              Text("助眠解压")
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("imges/ic_boutique.png", width: 45, height: 45),
              Text("精品")
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset("imges/ic_overflow.png", width: 45, height: 45),
              Text("超值会员")
            ],
          )
        ],
      );

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.fromLTRB(0, 10, 0, 10);
}
