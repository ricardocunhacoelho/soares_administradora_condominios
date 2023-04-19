import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/irepositories/irepository.news.wall.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/adapters/json.to.from.news.wall.dart';
import 'package:soares_administradora_condominios/adm/news_wall/infra/datasource/datasource.news.wall.dart';

class NewsWallRepository implements INewsWallRepository {
  final INewsWallDataSource newsWallDataSource;
  NewsWallRepository(this.newsWallDataSource);

  @override
  Stream<List<NewsEntity>> getAllNewsInWall() {
    final streamList = newsWallDataSource.getAllNewsInWall();
    return streamList.map(_convert);
  }

  List<NewsEntity> _convert(List<dynamic> list) {
    var test1 = list.map(JsonToFromNewsEntity.fromMap).toList();
    return test1;
  }
}
