
import 'dart:convert';
import 'dart:io';

import 'package:flutter_provider/models/ChartModel.dart';
import 'package:http/http.dart' as http;

import 'CoinsRepository.dart';

class ApiCoinsRepository implements CoinsRepository {
  @override
  Future<http.Response> pricesList() async {
    final response = await http.get(
      Uri.parse(coinsListUrl));

    return response;
    }

  static const String serverUrl = "https://api.coingecko.com/api/v3";

  final String coinsListUrl = serverUrl +
      "/coins/bitcoin/market_chart?vs_currency=usd&days=1&interval=hourly";             //"/coins/list";

}