import 'package:flutter/material.dart';

class SourceTabWidget extends StatelessWidget
{
  final String source;

  const SourceTabWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context)
  {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Theme.of(context).colorScheme.primary)
        ),
        child: Text(source),
      ),
    );
  }
}
