
import 'package:flutter/material.dart';
import 'package:himalaya_flutter/data/bean.dart';

class ProgramListPage extends StatefulWidget {
  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  Program program;

  _ProgramListPageState() {
    var indexList = List(10990);
    List<String> itemList = List<String>();

    for (int i = 0; i < indexList.length; i++) {
      itemList.add("夜天子$i");
    }

    program = Program(
        "夜天子",
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2782988102,1210974851&fm=26&gp=0.jpg",
        "月关",
        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2215633676,1791245232&fm=26&gp=0.jpg",
        "2320万+",
        "明朝架空",
        itemList);
    print("pr c");
  }

  @override
  Widget build(BuildContext context) {
    print("pr build__"+program.title);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                    left: 20,
                    top: 112,
                    child: Image.network(
                      program.coverUrl,
                      width: 109,
                      height: 109,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    child: Text(
                  program.title,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Positioned(
                  left: 321,
                  top: 200,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.network(program.authorAvatar),
                      ),
                      Text(
                        program.authorName,
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[Text("节目"), Text("找相似"), Text("圈子")],
            ),

          ],
        ));
  }
}
