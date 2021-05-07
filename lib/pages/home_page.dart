import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[

        ],),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { } ,   //add task ,
        elevation: 5,
         tooltip: 'Добавить новую задачу',
      ),
    );
  }
}
