import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/expanded_card.dart';
import 'package:steve_beaudoin/components/title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black, letterSpacing: 1.5, fontSize: 20),
          ),
        ),
        leading: Icon(
          FontAwesome.bell_o,
          color: Colors.grey,
          size: 20,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              FontAwesome.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 200,
            ),
            ListTile(
              title: Text("title 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("title 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("title 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("title 1"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TItle(
                title: "Categories",
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpandedCard(
                          title: "Neuro Since",
                          backgroundColor: Colors.red,
                          titleColor: Colors.white,
                          menuOptions: ["Introduction", "history", "Types"],
                          subTitles: ["Introduction", "history", "Types"],
                          navigateTo: () {},
                          assetId: "1",
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
