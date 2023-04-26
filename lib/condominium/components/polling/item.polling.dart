import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/adm/polling/domain/entity/polling.entity.dart';
import 'package:soares_administradora_condominios/adm/polling/domain/entity/response.polling.entity.dart';
import 'package:soares_administradora_condominios/condominium/bloc/get.polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/bloc/polling.bloc.dart';
import 'package:soares_administradora_condominios/condominium/components/polling/change.vote.dialog.dart';
import 'package:soares_administradora_condominios/condominium/events/condominium.events.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class ItemPolling extends StatefulWidget {
  final PollingEntity polling;
  final String uid;
  final List<ResponsePollingEntity> listPollingsUser;
  final bool alreadyAnswered;
  final int? vote;

  const ItemPolling({
    super.key,
    required this.polling,
    required this.uid,
    required this.listPollingsUser,
    required this.alreadyAnswered,
    this.vote,
  });

  @override
  State<ItemPolling> createState() => _ItemPollingState();
}

class _ItemPollingState extends State<ItemPolling> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: widget.polling.image == null
            ? ListTile(
                horizontalTitleGap: 18,
                contentPadding: const EdgeInsets.only(
                    left: 18, right: 18, top: 10, bottom: 10),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.polling.title,
                      style: kPoppinsBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: kDarkBlue),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 3),
                        Text(
                          '${widget.polling.dateStart.day}/${widget.polling.dateStart.month.toString().padLeft(2, '0')}/${widget.polling.dateStart.year} até: ${widget.polling.dateFinish.day}/${widget.polling.dateFinish.month.toString().padLeft(2, '0')}/${widget.polling.dateFinish.year}',
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kDarkBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.polling.text,
                      style: kPoppinsRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Votos: sim: ${widget.polling.votesYes}, não: ${widget.polling.votesNo}',
                      style: kPoppinsRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          color: kDarkBlue),
                    ),
                    !widget.alreadyAnswered
                        ? Column(
                            children: [
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Votar: ',
                                      style: kPoppinsBold.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3,
                                          color: kDarkBlue)),
                                  Container(
                                    color: kBlue,
                                    child: TextButton(
                                        onPressed: () {
                                          context.read<PollingBloc>().add(
                                              AnswerPollingEvent(
                                                  widget.uid,
                                                  widget.listPollingsUser,
                                                  ResponsePollingEntity(
                                                      idPolling:
                                                          widget.polling.id,
                                                      pollingChange:
                                                          widget.alreadyAnswered
                                                              ? 1
                                                              : 0,
                                                      vote: 1),
                                                  widget.polling));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Text('Sim',
                                              style: kPoppinsBold.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3,
                                                  color: kLightWhite)),
                                        )),
                                  ),
                                  Container(
                                    color: kBlue,
                                    child: TextButton(
                                        onPressed: () {
                                          context.read<PollingBloc>().add(
                                              AnswerPollingEvent(
                                                  widget.uid,
                                                  widget.listPollingsUser,
                                                  ResponsePollingEntity(
                                                      idPolling:
                                                          widget.polling.id,
                                                      pollingChange:
                                                          widget.alreadyAnswered
                                                              ? 1
                                                              : 0,
                                                      vote: 0),
                                                  widget.polling));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Text('Não',
                                              style: kPoppinsBold.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3,
                                                  color: kLightWhite)),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 25),
                              Text(
                                  'Você votou com ${widget.vote == 1 ? '\'SIM\'' : '\'NÃO\''} nesta enquete',
                                  style: kPoppinsBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                              const SizedBox(height: 25),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  color: kBlue,
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return ChangeVoteDialog(
                                                polling: widget.polling,
                                                vote: widget.vote!,
                                                changeVote: () {
                                                  context
                                                      .read<PollingBloc>()
                                                      .add(AnswerPollingEvent(
                                                          widget.uid,
                                                          widget
                                                              .listPollingsUser,
                                                          ResponsePollingEntity(
                                                              idPolling: widget
                                                                  .polling.id,
                                                              pollingChange:
                                                                  widget.alreadyAnswered
                                                                      ? 1
                                                                      : 0,
                                                              vote:
                                                                  widget.vote ==
                                                                          0
                                                                      ? 1
                                                                      : 0),
                                                          widget.polling));
                                                });
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Text('Alterar Voto',
                                          style: kPoppinsBold.copyWith(
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                              color: kLightWhite)),
                                    )),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Ink.image(
                        image: NetworkImage(widget.polling.image!),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGrey,
                          ),
                          child: Text(
                            widget.polling.title,
                            style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                                color: kWhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.polling.text,
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Dia: ${widget.polling.dateStart.day}/${widget.polling.dateStart.month.toString().padLeft(2, '0')}/${widget.polling.dateStart.year}',
                          style: kPoppinsRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kDarkBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
