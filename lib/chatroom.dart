import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatroom extends StatefulWidget {
  const chatroom({super.key});

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Chat here',
                suffix: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )),
          )
        ],
      ),
      appBar: AppBar(
          title: Text('CHAT ROOM'),
        ),
    );
  }
}
