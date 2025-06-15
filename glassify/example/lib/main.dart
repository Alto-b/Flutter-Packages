import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlassContainer Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Glassify(
            child: Text(
              'This is glassy! ✨',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
