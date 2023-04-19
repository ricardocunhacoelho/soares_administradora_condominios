import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/entity/news.entity.dart';
import 'package:soares_administradora_condominios/adm/news_wall/domain/usecases/get.all.news.in.wall.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';



class GetNewsWallBloc extends Bloc<GetNewsWallEvent, GetNewsWallStates> {
  final IGetAllNewsInWall getAllNewsInWallUsecase;

  GetNewsWallBloc(
    this.getAllNewsInWallUsecase,
  ) : super(InitialNewsWallState()) {
    on<GetNewsWallEvent>(_getNewsWallEvent,
        transformer: sequential());
  }

  Future<void> _getNewsWallEvent(
      GetNewsWallEvent event, Emitter<GetNewsWallStates> emit) async {
    emit(LoadingGetNewsWallState());
    await emit.forEach<List<NewsEntity>>(
      getAllNewsInWallUsecase.call(),
      onData: (newsWallEntitys) => CompleteGetNewsWallState(newsWallEntitys),
      onError: (error, st) => ErrorGetNewsWallState(error.toString()),
    );
  }
}
