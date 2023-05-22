import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/area.condominium.modules.dart';
import 'package:soares_administradora_condominios/adm/calendar_condominium/calendar.condominium.modules.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/called.modules.dart';
import 'package:soares_administradora_condominios/adm/employee/employee.modules.dart';
import 'package:soares_administradora_condominios/adm/lost_found/lost.found.modules.dart';
import 'package:soares_administradora_condominios/adm/maintenance/maintenance.modules.dart';
import 'package:soares_administradora_condominios/adm/news_wall/news.wall.modules.dart';
import 'package:soares_administradora_condominios/adm/polling/polling.modules.dart';
import 'package:soares_administradora_condominios/adm/requests_adm/requests.adm.modules.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/area.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/form.reservation.dart';
import 'package:soares_administradora_condominios/condominium/components/area_condominium/payment.reserve.dart';
import 'package:soares_administradora_condominios/condominium/condominium.modules.dart';
import 'package:soares_administradora_condominios/condominium/pages/area.condominium.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/calendar.condominium.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/called.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/employee.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/lost.found.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/maintenance.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/news.wall.page.dart';
import 'package:soares_administradora_condominios/condominium/pages/polling.page.dart';
import 'package:soares_administradora_condominios/home_unit/home.unit.modules.dart';
import 'package:soares_administradora_condominios/house_service_provider/house.service.provider.modules.dart';
import 'package:soares_administradora_condominios/login/bloc/fetch.user.login.bloc.dart';
import 'package:soares_administradora_condominios/login/events/login.events.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/house_service_provider/form.house.service.provider.register.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/residents/register.resident.form.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/vehicles/register.vehicle.form.dart';
import 'package:soares_administradora_condominios/myhouse_page/components/visitors/form.visitor.register.dart';
import 'package:soares_administradora_condominios/myhouse_page/myhouse.modules.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/all.qr.page.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/house.service.provider.page.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/residents.page.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/vehicles.page.dart';
import 'package:soares_administradora_condominios/myhouse_page/pages/visitors.page.dart';
import 'package:soares_administradora_condominios/resident/resident.modules.dart';
import 'package:soares_administradora_condominios/user/user.modules.dart';
import 'package:soares_administradora_condominios/vehicle/vehicle.modules.dart';
import 'package:soares_administradora_condominios/visitor/visitor.modules.dart';
import 'package:soares_administradora_condominios/.env';

import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:soares_administradora_condominios/login/login.modules.dart';

import 'package:soares_administradora_condominios/main_page/main.page.dart';
import 'package:soares_administradora_condominios/login/pages/login.page.dart';
import 'package:soares_administradora_condominios/main_page/loading.page.dart';
import 'package:soares_administradora_condominios/main_page/error.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp();
  var auth = FirebaseAuth.instance;
  var _isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          print(user.uid);
          _isLogin = true;
        });
      } else {
        setState(() {
          _isLogin = false;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...userModules,
        ...residentModules,
        ...homeUnitModules,
        ...requestsAdmModules,
        ...vehicleModules,
        ...visitorModules,
        ...houseServiceProviderModules,
        ...newsWallModules,
        ...calendarCondominiumModules,
        ...lostFoundModules,
        ...employeeModules,
        ...pollingModules,
        ...calledModules,
        ...maintenanceModules,
        ...areaCondominiumModules,
        ...condominiumModules,
        ...myHouseModules,
        ...loginModules,
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (_) => _isLogin
              ? FutureBuilder(
                  future: _inicializacao,
                  builder: (context, app) {
                    if (app.connectionState == ConnectionState.done) {
                      final uid =
                          FirebaseAuth.instance.currentUser!.uid.toString();
                      context
                          .read<FetchUserBloc>()
                          .add(FetchUserLoginEvent(uid));
                      return const MainPage();
                    }
                    if (app.hasError) {
                      return const ErrorPage();
                    }
                    return const LoadingPage();
                  })
              : const LoginPage(),
          '/residentsPage': (_) => const ResidentsPage(),
          '/registerResidentForm': (_) => const RegisterResidentForm(),
          '/vehiclePage': (_) => const VehiclesPage(),
          '/registerVehicleForm': (_) => const RegisterVehicleForm(),
          '/visitorPage': (_) => const VisitorsPage(),
          '/registerVisitorForm': (_) => const RegisterVisitorForm(),
          '/houseServiceProviderPage': (_) => const HouseServiceProviderPage(),
          '/registerHouseServiceProviderForm': (_) =>
              const RegisterHouseServiceProviderForm(),
          '/allQrPage': (_) => const AllQrPage(),
          '/newsWallPage': (_) => const NewsWallPage(),
          '/calendarCondominiumPage': (_) => const CalendarCondominiumPage(),
          '/lostFoundPage': (_) => const LostFoundPage(),
          '/employeePage': (_) => const EmployeePage(),
          '/pollingPage': (_) => const PollingPage(),
          '/calledPage': (_) => const CalledPage(),
          '/maintenancePage': (_) => const MaintenancePage(),
          '/areaCondominiumPage': (_) => const AreaCondominiumPage(),
          AreaPage.routeName: (_) => const AreaPage(),
          '/formReservationPage': (_) => const FormReservation(),
          PaymentReservation.routeName: (_) => const PaymentReservation(),
        },
        title: 'Soares Administradora de Condomínios',
      ),
    );
  }
}
