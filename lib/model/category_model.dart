import 'dart:ui';

class CategoryModel
{
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  CategoryModel({required this.imagePath, required this.title, required this.backgroundColor, required this.id});

  static List<CategoryModel> categories = [
    CategoryModel(id: "sports", imagePath: "assets/images/ball.png", title: "Sports", backgroundColor: const Color(0xffC91C22)),
    CategoryModel(id: "general", imagePath: "assets/images/Politics.png", title: "General", backgroundColor: const Color(0xff003E90)),
    CategoryModel(id: "health", imagePath: "assets/images/health.png", title: "Health", backgroundColor: const Color(0xffED1E79)),
    CategoryModel(id: "business", imagePath: "assets/images/bussines.png", title: "Business", backgroundColor: const Color(0xffCF7E48)),
    CategoryModel(id: "technology", imagePath: "assets/images/environment.png", title: "Technology", backgroundColor: const Color(0xff4882CF)),
    CategoryModel(id: "science", imagePath: "assets/images/science.png", title: "Science", backgroundColor: const Color(0xffF2D352)),
  ];

}