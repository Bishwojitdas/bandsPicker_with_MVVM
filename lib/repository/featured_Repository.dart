import 'package:band_picker/model/featuredModel.dart';
import 'package:band_picker/utils/images.dart';

class FeaturedRepository{
  List<FeaturedModel> FeaturedList = [
    FeaturedModel(1, 1, Images.ARTCELL_FEATURED, "Artcell", "Artcell is a Bangladeshi progressive metal band formed in October 1999 by vocalist and riff guitarist George Lincoln D'Costa, lead guitarist Ershad Zaman, bassist Saef Al Nazi Cézanne and drummer Kazi Sazzadul Asheqeen Shaju.", "40000"),
    FeaturedModel(1, 2, Images.NOGOR_BAUL_FEATURED, "Nogor Baul", "Faruq Mahfuz Anam (Bengali: ফারুক মাহফুজ আনাম, born 2 October 1964), known mononymously as James, is a Bangladeshi singer-songwriter, guitarist and composer, also known as a playback singer. He is the lead singer, songwriter and guitarist of the rock band Nagar Baul (previously Feelings). He is often referred by the name ", "35000"),
    FeaturedModel(1, 3, Images.WARFAZE_FEATURED, "Warfaze", "Warfaze (Bengali: ওয়ারফেইজ) is a Bangladeshi heavy metal band formed in 6 June 1984 in Dhaka by Kamal, Meer, Helal, Naimul, and Bappy. They are one of the early heavy metal bands in Bangladesh. The band had numerous line-up changes since 1984. Since its inception, the band has released seven studio albums, one compilation album, and several singles.", "25000"),
    FeaturedModel(1, 4, Images.MILES_FEATURED, "Miles", "hey released their self titled debut studio album Miles in 1982, which contained English numbers. They released their second album A Step Farther in 1986. After four years, they released their third studio and first Bengali album Protisruti (Promise) in 1991.", "25000"),
  ];

  Future<List<FeaturedModel>> getFeaturedDataList() async{
    return FeaturedList;
  }
}