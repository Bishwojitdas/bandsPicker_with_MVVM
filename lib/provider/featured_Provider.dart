import 'package:band_picker/model/featuredModel.dart';
import 'package:band_picker/repository/featured_Repository.dart';
import 'package:flutter/cupertino.dart';

class FeaturedProvider with ChangeNotifier{
FeaturedRepository? feRepo=FeaturedRepository();

List<FeaturedModel>? _felist=[];
List<FeaturedModel>? get felist=>_felist;

getFeaturedListData()async{
  _felist=await feRepo!.getFeaturedDataList();
  notifyListeners();
}

}