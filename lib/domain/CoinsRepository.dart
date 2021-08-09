import 'package:flutter_provider/models/ChartModel.dart';
import 'package:http/http.dart';

abstract class CoinsRepository {
  Future<Response> pricesList();
}