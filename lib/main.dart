import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'models/data.dart';

void main() {
  runApp(MyApp());
}

// ? Какие приемущества дает  Provider
// * - упрощенное выделение / уничтожение ресурсов
// * - Lazy-loadding (Ленивая загрузка)
// * - Более локаничный подход в написании (че создавать каждый раз новые классы)
// * - Простой способ использования через watch / read
// * - Удобен у управлении devTools

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>( 
      create: (context) => Data(),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.red,
            accentColor: Colors.redAccent,
          ),
          title: 'Task App Provider',
          home: HomePagge(),
        ),
    );
  }
}


class HomePagge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text(context.watch<Data>().getData)),
      ),
      body: Center(
        child: Widget1(),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Widget2(),
    );
  }
}

class Widget2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Widget2'),
          ),
          MyTextFiled(),
          Widget3(),
        ],
      ),
    );
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(context.watch<Data>().getData),
    );
  }
}

class MyTextFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newData) => context.read<Data>().changeStrind(newData),
    );
  }
}

