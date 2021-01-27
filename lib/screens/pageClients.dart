import 'package:flutter/material.dart';

class PageClients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Tutorials"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(100.0),
      
        child: Container(
          child: Center(
            child: RaisedButton(
              child: Text("Click to check tutorials", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              onPressed: null,
        ),
          ),
    ),
      ));
  }
}