import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steve_beaudoin/utils/colors.dart';
import 'package:steve_beaudoin/utils/const.dart';
import 'package:steve_beaudoin/utils/sizes.dart';

class PermissionDialog extends StatelessWidget {
  //
  //
  final String permissionFor;
  final BuildContext context;
  final bool disabled;

  PermissionDialog({
    @required this.context,
    @required this.permissionFor,
    this.disabled = false,
  }) {
    openDialog();
  }

  openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String message = permissionFor == "location"
        ? "${Const().appName} needs permission to access your device camera to take a photo. Please go to Settings > Privacy > Camera, and enable EventsMo."
        : "${Const().appName} needs permission to access your photo library to select a photo. Please go to Settings > Privacy > Photos, and enable EventsMo.";

    return SimpleDialog(
      contentPadding: EdgeInsets.only(bottom: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: UISize.height(30)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: UISize.width(11)),
                child: Text(
                  "Permission Required",
                  style: TextStyle(
                      color: UIColors.blackText,
                      fontSize: UISize.fontSize(16),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: UISize.width(22)),
                child: Text(
                  message,
                  style: TextStyle(
                      color: UIColors.greyText,
                      fontSize: UISize.fontSize(14),
                      height: 1.6,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: UISize.height(12)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top:
                              BorderSide(width: 1, color: UIColors.separator))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: UISize.width(20)),
                            child: Text(
                              "Not Now",
                              style: TextStyle(
                                  color: UIColors.greyText,
                                  fontSize: UISize.fontSize(14),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: UISize.width(34),
                        width: 1,
                        color: UIColors.separator,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          onTap: () async {
                            if (this.disabled) {
                              final AndroidIntent intent = AndroidIntent(
                                action:
                                    'android.settings.LOCATION_SOURCE_SETTINGS',
                              );
                              await intent.launch();
                              Navigator.of(context).pop();
                            } else {
                              await PermissionHandler().openAppSettings();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: UISize.width(20)),
                            child: Text(
                              "Open Settings",
                              style: TextStyle(
                                  color: UIColors.primaryColor,
                                  fontSize: UISize.fontSize(14),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
