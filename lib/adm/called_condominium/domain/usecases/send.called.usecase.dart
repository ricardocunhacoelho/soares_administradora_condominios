
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/irepositories/irepository.called.dart';

abstract class ISendCalled {
  Future<void> call(CalledEntity called);
}

class SendCalled implements ISendCalled {
  final ICalledRepository repository;

  SendCalled(this.repository);
  @override
  Future<void> call(CalledEntity called) {
    return repository.sendCalled(called);
  }
}