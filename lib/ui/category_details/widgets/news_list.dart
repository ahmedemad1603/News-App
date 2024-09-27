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

class _NewsListWidgetState extends State<NewsListWidget>
{
  int selectedIndex = 0;
  int page = 1;
  int pageSize = 20;
  ScrollController scrollController = ScrollController();
  List<Article> articlesList = [];

  @override
  void initState()
  {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
        {
          if(scrollController.offset != 0)
            {
              setState(() {
                page++;
                scrollController.animateTo(0, duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
              });
            }
        }
    });
  }

  Future<void> loadNews() async
  {
    var newArticleList = await ApiManager.getNews(
        sourceId: widget.sourceNames[selectedIndex].id??"",
        page: page,
        pageSize: pageSize
    );
    setState(() {

    });
    articlesList.addAll((newArticleList.articles??[]));
  }

  @override
  Widget build(BuildContext context)
  {
    return Expanded(
      child: TabBarView(
          children: widget.sourceNames.map((source) => FutureBuilder(
              future: ApiManager.getNews(sourceId: source.id??"", page: page, pageSize: pageSize),
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
                return RefreshIndicator(
                  onRefresh: () async
                  {
                    setState(()
                    {
                      page=1;
                    });
                  },
                  child: ListView.separated(
                    controller: scrollController,
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ArticleItemWidget(
                        articleModel: articles[index]
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  ),
                );
              },
          )).toList()
      ),
    );
  }
}
