import 'package:band_picker/provider/popular_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/popularModel.dart';
import '../utils/color_resources.dart';
import '../utils/custom_font.dart';
import 'details_button.dart';

class PopularDetials extends StatefulWidget {
  PopularModel popularModel;
  PopularDetials({Key? key, required this.popularModel}) : super(key: key);

  @override
  State<PopularDetials> createState() => _PopularDetialsState();
}

class _PopularDetialsState extends State<PopularDetials> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final detialspopularMdl =
    Provider.of<PopularProvider>(context, listen: false);
    detialspopularMdl.getPopularedListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMARY,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Consumer<PopularProvider>(
          builder: (context, popular, child) {
            return popular.polist != null
                ? Text("${widget.popularModel.title} Details",
                style: LatoRegular.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))
                : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              widget.popularModel.image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.6),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Color(0xffd0d6e1),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.popularModel.title} Music BD",
                          style: LatoRegular.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dhaka, Bangladesh",
                          style: LatoRegular.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DetialsButton(
                                  icon: Icons.person_outline,
                                  title: "S Muscian"),
                              DetialsButton(
                                  icon: Icons.play_circle_outlined,
                                  title: "15 Concert"),
                              DetialsButton(
                                  icon: Icons.music_note_outlined,
                                  title: "Metal Band"),
                              DetialsButton(
                                  icon: Icons.train_outlined,
                                  title: "Way of Journey"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "About ${widget.popularModel.title}",
                          style: LatoRegular.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Text(
                            "${widget.popularModel.about}",
                            style: LatoRegular.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Price Details",
                          style: LatoRegular.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_outlined,
                              color: Colors.red,
                              size: 16,
                            ),
                            Text(
                              "Start from ${widget.popularModel.price}",
                              style: LatoRegular.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                            "Request for Book",
                            style: LatoRegular.copyWith(
                                color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}