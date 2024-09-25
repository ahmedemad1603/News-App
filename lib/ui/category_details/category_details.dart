import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/category_details/widgets/news_list.dart';
import 'package:news_app/ui/category_details/widgets/source_tab.dart';
import '../../model/SourcesResponse/Source.dart';

class CategoryDetails extends StatefulWidget
{
  String categoryId;

  CategoryDetails({super.key,required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator());
            }
          if(snapshot.hasError || snapshot.data?.status == "error")
            {
              return Column(
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
              );
            }
          List<Source> sources = snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
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
                    tabs: sources.map((source) => SourceTabWidget(source: source)).toList()
                ),
                NewsListWidget(sourceNames: sources)
              ],
            ),
          );
        },
    );
  }
}
