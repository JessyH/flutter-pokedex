import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'api/pokemon_repository.dart';
import 'api/pokemon_api_client.dart';
import 'providers/list_provider.dart';
import 'res/app_colors.dart';
import 'res/app_strings.dart';
import 'ui/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.title,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          backgroundColor: AppColors.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
          ),
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ListProvider(
          PokemonRepository(PokemonApiClient(http.Client())),
        ),
        child: ListPage(),
      ),
    );
  }
}
