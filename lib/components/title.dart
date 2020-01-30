import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/utils/gradient.dart';

class TItle extends StatelessWidget {
  @required
  final String title;
  final Color titleColor;

  const TItle({Key key, this.title, this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return titleColor != null
        ? Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: titleColor ?? Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        : Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 30,
                  foreground: Paint()..shader = linearGradient,
                  fontWeight: FontWeight.bold),
            ),
          );
  }
}
