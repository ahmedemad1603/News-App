import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse/Article.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/ui/news_details/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItemWidget extends StatelessWidget
{
  final Article articleModel;

  const ArticleItemWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName, arguments: articleModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: articleModel.urlToImage??"",
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, size:  40)),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(articleModel.source?.name??"", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 5),
            Text(articleModel.title??"", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 2),
            Text(timeago.format(DateTime.parse(articleModel.publishedAt??"")), style: Theme.of(context).textTheme.displaySmall)
          ],
        ),
      ),
    );
  }
}
