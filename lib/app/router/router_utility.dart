import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ok/all_news/cubit/all_news_cubit.dart';
import 'package:news_ok/all_news/views/all_news_page.dart';
import 'package:news_ok/app/router/router_constants.dart';
import 'package:news_ok/home/cubit/home_cubit.dart';
import 'package:news_ok/home/view/home_page.dart';
import 'package:news_ok/login/cubit/login_cubit.dart';
import 'package:news_ok/login/login_page.dart';
import 'package:news_ok/splash/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouterConstants.loginPage:
      return MaterialPageRoute<void>(
        builder: (context) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginPage(),
        ),
      );

    case RouterConstants.splashPage:
      return MaterialPageRoute<void>(
        builder: (context) => const SplashPage(),
      );

    case RouterConstants.homePage:
      return MaterialPageRoute<void>(
        builder: (context) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomePage(),
        ),
      );

    case RouterConstants.allNewsPage:
      final args = routeSettings.arguments;
      return MaterialPageRoute<void>(
        builder: (context) => BlocProvider(
          create: (context) => AllNewsCubit(),
          child: AllNewsPage(sourceId: args as String),
        ),
      );

    default:
      return MaterialPageRoute<void>(builder: (context) => const SplashPage());
  }
}
