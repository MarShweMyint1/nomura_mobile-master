// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/app_state/app_bloc.dart';
import 'package:nomura_mobile/nomura/getit_root.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';

late RouteGenerator routeGenerator;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  routeGenerator = GetIt.I.get<RouteGenerator>();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    routeGenerator.setNavigatorKey(_navigatorKey);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I.get<AppBloc>(),
      child: ProviderScope(
        child: MaterialApp(
          title: 'Nomura Wealth',
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          initialRoute: Routes.initRoute,
          onGenerateRoute: RouteGenerator.getRoute,
          supportedLocales: const [Locale('en')],
          locale: const Locale('en'),
        ),
      ),
    );
  }
}
