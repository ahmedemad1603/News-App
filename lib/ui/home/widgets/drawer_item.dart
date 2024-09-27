import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnDrawerClick = void Function();

class DrawerItem extends StatelessWidget
{
  final String imagePath;
  final String titleText;
  final OnDrawerClick onPress;

  const DrawerItem({super.key, required this.imagePath, required this.titleText, required this.onPress});

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: (){
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            children: [
              SvgPicture.asset(imagePath),
              const SizedBox(width: 16.5),
              Text(titleText, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary
              ))
            ]
        ),
      ),
    );
  }
}
