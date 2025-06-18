import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart'; // assuming you imported the package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const GlassDemoScreen(),
    );
  }
}

class GlassDemoScreen extends StatelessWidget {
  const GlassDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image or gradient
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), // Add a bg image in assets
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Glassify widget
        Center(
          child: Glassify(
            blurSigma: 15.0,
            opacity: 0.2,
            borderRadius: BorderRadius.circular(30),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.ac_unit, size: 50, color: Colors.white),
                const SizedBox(height: 12),
                Text(
                  'Glassify !',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
