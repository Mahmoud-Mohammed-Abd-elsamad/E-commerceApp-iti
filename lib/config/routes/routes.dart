import 'package:ecommerce_app/features/login/data/data_sources/login_data_source.dart';
import 'package:ecommerce_app/features/login/presentation/manager/login_cubit.dart';
import 'package:ecommerce_app/features/login/presentation/pages/login_screen.dart';
import 'package:ecommerce_app/features/register/data/data_sources/register_data_source.dart';
import 'package:ecommerce_app/features/register/presentation/manager/register_cubit.dart';
import 'package:ecommerce_app/features/register/presentation/pages/register_screen.dart';
import 'package:ecommerce_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splash = "/";
  static const String login = "login";
  static const String register = "register";
  static const String home = "home";
}

// Route<dynamic>?
class AppRoutes {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(create: (BuildContext context)  => LoginCubit(loginDataSource: RemoteLoginDataSource()),
            child: const LoginScreen());
          },
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
                create: (BuildContext context) => RegisterCubit(
                    registerDataSource: RemoteRegisterDataSource()),
                child: RegisteScreen());
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return unDefinedScreen();
          },
        );
    }
  }

  static Widget unDefinedScreen() {
    return const Scaffold(
      body: Center(child: Text("unDefinedScreen")),
    );
  }
}
