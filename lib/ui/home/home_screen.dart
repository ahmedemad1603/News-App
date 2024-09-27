import 'package:flutter/material.dart';
import 'package:news_app/ui/categories/categories_tab.dart';
import 'package:news_app/ui/category_details/category_details.dart';
import 'package:news_app/ui/home/widgets/custom_drawer.dart';
import 'package:news_app/ui/home/widgets/search_tab.dart';
import 'package:news_app/ui/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget
{
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  late Widget selectedWidget;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(onCategoryClick: selectCategoryItem);
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png")
        )
      ),
      child: Scaffold(
        drawer: CustomDrawer(onTap: selectDrawerWidget),
        appBar: AppBar(
          title: const Text("News App"),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchTab()
                );
              },
              icon: const Icon(Icons.search, size: 30)
            )
          ],
        ),
        body: selectedWidget,
      ),
    );
  }

  selectDrawerWidget(MenuTab tab)
  {
    Navigator.pop(context);
    switch(tab)
    {
      case MenuTab.categories:{
        selectedWidget = CategoriesTab(onCategoryClick: selectCategoryItem);
      }
      case MenuTab.settings:{
        selectedWidget = const SettingsTab();
      }
    }
    setState(() {

    });
  }

  selectCategoryItem(String categoryId)
  {
    selectedWidget = CategoryDetails(categoryId: categoryId);
    setState(() {

    });
  }

}
