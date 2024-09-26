import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourcesResponse/Source.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/ui/category_details/widgets/article_item.dart';
import '../../../model/NewsResponse/Article.dart';

class NewsListWidget extends StatefulWidget
{
  final List<Source> sourceNames;

  const NewsListWidget({super.key, required this.sourceNames});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context)
  {
    return Expanded(
      child: TabBarView(
          children: widget.sourceNames.map((source) => FutureBuilder(
              future: ApiManager.getNews(source.id??""),
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
                          Text(snapshot.data?.message??snapshot.error.toString()),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {

                                });
                              },
                              child: const Text("Try Again")
                          )
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
          )).toList()
      ),
    );
  }
}
