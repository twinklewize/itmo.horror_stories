import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/services/data/hive/hive_client.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';

import 'src/core/services/di/di.dart';
import 'src/core/ui_kit/theme/global_theme.dart';
import 'src/core/ui_kit/ui_kit.dart';
import 'src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';

Future<void> main() async {
  HttpOverrides.global = AppHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const HorrorStoriesApp());
}

class HorrorStoriesApp extends StatefulWidget {
  const HorrorStoriesApp({super.key});

  @override
  State<HorrorStoriesApp> createState() => _HorrorStoriesAppState();
}

class _HorrorStoriesAppState extends State<HorrorStoriesApp> {
  late HorrorStoriesRouter horrorStoriesRouter;

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  bool isInitialized = false;
  bool isLogged = false;

  Future<void> initializeApp() async {
    await configureDependencies();
    await getIt.allReady();
    await getIt.get<HiveMemoryClient>().init();

    final authBloc = getIt.get<AuthBloc>();

    authBloc.add(const AuthEvent.restoreSession());

    await authBloc.stream.firstWhere((state) {
      return !state.isType.pending;
    });

    isLogged = await (authBloc.state.maybeWhen(
      authorized: (session) async {
        authBloc.add(const AuthEvent.restoreSession());

        final state = await authBloc.stream.firstWhere((element) {
          return element.maybeWhen(
            pending: () => false,
            orElse: () => true,
          );
        });

        return state.maybeWhen(
          authorized: (_) => true,
          orElse: () => false,
        );
      },
      orElse: () {
        return false;
      },
    ));

    setState(() {
      isInitialized = true;
    });

    horrorStoriesRouter = HorrorStoriesRouter(isLogged ? RoutePaths.main : RoutePaths.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return !isInitialized
        ? Container(color: const Color(0xFF3C3F45))
        : MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: horrorStoriesRouter.router,
            title: 'HorrorStories',
            color: const Color(0xFF000000),
            builder: (context, child) {
              return AppTheme.fromAppThemeData(
                data: GlobalTheme.getTheme(),
                child: BotToastInit()(context, child!),
              );
            },
          );
  }
}

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (_, __, ___) => true;
  }
}
