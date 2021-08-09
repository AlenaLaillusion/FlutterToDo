

class ChartModel{
  List<List<double>> prices;
  ChartModel({this.prices});

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
      prices: List<List<double>>.from(json['prices'].map((x) => List<double>.from(x.map((x) => x.toDouble())))));

   Map<String, dynamic> toJson() =>
       {
         "coordinates": List<dynamic>.from(
             prices.map((x) => List<dynamic>.from(x.map((x) => x))))
       };
}

/*
class Points {
  List<List<double>> coordinates;

  Points({this.coordinates});

  factory Points.fromJson(Map<String, dynamic> json) => Points(
      coordinates: List<List<double>>.from(json["paths"]["points"]
      ["coordinates"]
          .map((x) => List<double>.from(x.map((x) => x.toDouble())))));

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(
        coordinates.map((x) => List<dynamic>.from(x.map((x) => x))))
  };
}
*/
