// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/chatroom.dart';
import 'package:index2/clientadd.dart';
import 'package:index2/main.dart';

class client extends StatefulWidget {
  const client({super.key});

  @override
  State<client> createState() => _clientState();
}

class _clientState extends State<client> {
  List<String>images=[
     'coal1.jfif',
    'cont4.jfif',
  ];
   List<String>title=[
    'COAL in Songea Tanzania,Destination: Bamburi Cement, Kenya',
    'CONTAINER  in Mombasa port,Destination: Kampala,Uganda',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Jobs',style: TextStyle(color: Colors.greenAccent),),
        actions: [TextButton(onPressed: (){
          Auth().SignOut();
        }, child: Text('Logout',style: TextStyle(color: Colors.lightGreenAccent),))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => chatroom()))),
                  child: Card(
                    child: Column(
                      children: [
                        Text(title[index]),
                        Image.asset('images/${images[index]}'),
                        
                      ],
                    ),
                  ),
                ),
              );
            })),
            
          ),
          TextButton(
                   onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => clientAdd()))),
                         child: Text('Add a new Job',style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}