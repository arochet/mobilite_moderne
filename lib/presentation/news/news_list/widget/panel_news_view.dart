import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobilite_moderne/DOMAIN/news/news.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/image_from_storage.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_core/app_widget.dart';
import 'package:mobilite_moderne/PRESENTATION/news/components/list_keywords_chips.dart';
import '../../../core/_core/router.dart';

class PanelNewsView extends StatelessWidget {
  final News news;
  const PanelNewsView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'PanelNewsView',
      child: Card(
        color: colorpanel(900),
        child: _CompressedCard(news: news),
      ),
    );
  }
}

class _CompressedCard extends StatelessWidget {
  const _CompressedCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 450, maxHeight: 280, minHeight: 280),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageFromStorage(
                    url: news.imageUrl,
                    bytes: news.imageBytes,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                Positioned(top: 8, left: 6, child: ListKeywordsChips(news: news)),
              ],
            ),
          ),

          _LineBottom(news: news),
        ],
      ),
    );
  }
}

class _LineBottom extends StatefulWidget {
  const _LineBottom({
    super.key,
    required this.news,
  });

  final News news;

  @override
  State<_LineBottom> createState() => _LineBottomState();
}

class _LineBottomState extends State<_LineBottom> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(NewsViewRoute(id: widget.news.id)),
      onHover: (value) => setState(() => hover = value),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SpaceW10(),
              Expanded(
                child: Text("${widget.news.title.getOrCrash()}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: hover ? primaryColor : Colors.white)),
              ),
              const SpaceW10(),
              Icon(Icons.remove_red_eye, color: hover ? primaryColor : Colors.white),
              const SpaceW10(),
            ],
          ),
        ),
      ),
    );
  }
}
