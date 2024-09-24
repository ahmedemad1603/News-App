import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget
{
  final CategoryModel categoryModel;
  final int index;
  final void Function() onTab;

  const CategoryItem({super.key, required this.categoryModel, required this.index, required this.onTab});

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomLeft: index.isEven ? const Radius.circular(25) : Radius.zero,
            bottomRight: index.isEven ? Radius.zero : const Radius.circular(25)
          )
        ),
        child: Column(
          children: [
            Image.asset(categoryModel.imagePath,
              height: MediaQuery.of(context).size.height*0.15,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 5),
            Text(categoryModel.title, style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      ),
    );
  }
}
