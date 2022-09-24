import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/chatroom.dart';

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
    'MAIZE1.jfif',
    
  ];
   List<String>title=[
    'GYPSUM in Garrissa,Destination :Kasese,Congo',
    'COAL in Songea Tanzania,Destination: Bamburi Cement, Kenya',
    'CONTAINER  in Mombasa port,Destination: Kampala,Uganda',
    'MAIZE in Songea Tanzania,Destination:Nairobi,Kenya',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Jobs'),
      ),
      body: ListView.builder(
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
    );
  }
}