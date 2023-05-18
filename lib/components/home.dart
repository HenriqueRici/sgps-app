import 'package:flutter/material.dart';
import 'package:sgps/components/base_layout.dart';
import 'package:sgps/widgets/body_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BaseLayout(
        child: BodyHome(),
      ),
    );
  }
}
