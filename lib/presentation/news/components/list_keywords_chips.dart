import 'package:flutter/material.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';

class ListKeywordsChips extends StatelessWidget {
  const ListKeywordsChips({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: news.keywords
          .map((String keyword) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.all(0),
                  label: Text("$keyword",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ))
          .toList(),
    );
  }
}
