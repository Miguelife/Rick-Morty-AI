import 'package:flutter/material.dart';
import 'package:rick_morty_ai/presentation/feature/character_list/character_list_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty AI',
      home: const CharacterListPage(),
    );
  }
}
