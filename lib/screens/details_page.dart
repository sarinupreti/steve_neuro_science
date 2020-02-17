import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/shimmer.dart';
import 'package:steve_beaudoin/components/title.dart';

class DetailsPage extends StatelessWidget {
  final dynamic subTopics;

  const DetailsPage({this.subTopics});

  @override
  Widget build(BuildContext context) {
    print(subTopics);

    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              forceElevated: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    // Do something
                    Navigator.pop(context);
                  }),
              expandedHeight: MediaQuery.of(context).size.height / 3,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // title: Text(subTopics["subTopicTitle"],
                //     style: TextStyle(
                //       color: Colors.grey,
                //       fontSize: 16.0,
                //     )),
                background: CachedNetworkImage(
                  imageUrl: subTopics['images'][0] ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => CustomShimmer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                // Image.network(
                //   subTopics['images'][0],
                //   fit: BoxFit.cover,
                // )
              ),
            ),
            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TItle(
                        title: subTopics["subTopicTitle"],
                        titleColor: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Text(
                        subTopics["description"],
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, i) {
                              return CachedNetworkImage(
                                imageUrl: subTopics['images'][i] ?? "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.red, BlendMode.colorBurn)),
                                  ),
                                ),
                                placeholder: (context, url) => CustomShimmer(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                            }),
                      ),
                      SizedBox(height: 20),
                      Text(
                        subTopics["description"],
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ],
                  )),
            ])),
          ],
        ),
      ),
    );
  }
}
