// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/client.dart';
import 'package:index2/driver.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'TRANSPORTATION JOBS MOBILE APPLICATION',
          style: TextStyle(color: Colors.white),
        )),
        body: Stack(
          children: [
            Image.asset(
              'images/bgi.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/bg3.png',
                  height: 300,
                  width: 600,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FOR YOUR TRANSPORT SOLUTIONS',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => Driver()))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_car),
                          Text(
                            'See Available drivers',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => client()))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.work),
                          Text(
                            'See Available Jobs',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
              
                Icons.perm_identity_outlined
                ),
              label: 'Profile',
            ),
          ],
        ));
  }
}
