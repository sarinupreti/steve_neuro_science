import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sailor/sailor.dart';
import 'package:steve_beaudoin/components/title.dart';

class DetailsPageArguments extends BaseArguments {
  dynamic subTopics;

  DetailsPageArguments({
    @required this.subTopics,
  });
}

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
                  title: Text('',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://static1.squarespace.com/static/56df0f29a3360c18d09a4e8c/591dcd0ef5e231aa972579e8/5bd8be6940ec9ab5572f5e12/1540933145337/brain.gif?format=1500w",
                    fit: BoxFit.cover,
                  )),
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
                        title: "Neuro Science",
                        titleColor: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Neuroscience (or neurobiology) is the scientific study of the nervous system. It is a multidisciplinary branch of biology that combines physiology, anatomy, molecular biology, developmental biology, cytology, mathematical modeling, and psychology to understand the fundamental and emergent properties of neurons and neural circuits.The understanding of the biological basis of learning, memory, behavior, perception, and consciousness has been described by Eric Kandel as the ultimate challenge of the biological sciences. The scope of neuroscience has broadened over time to include different approaches used to study the nervous system at different scales and the techniques used by neuroscientists have expanded enormously, from molecular and cellular studies of individual neurons to imaging of sensory, motor and cognitive tasks in the brain.",
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Image.network(
                              "https://d1t0xk6rn1avc6.cloudfront.net/wp-content/uploads/STRESS-750x450.jpg",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Image.network(
                              "https://d1t0xk6rn1avc6.cloudfront.net/wp-content/uploads/STRESS-750x450.jpg",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Image.network(
                              "https://d1t0xk6rn1avc6.cloudfront.net/wp-content/uploads/STRESS-750x450.jpg",
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Neuroscience (or neurobiology) is the scientific study of the nervous system. It is a multidisciplinary branch of biology that combines physiology, anatomy, molecular biology, developmental biology, cytology, mathematical modeling, and psychology to understand the fundamental and emergent properties of neurons and neural circuits.The understanding of the biological basis of learning, memory, behavior, perception, and consciousness has been described by Eric Kandel as the ultimate challenge of the biological sciences. The scope of neuroscience has broadened over time to include different approaches used to study the nervous system at different scales and the techniques used by neuroscientists have expanded enormously, from molecular and cellular studies of individual neurons to imaging of sensory, motor and cognitive tasks in the brain.",
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
