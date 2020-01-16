class RecommendItem {
  String title;
  String coverLarge;

  RecommendItem(this.title, this.coverLarge);
}

class HotRecommendItem {

  String title;

  List<RecommendItem> items;

  HotRecommendItem(this.title, this.items);

}


