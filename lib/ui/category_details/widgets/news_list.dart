import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/ui/category_details/widgets/article_item.dart';

class NewsListWidget extends StatelessWidget
{
  final List<String> sourceNames;

  const NewsListWidget({super.key, required this.sourceNames});

  @override
  Widget build(BuildContext context)
  {
    return Expanded(
      child: TabBarView(
          children: sourceNames.map((source) => ListView.separated(
            itemCount: ArticleModel.articles.length,
            itemBuilder: (context, index) => ArticleItemWidget(
                articleModel: ArticleModel.articles[index]
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          )).toList()
      ),
    );
  }
}
