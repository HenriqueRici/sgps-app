import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgps/components/base_layout.dart';
import 'package:sgps/global_binding.dart';
import 'package:sgps/widgets/body_home.dart';
import 'package:sgps/widgets/body_inscricoes.dart';

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
      initialBinding: GlobalBinding(),
      title: 'SGPS',
      initialRoute: '/',
      home: BaseLayout(
        child: BodyHome(),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: (() => const BaseLayout(
                child: Expanded(
                  child: Text('data'),
                ),
              )),
        ),
        GetPage(
          name: '/inscricoes',
          page: (() => const BaseLayout(
                child: BodyInscricoes(),
              )),
        ),
      ],
    );
  }
}
