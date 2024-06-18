import 'package:binance_implementation/presentation/screens/home/home_screen.dart';
import 'package:binance_implementation/presentation/screens/login/login_screen.dart';
import 'package:binance_implementation/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {

  static final appRouter = GoRouter(

    initialLocation: LoginScreen.path,
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },

    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.pathName,
        builder: (context, state) => const LoginScreen(),
      ),  
      GoRoute(
        path: RegisterScreen.path,
        name: RegisterScreen.pathName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.pathName,
        builder: (context, state) => const HomeScreen(),
      ),
    ]

  );
  
}