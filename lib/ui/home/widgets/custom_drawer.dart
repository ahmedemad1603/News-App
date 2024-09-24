import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/ui/home/widgets/drawer_item.dart';

typedef OnTapClick = void Function(MenuTab);

class CustomDrawer extends StatelessWidget
{
  OnTapClick onTap;

  CustomDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 45),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary
            ),
            child: Text("News App!", style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 29),
          DrawerItem(
            imagePath: "assets/images/menu.svg",
            titleText: "Categories",
            onPress: () {
              onTap(MenuTab.categories);
            },
          ),
          const SizedBox(height: 10),
          DrawerItem(
            imagePath: "assets/images/settings.svg",
            titleText: "Settings",
            onPress: () {
              onTap(MenuTab.settings);
            },
          )
        ],
      ),
    );
  }
}

enum MenuTab
{
  categories,
  settings
}
