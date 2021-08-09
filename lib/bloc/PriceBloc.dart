
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_provider/bloc/PriceEvent.dart';
import 'package:flutter_provider/bloc/PriceState.dart';
import 'package:flutter_provider/domain/ApiCoinsRepository.dart';
import 'package:flutter_provider/models/ChartModel.dart';
import 'package:http/http.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final ApiCoinsRepository _apiRepository;
  PriceBloc(this._apiRepository) : super(PriceState(ProfileStatus.start));

  @override
  Stream<PriceState> mapEventToState(PriceEvent event) async* {
    if (event is CreateProfile) {
      yield* _getCoinsList(event, state);
    }

  }

  Stream<PriceState> _getCoinsList(PriceEvent event, PriceState state) async*{

    List<ChartModel> pricesList = [];

    Response response = await _apiRepository.pricesList();

    if(response.statusCode == 200) {
    //  var decodePriceList = json.decode(response.body) as List<List<double>>;

      pricesList.add(ChartModel.fromJson(json.decode(response.body)));

      yield state.copyWith(ProfileStatus.loaded, pricesList);
      }
    else {
      print(response.statusCode);
    }
  }
}