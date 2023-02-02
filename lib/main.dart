import 'package:band_picker/provider/featured_Provider.dart';
import 'package:band_picker/provider/popular_provider.dart';
import 'package:band_picker/screen/account.dart';
import 'package:band_picker/screen/bookings.dart';
import 'package:band_picker/screen/home.dart';
import 'package:band_picker/screen/lkdjdl.dart';
import 'package:band_picker/utils/custom_bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(
      providers: providers,
     child:  const MyApp())
     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late PageController _pageController;
  int _pageIndex =0;
  late List<Widget> _screenList;
  var _scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(initialPage: 0);
    _screenList=[
      const Home(),
      const Bookings(),
      const HomePage(),
      const Account(),

    ];
  }
  _setPage(int index){
    setState(() {
      _pageController.jumpToPage(index);
      _pageIndex=index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_pageIndex!=0){
          _setPage(0);
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15),
              ), color: Colors.indigo
          ),
          child: Row(
            children: [
              BottomNavItem(icon: Icons.home, isSelect: _pageIndex==0, title: "Home", onTap:()=>_setPage(0)),
              BottomNavItem(icon: Icons.library_books_outlined, isSelect: _pageIndex==1, title: "Bookings", onTap:()=>_setPage(1)),
              BottomNavItem(icon: Icons.message_outlined,title: "Messages", isSelect: _pageIndex==2, onTap:()=>_setPage(2)),
              BottomNavItem(icon: Icons.account_circle,title: "Account", isSelect: _pageIndex==3, onTap:()=>_setPage(3)),
            ],
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
            itemCount: _screenList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
            return _screenList[index];
            }),
      ),
    );
  }
}


List<SingleChildWidget>providers=[
  ChangeNotifierProvider<FeaturedProvider>(create:(_)=> FeaturedProvider()),
  ChangeNotifierProvider<PopularProvider>(create:(_)=> PopularProvider()),
];
