import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInscricoes extends StatelessWidget {
  const BodyInscricoes({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = Get.arguments;
    return Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'ID: $id',
            style: const TextStyle(fontSize: 100),
          ),
        ));
  }
}
