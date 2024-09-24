import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/categories/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget
{
  void Function(String) onCategoryClick;

  CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        children: [
          Text("Pick your category of interest", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 1/1.2
              ),
              itemBuilder: (context, index) => CategoryItem(
                onTab: (){
                  onCategoryClick(CategoryModel.categories[index].id);
                },
                categoryModel: CategoryModel.categories[index],
                index: index
              ),
              itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
