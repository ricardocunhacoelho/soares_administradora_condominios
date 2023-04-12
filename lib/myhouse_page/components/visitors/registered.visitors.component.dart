import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/list.visitors.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/register.new.visitor.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisteredVisitors extends StatefulWidget {
  const RegisteredVisitors({super.key});

  @override
  State<RegisteredVisitors> createState() => _RegisteredVisitorsState();
}

class _RegisteredVisitorsState extends State<RegisteredVisitors> {
  @override
  Widget build(BuildContext context) {
    final fetchUnitBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchUnitBloc.state;

    return Column(
      children: <Widget>[
        if (fetchState is CompleteFetchHomeUnitFetchStates)
          fetchState.homeUnitEntity.visitors.isNotEmpty
              ? Column(
                  children: [
                    //REGISTER
                    RegisterNewVisitor(),
                    SizedBox(height: 25),
                    //LISTVISITORS
                    SingleChildScrollView(child: ListVisitors()),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registerVisitorForm');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: [
                            BoxShadow(
                                color: kDarkBlue.withOpacity(0.051),
                                offset: const Offset(0.0, 3.0),
                                blurRadius: 24.0,
                                spreadRadius: 0.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/visitors_.png'),
                                      fit: BoxFit.contain),
                                )),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                  'Você ainda não cadastrou visitantes. Toque para cadastrar.',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.5,
                                      color: kDarkBlue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}
