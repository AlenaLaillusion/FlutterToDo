
import 'package:equatable/equatable.dart';
import 'package:flutter_provider/models/ChartModel.dart';


class PriceState extends Equatable {
  // ignore: non_constant_identifier_names
  PriceState(this.state, [List<ChartModel> priceList]) {
    this.priceList = priceList;
  }


  final ProfileStatus state;
  List<ChartModel> priceList;

  PriceState copyWith(
      ProfileStatus status,
      [List<ChartModel> priceList]
      ) {
    return PriceState(status, priceList);
  }


  @override
  List<Object> get props => [state];
}

enum ProfileStatus { loaded, start }