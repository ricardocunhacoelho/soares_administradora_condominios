import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/polling/item.polling.dart';
import 'package:soares_administradora_condominios/condominium/states/states.condominium.dart';

class ListPollings extends StatefulWidget {
  final List<ResponsePollingEntity> listPollingsUser;
  final String uid;
  const ListPollings(
      {super.key, required this.listPollingsUser, required this.uid});

  @override
  State<ListPollings> createState() => _ListPollingsState();
}

class _ListPollingsState extends State<ListPollings> {
  @override
  Widget build(BuildContext context) {
    final fetchPollingBloc = context.watch<GetPollingBloc>();
    final fetchPollingState = fetchPollingBloc.state;

    return Column(
      children: [
        if (fetchPollingState is CompleteGetPollingState)
          ListView.builder(
              itemCount: fetchPollingState.pollingList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                final polling = fetchPollingState.pollingList[index];
                bool alreadyAnswered = widget.listPollingsUser
                    .any((element) => element.idPolling == polling.id);
                return ItemPolling(
                  polling: polling,
                  uid: widget.uid,
                  listPollingsUser: widget.listPollingsUser,
                  alreadyAnswered: alreadyAnswered,
                  vote: alreadyAnswered
                      ? widget.listPollingsUser
                          .firstWhere(
                              (element) => element.idPolling == polling.id)
                          .vote
                      : null,
                );
              }),
        if (fetchPollingState is LoadingGetPollingState)
          const Center(child: CircularProgressIndicator()),
        if (fetchPollingState is ErrorGetPollingState)
          Center(
            child: Text('Erro ${fetchPollingState.message}'),
          )
      ],
    );
  }
}
