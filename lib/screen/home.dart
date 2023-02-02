import 'package:band_picker/provider/featured_Provider.dart';
import 'package:band_picker/screen/popular_details.dart';
import 'package:band_picker/utils/details.dart';
import 'package:band_picker/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/popular_provider.dart';
import '../utils/gridview_custom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _formKey=GlobalKey<FormState>();
  final _searchController=TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final feModel=Provider.of<FeaturedProvider>(context, listen: false);
    final poModel=Provider.of<PopularProvider>(context, listen: false);
    feModel.getFeaturedListData();
    poModel.getPopularedListData();
  }

  @override
  Widget build(BuildContext context) {
    final feModel=Provider.of<FeaturedProvider>(context);


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffd0d6e1),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: const Image(image: AssetImage('assets/icons/music_logo.png')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(text: 'Bands', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent, fontSize: 25)),
                                TextSpan(text: 'picker', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25)),
                              ],
                            ),
                          ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: const TextStyle(fontSize: 18),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30), // <-- SEE HERE
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                const  Padding(
                  padding:  EdgeInsets.only(left: 5),
                  child: Text("Featured", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
                const SizedBox(height: 10,),
               Consumer<FeaturedProvider>(builder: (context, featured, child){
                 return featured.felist!=null? Container(
                   height: FullWidth(context)*1.1,
                   width: FullWidth(context),
                   child:  GridView.builder(
                     itemCount: featured.felist!.length,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       mainAxisSpacing: 15,
                       crossAxisSpacing: 15,
                     ),
                     itemBuilder: (BuildContext context, int index){
                       return GridViewCustoms(image: Image.asset(featured.felist![index].image, fit: BoxFit.fill), title: "${featured.felist![index].title}", onTab: () => Details(featuredModel:featured.felist![index]));
                     },
                     physics: NeverScrollableScrollPhysics(),
                   ),
                 ):Center(child: CircularProgressIndicator(),);
               }),
                const  Padding(
                  padding:  EdgeInsets.only(left:5),
                  child: Text("Popular", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
                const SizedBox(height: 10,),
                Consumer<PopularProvider>(builder: (context, popular, child){
                  return popular.polist!=null? Container(
                    height: FullWidth(context)*1.1,
                    width: FullWidth(context),
                    child:  GridView.builder(
                      itemCount: popular.polist!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (BuildContext context, int index){
                        return GridViewCustoms(image: Image.asset(popular.polist![index].image, fit: BoxFit.fill), title: "${popular.polist![index].title}", onTab: () => PopularDetials(popularModel: popular.polist![index],));
                      },
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ):Center(child: CircularProgressIndicator(),);
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
