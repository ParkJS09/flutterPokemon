import 'package:core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:core/di/service_locator.dart';
import 'package:data/di/service_locator.dart';
import 'package:domain/di/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/di/service_locator.dart';
import 'package:presentation/screens/pokemon_list_screen.dart';

void main() {
  setupCoreLocator();
  setupDataLocator();
  setupDomainLocator();
  setupPresentationLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // 시스템 설정 따라가기
      home: PokemonListScreen(),
    );
  }
}
