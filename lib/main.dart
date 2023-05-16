import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgps/components/home.dart';
import 'package:sgps/processo_seletivo_binding.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ProcessoSeletivoBinding(),
      title: 'SGPS',
      routes: {
        '/': (_) => const HomePage(),
        // '/page1': (_) => const Page1(),
        // '/page2': (_) => const Page2(),
        // '/page3': (_) => const Page3(),
      },
    );
  }
}
