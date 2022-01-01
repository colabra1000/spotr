import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_logic/bloc/app_bloc.dart';
import '../../../../core/route/auto_router.gr.dart';

import '../widgets/intro_screen.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is InitializationComplete) {
              context.router.replace(
                const LoginRoute(),
              );
            }
          },
        ),
      ],
      child: const IntroScreen(),
    );
  }
}
