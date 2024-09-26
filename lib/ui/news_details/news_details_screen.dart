import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget
{
  static const String routeName = "NewsDetailsScreen";

  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png")
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CachedNetworkImage(
                imageUrl: article.urlToImage??"",
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
              Text(article.source?.name??"", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 5),
              Text(article.title??"", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 2),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                      timeago.format(DateTime.parse(article.publishedAt??"")),
                      style: Theme.of(context).textTheme.displaySmall
                  )
              ),
              const SizedBox(height: 20),
              Text(article.content??"", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w300
              )),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  _launchUrl(article.url??"");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.secondary)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async
  {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url))
    {
      throw Exception('Could not launch $_url');
    }
  }

}
