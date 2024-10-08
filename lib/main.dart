import 'package:flutter/material.dart';
import 'package:news_app/style/AppStyle.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/news_details/news_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

