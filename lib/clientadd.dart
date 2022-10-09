// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class clientAdd extends StatefulWidget {
  const clientAdd({super.key});

  @override
  State<clientAdd> createState() => _clientAddState();
}

class _clientAddState extends State<clientAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADD A NEW JOB '),
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/bg1.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description of goods ',
                ),
              ),
                ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tonnage ',
                  ),
              ),
                ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Location ',
                  ),
              ),
                ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Destination ',
                  ),
              ),
                ),
            ]),
            
          ],
        ));
  }
}
