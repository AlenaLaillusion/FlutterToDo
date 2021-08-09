import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_provider/bloc/PriceState.dart';
import 'package:flutter_provider/bloc/PriceState.dart';
import 'package:flutter_provider/domain/ApiCoinsRepository.dart';
import 'package:flutter_provider/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'bloc/PriceBloc.dart';
import 'bloc/PriceEvent.dart';
import 'bloc/PriceState.dart';
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
        child: LineChartWidget(),
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

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];
  final coinRepository = ApiCoinsRepository();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) {
      return PriceBloc(coinRepository);
    },
    child: BlocBuilder<PriceBloc, PriceState> (
        builder: (context, state){

          switch (state.state) {
            case ProfileStatus.start:
            context.read<PriceBloc>().add(CreateProfile());
            return Center(child: CircularProgressIndicator(),
            );

            case ProfileStatus.loaded:
              print(state.priceList.first.prices);
              print(DateTime.fromMillisecondsSinceEpoch((1628427685723 * 0.001).toInt()));
              return Container(
                  child: LineChart(
                    LineChartData(
                        lineBarsData: [
                        LineChartBarData(
                        spots: [
                        FlSpot(state.priceList.first.prices[26][0], state.priceList.first.prices[26][1]),
                        FlSpot(state.priceList.first.prices[12][0], state.priceList.first.prices[12][1]),
                        FlSpot(state.priceList.first.prices[6][0], state.priceList.first.prices[6][1]),
                        FlSpot(state.priceList.first.prices[3][0], state.priceList.first.prices[3][1]),
                        FlSpot(state.priceList.first.prices[1][0], state.priceList.first.prices[1][1]),
                    ],
                  ),
                  ]
              ),
          ),
              );
          }
          return Text('No');
        },
      )
    );
  }
}


