import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse/NewsResponse.dart';
import '../model/SourcesResponse/SourcesResponse.dart';

class ApiManager
{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "ed0044364aa24c2fada3a7451da11bb5";


  static Future<SourcesResponse> getSources(String categoryId) async
  {
    // ?=
    Uri sourcesApiUrl = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": apiKey,
      "category": categoryId
    });

    http.Response response = await http.get(sourcesApiUrl);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews({String? sourceId, String? query}) async
  {
    // ?=&
    Uri newsUrl = Uri.http(baseUrl, "/v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
      "q": query
    });

    http.Response response = await http.get(newsUrl);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

}