import 'package:flutter/material.dart';
import 'dart:async';

import 'package:thirdparty_keyboard_checker/thirdparty_keyboard_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _isCustomKeyboard = 'Unknown';
  final _thirdPartyKeyboardChecker = ThirdPartyKeyboardChecker.instance;

  Future<void> check3rdKeyboard() async {
    final is3rdKeyboard = await _thirdPartyKeyboardChecker.check3rdKeyboard();
    setState(() {
      _isCustomKeyboard = is3rdKeyboard ? 'Using 3rd Keyboard' : 'Default';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text('Using 3rd Keyboard: $_isCustomKeyboard\n'),
              ),
              TextButton(
                onPressed: () {
                  check3rdKeyboard();
                },
                child: const Text('Check using 3rd Keyboard'),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              const Center(child: Text('Disable auto suggestions')),
              const TextField(
                autocorrect: false,
                enableSuggestions: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
