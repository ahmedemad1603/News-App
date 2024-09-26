import 'package:flutter/material.dart';

import '../../../api/api_manager.dart';
import '../../../model/NewsResponse/Article.dart';
import '../../category_details/widgets/article_item.dart';

class SearchTab extends SearchDelegate
{
  @override
  List<Widget>? buildActions(BuildContext context)
  {
    return [
      IconButton(
        onPressed: ()
      {
        showResults(context);
      },
        icon: const Icon(Icons.search)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context)
  {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context)
  {
    return FutureBuilder(
      future: ApiManager.getNews(query: query),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError || snapshot.data?.status == "error")
        {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message??snapshot.error.toString())
              ],
            ),
          );
        }
        List<Article> articles = snapshot.data?.articles??[];
        return ListView.separated(
          itemCount: articles.length,
          itemBuilder: (context, index) => ArticleItemWidget(
              articleModel: articles[index]
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    return FutureBuilder(
      future: ApiManager.getNews(query: query),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError || snapshot.data?.status == "error")
        {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message??snapshot.error.toString())
              ],
            ),
          );
        }
        List<Article> articles = snapshot.data?.articles??[];
        return ListView.separated(
          itemCount: articles.length,
          itemBuilder: (context, index) => ArticleItemWidget(
              articleModel: articles[index]
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }

}