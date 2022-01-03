import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/features/main_app/bloc/main_app_bloc.dart';
import 'locator.dart';

import 'core/features/app_controller/bloc/app_bloc.dart';
import 'core/features/authentication/bloc/authentication_bloc.dart';
import 'core/route/auto_router.gr.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = locator<AppRouter>();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => locator<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (_) => locator<AppBloc>(),
          ),
          // BlocProvider(
          //   create: (_) => locator<MainAppBloc>(),
          // ),
        ],
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) async {
            if (state is AppLoggedInState) {
              await locator<AppRouter>().replace(HomeRoute());
            }

            if (state is AppLoggedOutState) {
              locator<AppRouter>().replace(const LoginRoute());
            }
          },
          child: MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: const Scaffold(body: SafeArea(child: WelcomePage())),
          ),
        ),
      ),
    );
  }
}
