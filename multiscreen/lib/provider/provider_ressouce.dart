import 'package:flutter/widgets.dart';
import 'package:multiscreen/model/models.dart';
import 'dart:collection';

class ModelsNotifier with ChangeNotifier{

  List<Models> _modelslist = [];

  UnmodifiableListView<Models> get modelslist => UnmodifiableListView(_modelslist);

  void addModel(Models models){
    _modelslist.add(models);
    notifyListeners();
  }

}