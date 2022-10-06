// ignore_for_file: prefer_const_constructors

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
          )
 ),
 body: Stack(
   children: [
     Image.asset('images/bgi.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
     Center(
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
           Text(
                    'FOR YOUR TRANSPORT SOLUTIONS',
                    style: TextStyle(color: Colors.white),
                  ),
       TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => Driver()))),
                      child: Text(
                        'See Available drivers',
                       style: TextStyle(color: Colors.white),
                      )),
                       TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => client()))),
                      child: Text(
                        'See Available Jobs',
                         style: TextStyle(color: Colors.white),
                        ))
        ],
       ),
     ),
   ],
 )
 
      );

    
  }
}