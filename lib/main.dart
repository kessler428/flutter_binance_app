import 'package:binance_implementation/config/get_it/service_locator.dart';
import 'package:binance_implementation/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  // Initialize the service locator for dependency injection
  setUpServiceLocator();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Binance App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter,
    );
  }
}