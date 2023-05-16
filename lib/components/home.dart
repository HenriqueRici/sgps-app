import 'package:flutter/material.dart';
import 'package:sgps/widgets/body_copy.dart';
import 'package:sgps/widgets/footer.dart';
import 'package:sgps/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [Header(), BodyCopy(), Footer()],
    ));
  }
}
