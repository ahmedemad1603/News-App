class ArticleModel
{
  String image;
  String title;
  String source;
  DateTime date;

  ArticleModel({required this.source, required this.title, required this.date, required this.image});

  static List<ArticleModel> articles = [
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", date: DateTime.now(), image: "https://www.greenfly.com/wp-content/uploads/2022/05/Best-sports-promotion-using-puma-football-on-green-grass-1024x538.jpg"),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", date: DateTime.now().subtract(Duration(hours: 2)), image: "https://www.greenfly.com/wp-content/uploads/2022/05/Best-sports-promotion-using-puma-football-on-green-grass-1024x538.jpg"),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", date: DateTime.now().subtract(Duration(hours: 3)), image: "https://www.greenfly.com/wp-content/uploads/2022/05/Best-sports-promotion-using-puma-football-on-green-grass-1024x538.jpg"),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", date: DateTime.now().subtract(Duration(hours: 4)), image: "https://www.greenfly.com/wp-content/uploads/2022/05/Best-sports-promotion-using-puma-football-on-green-grass-1024x538.jpg"),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", date: DateTime.now().subtract(Duration(hours: 5)), image: "https://www.greenfly.com/wp-content/uploads/2022/05/Best-sports-promotion-using-puma-football-on-green-grass-1024x538.jpg"),
  ];

}