import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/title.dart';
import 'package:steve_beaudoin/utils/colors.dart';
import 'package:steve_beaudoin/utils/sizes.dart';
import 'package:steve_beaudoin/utils/textStyle.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool connected = true;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        connected = connectivity != ConnectivityResult.none;
        return Column(children: [
          Material(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
              height: connected ? 0 : 24,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: connected
                    ? Text(
                        'ONLINE',
                        style: StyleText.mediumWhite15,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'OFFLINE',
                            style: StyleText.mediumWhite15,
                          ),
                          SizedBox(width: 8.0),
                          SizedBox(
                            width: 12.0,
                            height: 12.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          Expanded(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  backgroundColor: Colors.white,
                  brightness: connected ? Brightness.light : Brightness.dark,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: UIColors.mediumGray,
                  ),
                  actions: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: UISize.width(16)),
                          child:
                              Text("Clear", style: StyleText.mediumDarkGrey20),
                        ),
                      ),
                    )
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TItle(title: "Notifications"),
                      Expanded(
                        child: Container(
                          child: ListView(
                            children: <Widget>[
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                              notificationItem(context),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ]);
      },
      child: SizedBox(),
    );
  }

  Padding notificationItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        child: Card(
          color: UIColors.white,
          elevation: 5,
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16),
                    child: Text("Notification 1 ",
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 16, right: 16),
                    child: Text("this is a test message",
                        maxLines: 5,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
