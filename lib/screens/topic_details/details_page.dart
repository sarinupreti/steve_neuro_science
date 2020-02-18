import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/shimmer.dart';
import 'package:steve_beaudoin/components/title.dart';

class DetailsPage extends StatelessWidget {
  final dynamic subTopics;

  const DetailsPage({this.subTopics});

  @override
  Widget build(BuildContext context) {
    print(subTopics);

    final images = subTopics["images"];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              forceElevated: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              expandedHeight: MediaQuery.of(context).size.height / 3,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: CachedNetworkImage(
                  imageUrl:
                      images != null && images.length > 0 ? images[0] : "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.red, BlendMode.color)),
                    ),
                  ),
                  placeholder: (context, url) => CustomShimmer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  errorWidget: (context, url, error) => CustomShimmer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              Container(
                  // margin: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TItle(
                          title: subTopics["subTopicTitle"],
                          titleColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          subTopics["description"],
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      SizedBox(height: 20),
                      images != null && images.length > 0
                          ? Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Swiper(
                                autoplay: true,
                                itemBuilder: (BuildContext context, int i) {
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
                                                Colors.red, BlendMode.color)),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        CustomShimmer(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  );
                                },
                                itemCount: images.length,
                                pagination: new SwiperPagination(
                                    builder: new DotSwiperPaginationBuilder(
                                        activeColor: Colors.white,
                                        color: Colors.white.withOpacity(0.5))),
                                control: new SwiperControl(
                                    color: Colors.white.withOpacity(0.5)),
                              ))
                          : SizedBox(height: 0, width: 0),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          subTopics["description"],
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )),
            ])),
          ],
        ),
      ),
    );
  }
}
