import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';

abstract class INewsWallRepository {
  Stream<List<NewsEntity>> getAllNewsInWall();
  
}
