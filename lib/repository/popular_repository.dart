import '../model/popularModel.dart';
import '../utils/images.dart';

class PopularRepository{
  List<PopularModel> PopularList = [
    PopularModel(2, 1, Images.ARTCELL_POPULARED, "Artcell", "Artcell is a Bangladeshi progressive metal band formed in October 1999 by vocalist and riff guitarist George Lincoln D'Costa, lead guitarist Ershad Zaman, bassist Saef Al Nazi Cézanne and drummer Kazi Sazzadul Asheqeen Shaju.", "40000"),
    PopularModel(2, 2, Images.LRB_POPULARED, "LRB", "Love Runs Blind, often abbreviated as LRB, was a Bangladeshi rock band formed in 5 April 1991 in Chittagong City by Ayub Bachchu. They are one of the most successful bands of Bangladesh.[2] Since their formation, they have released thirteen studio albums, one live album and two compilation albums", "40000"),
    PopularModel(2, 3, Images.NEMESIS_POPULARED, "NEMISIS", "Artcell is a Bangladeshi progressive metal band formed in October 1999 by vocalist and riff guitarist George Lincoln D'Costa, lead guitarist Ershad Zaman, bassist Saef Al Nazi Cézanne and drummer Kazi Sazzadul Asheqeen Shaju.", "20000"),
    PopularModel(2, 4, Images.AURTHOHIN_POPULARED, "AURTHOHIN", "hey released their self titled debut studio album Miles in 1982, which contained English numbers. They released their second album A Step Farther in 1986. After four years, they released their third studio and first Bengali album Protisruti (Promise) in 1991.", "25000"),
  ];

  Future<List<PopularModel>> getPopularedDataList() async{
    return PopularList;
  }
}