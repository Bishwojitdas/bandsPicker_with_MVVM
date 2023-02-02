import 'package:flutter/material.dart';

import '../model/popularModel.dart';
import '../repository/popular_repository.dart';

class PopularProvider with ChangeNotifier{
  PopularRepository? poRepo=PopularRepository();

  List<PopularModel>? _polist=[];
  List<PopularModel>? get polist=>_polist;

  getPopularedListData()async{
    _polist=await poRepo!.getPopularedDataList();
    notifyListeners();
  }

}