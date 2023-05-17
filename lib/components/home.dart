import 'package:flutter/material.dart';
import 'package:sgps/widgets/body_home.dart';
import 'package:sgps/widgets/footer.dart';
import 'package:sgps/widgets/header.dart';
import 'package:sgps/widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        Header(),
        Row(children: [
          SideBar(),
          BodyHome(),
        ]),
        Footer()
      ],
    ));
  }
}
