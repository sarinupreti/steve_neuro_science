import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedCard extends StatelessWidget {
  @required
  final String title;
  final Color color;
  final List<Color> listColor;

  const ExpandedCard({Key key, this.title, this.color, this.listColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              color: color ?? Color(0xffEE0979),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: listColor ?? [Color(0xffEE0979), Color(0xffFF6A00)]),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
