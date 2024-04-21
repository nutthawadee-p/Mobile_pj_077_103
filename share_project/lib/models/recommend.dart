
class Recommend {
  String name;
  String pic;
  String value;

  // Create consturctor method
  Recommend({required this.name, required this.pic,required this.value});

  static List<Recommend> getRecommend() {
    List<Recommend> recommendList = [];

    recommendList.add(Recommend(
      name: 'tent',
      pic: 'assets/picrec/tent.jpg',
      value: '0'
    ));

    recommendList.add(Recommend(
      name: 'swimming \npool',
      pic: 'assets/picrec/swimmimgpool.jpg',
      value: '500'
    ));
    recommendList.add(Recommend(
      name: 'shell',
      pic: 'assets/picrec/shell.jpg',
      value: '0',
    ));
    recommendList.add(Recommend(
      name: 'outdoor cart',
      pic: 'assets/picrec/outdoorcart.jpg',
      value: '0',
    ));
    recommendList.add(Recommend(
      name: 'crochet bag',
      pic: 'assets/picrec/crochetcheckeredbag.jpg',
      value: '150',
    ));

    return recommendList;
  }
}
