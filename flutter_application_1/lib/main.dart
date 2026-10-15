import 'package:flutter/material.dart';
import 'screens/screen_1.dart';
import 'screens/screen_2.dart';
import 'screens/screen_3.dart';
import 'screens/screen_4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _tile(context, '1', const Screen1()),
            _tile(context, '2', const Screen2()),
            _tile(context, '3', const Screen3()),
            _tile(context, '4', const Screen4()),
          ],
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
    );
  }
}