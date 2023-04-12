import 'package:soares_administradora_condominios/visitor/domain/irepositories/irepository.visitor.dart';

abstract class IDeleteVisitor {
  Future<void> call(String doc, String cpf, int index);
}

class DeleteVisitor implements IDeleteVisitor {
  final IVisitorRepository repository;

  DeleteVisitor(this.repository);
  @override
  Future<void> call(String doc, String cpf, int index) async {
    await repository.deleteVisitor(doc, cpf, index);
  }
}
