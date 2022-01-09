import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier{
  String siteTitle = "dachnyak.ru | Сайт по услугам ландшафного дизайна";

  void changeTitle(String _input) {
    siteTitle = _input;
    notifyListeners();
  }
}