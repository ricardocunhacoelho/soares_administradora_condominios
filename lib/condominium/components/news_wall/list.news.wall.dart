import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.news.wall.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/news_wall/item.news.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class ListNewsWall extends StatefulWidget {
  const ListNewsWall({super.key});

  @override
  State<ListNewsWall> createState() => _ListNewsWallState();
}

class _ListNewsWallState extends State<ListNewsWall> {
  @override
  Widget build(BuildContext context) {
    final fetchNewsWallBloc = context.watch<GetNewsWallBloc>();
    final fetchNewsWallState = fetchNewsWallBloc.state;

    return Column(
      children: [
        if (fetchNewsWallState is CompleteGetNewsWallState)
          ListView.builder(
              itemCount: fetchNewsWallState.newsList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final news = fetchNewsWallState.newsList[index];
                return ItemNews(news: news);
              }),
        if (fetchNewsWallState is LoadingGetNewsWallState)
          const Center(child: CircularProgressIndicator()),
        if (fetchNewsWallState is ErrorGetNewsWallState)
          Center(
            child: Text('Erro ${fetchNewsWallState.message}'),
          )
      ],
    );
  }
}
