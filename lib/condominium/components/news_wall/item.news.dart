import 'package:flutter/material.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';

import '../../../app.style.dart';

class ItemNews extends StatefulWidget {
  final NewsEntity news;

  const ItemNews({
    super.key,
    required this.news,
  });

  @override
  State<ItemNews> createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          horizontalTitleGap: 18,
          contentPadding:
              const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
          title: Column(
            children: [
              Text(
                widget.news.title,
                style: const TextStyle(fontSize: 13),
              ),
              SizedBox(height: 15),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Por: ${widget.news.author}',
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              Text(
                'Em: ${widget.news.date.day}/${widget.news.date.month.toString().padLeft(2, '0')}/${widget.news.date.year}',
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              Text(
                widget.news.text,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
