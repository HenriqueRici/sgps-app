import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgps/components/home.dart';
import 'package:sgps/components/inscricoes.dart';
import 'package:sgps/processo_seletivo_binding.dart';

import 'components/home_copy2.dart';

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
      initialRoute: '/',
      home: const HomePage(),
      getPages: [
        GetPage(
          name: '/',
          page: (() => const HomePage()),
        ),
        GetPage(
          name: '/inscricoes',
          page: (() => const InscricoesPage()),
        ),
      ],
    );
  }
}
