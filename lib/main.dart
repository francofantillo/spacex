import 'package:flutter/material.dart';
import 'package:spacex/dataprovider.dart';
import 'package:provider/provider.dart';
import 'Screens/launchespage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LaunchesPage(),
      ),
    );
  }
}
