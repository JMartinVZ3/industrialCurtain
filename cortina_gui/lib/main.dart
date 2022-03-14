import 'package:cortina_gui/src/bindings/home_binding.dart';
import 'package:cortina_gui/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onReady: () {},
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Cortina GUI',
      home: const HomePage(),
    );
  }
}
