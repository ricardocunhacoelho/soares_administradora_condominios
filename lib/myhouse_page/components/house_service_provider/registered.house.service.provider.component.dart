import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/bloc/fetch.unit.bloc.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/list.house.service.providers.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/new.register.house.service.provider.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/list.visitors.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/register.new.visitor.dart';
import 'package:soares_administradora_condominios/myhouse_page/states/myhouse.states.dart';

import '../../../app.style.dart';
import '../../../size.config.dart';

class RegisteredHouseServiceProvider extends StatefulWidget {
  const RegisteredHouseServiceProvider({super.key});

  @override
  State<RegisteredHouseServiceProvider> createState() => _RegisteredHouseServiceProviderState();
}

class _RegisteredHouseServiceProviderState extends State<RegisteredHouseServiceProvider> {
  @override
  Widget build(BuildContext context) {
    final fetchUnitBloc = context.watch<FetchUnitBloc>();
    final fetchState = fetchUnitBloc.state;

    return 
     Column(
        children: <Widget>[
          if (fetchState is CompleteFetchHomeUnitFetchStates)
            fetchState.homeUnitEntity.houseServiceProviders.isNotEmpty
                ? Column(
                    children: const [
                      //REGISTER
                      RegisterNewHouseServiceProvider(),
                      SizedBox(height: 25),
                      //LIST VisitorsS
                      SingleChildScrollView(child: ListHouseServiceProvider()),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registerHouseServiceProviderForm');
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
                                        image:
                                            AssetImage('assets/cadastro.png'),
                                        fit: BoxFit.contain),
                                  )),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                    'Você ainda não cadastrou nenhum funcionário. Toque para cadastrar.',
                                    style: kPoppinsMedium.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
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
