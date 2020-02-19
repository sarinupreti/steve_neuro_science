import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/expanded_card.dart';
import 'package:steve_beaudoin/components/search_widget.dart';
import 'package:steve_beaudoin/components/shimmer.dart';
import 'package:steve_beaudoin/components/title.dart';
import 'package:steve_beaudoin/database/database.dart';
import 'package:steve_beaudoin/models/topics.dart';
import 'package:steve_beaudoin/screens/maps/maps_screen.dart';
import 'package:steve_beaudoin/screens/notifications/notification_screen.dart';
import 'package:steve_beaudoin/screens/search/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<List<TopicHeader>> getAllTopics = DatabaseService().getAllTopics;

  List<TopicHeader> topic;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 1920, allowFontScaling: false);

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
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          child: Icon(
            FontAwesome.bell_o,
            color: Colors.grey,
            size: 20,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                showSearchScreen(context, topic);
              },
              child: Icon(
                FontAwesome.search,
                color: Colors.grey,
                size: 20,
              ),
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
              title: Text("Nearby Places"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapsScreen()));
              },
            ),
            // ListTile(
            //   title: Text("title 1"),
            //   onTap: () {},
            // ),
            // ListTile(
            //   title: Text("title 1"),
            //   onTap: () {},
            // ),
            // ListTile(
            //   title: Text("title 1"),
            //   onTap: () {},
            // ),
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
                  child: StreamBuilder<List<TopicHeader>>(
                      stream: getAllTopics,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (!snapshot.hasData) {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final collectionData = snapshot.data;

                                topic = [
                                  TopicHeader(
                                      id: collectionData[index].id,
                                      description:
                                          collectionData[index].description,
                                      imageUrl: collectionData[index].imageUrl,
                                      subTopics:
                                          collectionData[index].subTopics,
                                      title: collectionData[index].title),
                                ];

                                return ExpandedCard(
                                  title: collectionData[index].title ?? "",
                                  backgroundColor: Colors.red,
                                  imageUrl:
                                      collectionData[index].imageUrl ?? "",
                                  titleColor: Colors.white,
                                  subTopics:
                                      collectionData[index].subTopics ?? [],
                                );
                              });
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<TopicHeader> showSearchScreen(
      BuildContext context, List<TopicHeader> topic) {
    return showSearch(
      context: context,
      delegate: SearchPage<TopicHeader>(
        items: topic,
        barTheme: ThemeData(
          primaryColor: Colors.white,
        ),
        searchLabel: 'Search Topics',
        suggestion: Center(
          child: Text('Filter topics by name, sub-topics, types, date.'),
        ),
        failure: Center(
          child: Text('No topic found :('),
        ),
        filter: (t) => [t.title, t.description, t.subTopics.toString()],
        builder: (t) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: t.imageUrl ?? "",
              placeholder: (context, url) => CustomShimmer(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(
              t.subTopics.map((e) => e["subTopicTitle"]).toString(),
              maxLines: 1,
            ),
            subtitle: Text(
              t.description,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}
