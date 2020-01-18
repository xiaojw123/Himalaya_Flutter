class RecommendItem {
  String title;
  String coverLarge;
  String intro;
  String author;
  String avtar;


  RecommendItem(this.title, this.intro, this.coverLarge);
}

class Program {


  String coverUrl;
  String title;
  String authorName;
  String authorAvatar;
  String subscribeNum;
  String intro;
  List<String> itemList;

  Program(this.title, this.coverUrl, this.authorName, this.authorAvatar,
      this.subscribeNum,
      this.intro,
      this.itemList);


}

class HotRecommendItem {

  String title;

  List<RecommendItem> items;

  HotRecommendItem(this.title, this.items);

}


