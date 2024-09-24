import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/widgets/news_list.dart';
import 'package:news_app/ui/category_details/widgets/source_tab.dart';

class CategoryDetails extends StatelessWidget
{
  String categoryId;

  CategoryDetails({super.key,required this.categoryId});

  List<String> sourceNames = [
    "BBC News",
    "Al-Jazeera News",
    "MBC News",
    "CBC News",
    "CNN News",
  ];

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: sourceNames.length,
      child: Column(
        children: [
          TabBar(
            padding: const EdgeInsets.all(16),
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              color: Theme.of(context).colorScheme.primary
            ),
            tabs: sourceNames.map((source) => SourceTabWidget(source: source)).toList()
          ),
          NewsListWidget(sourceNames: sourceNames)
        ],
      ),
    );
  }
}
