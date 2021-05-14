
import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
   String _data = 'TopLevel Data 111111';

   String get getData => _data;

  void changeStrind(String newString ) {
    _data = newString;
    notifyListeners();
  }
}