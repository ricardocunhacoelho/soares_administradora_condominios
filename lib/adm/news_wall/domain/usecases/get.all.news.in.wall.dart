import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/irepositories/irepository.news.wall.dart';


abstract class IGetAllNewsInWall {
  Stream<List<NewsEntity>> call();
}

class GetAllNewsInWall implements IGetAllNewsInWall {
  final INewsWallRepository repository;

  GetAllNewsInWall(this.repository);
  @override
  Stream<List<NewsEntity>> call()  {
    return repository.getAllNewsInWall();
  }
}