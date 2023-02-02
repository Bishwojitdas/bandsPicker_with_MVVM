import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/featuredModel.dart';
import '../provider/featured_Provider.dart';
import '../screen/details_button.dart';
import 'color_resources.dart';
import 'custom_font.dart';

class Details extends StatefulWidget {

  FeaturedModel featuredModel;
  Details({Key? key, required this.featuredModel}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final detialsFatureMdl =
    Provider.of<FeaturedProvider>(context, listen: false);
    detialsFatureMdl.getFeaturedListData();
  }

  @override
  Widget build(BuildContext context) {

    final detialsFatureMdl = Provider.of<FeaturedProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMARY,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Consumer<FeaturedProvider>(
          builder: (context, featured, child) {
            return featured.felist != null
                ? Text("${widget.featuredModel.title} Details",
                style: LatoRegular.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))
                : const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
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
              widget.featuredModel.image,
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
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.featuredModel.title} Music BD",
                          style: LatoRegular.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dhaka, Bangladesh",
                          style: LatoRegular.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
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
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "About ${widget.featuredModel.title}",
                          style: LatoRegular.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Text(
                            "${widget.featuredModel.about}",
                            style: LatoRegular.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text("Price Details",
                            style: LatoRegular.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee_outlined,
                              color: Colors.red,
                              size: 16,
                            ),
                            Text(
                              "Start from ${widget.featuredModel.price}",
                              style: LatoRegular.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text("Request for Book",
                              style: LatoRegular.copyWith(
                                  color: Colors.white, fontSize: 20))),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}