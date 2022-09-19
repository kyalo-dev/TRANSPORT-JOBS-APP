import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class client extends StatefulWidget {
  const client({super.key});

  @override
  State<client> createState() => _clientState();
}

class _clientState extends State<client> {
  List<String>images=[
    'gypsum2.jfif',
    'coal1.jfif',
    'cont4.jfif',
    'maize1.jfif',
  ];
   List<String>title=[
    'gypsum in Garrissa',
    'coal in Songea Tanzania',
    'container in Mombasa port',
    'maize in Songea Tanzania',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: ((context, index) {
        return Column(
          children: [
            Text(title[index]),
            Image.asset('images/${images[index]}'),
          ],
        );
      })),
    );
  }
}