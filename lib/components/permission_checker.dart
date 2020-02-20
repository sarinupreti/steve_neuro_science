import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:pedantic/pedantic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steve_beaudoin/components/permission_dialog.dart';

/// [PermissionChecker] class handle all permission checking stuff in fonepay app
/// You have to pass [BuildContext] which is used to display bottom sheet.
class PermissionChecker {
  /// [PermissionChecker] class contain functions which is used to check different
  /// permissions which is used by Fonepay app.
  ///
  /// [hasLocationPermission] function is used to check location permission.
  ///
  /// [hasLocationPermission] function will return true if location permission is granted
  /// otherwise, return false. [hasLocationPermission] function has optional parameter [onlyOnce]
  /// which is of bool type. If [onlyOnce] is true permission will be asked only once for
  /// aplication active session.

  static Future<bool> hasLocationPermission(BuildContext context) async {
    /// [isFirstTimeLocationRequest] function will return true if location permission is
    /// requested for first time otherwise return false

    Future<bool> _isFirstTimeLocationRequest() async {
      final String firstTimeLocationRequest = 'firstTimeLocationRequest';
      final Box box = await Hive.openBox(firstTimeLocationRequest);
      if (box.containsKey(firstTimeLocationRequest)) {
        return false;
      } else {
        unawaited(box.put(firstTimeLocationRequest, true));
        return true;
      }
    }

    bool isFirstTime = await _isFirstTimeLocationRequest();

    // Current permission status for camera
    PermissionStatus status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    final PermissionHandler permissionHandler = PermissionHandler();

    /// By default permission status is unknown in ios.
    /// So we have to ask permission for IOS from unknown status
    if (status == PermissionStatus.unknown) {
      await permissionHandler.requestPermissions([PermissionGroup.location]);
      status = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location);
    }

    if (status == PermissionStatus.denied) {
      if (Platform.isAndroid) {
        final bool show = await permissionHandler
            .shouldShowRequestPermissionRationale(PermissionGroup.location);

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'location',
            context: context,
          );
        } else {
          await permissionHandler
              .requestPermissions([PermissionGroup.location]);
          status = await PermissionHandler()
              .checkPermissionStatus(PermissionGroup.location);
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'location',
          context: context,
        );
      }
    }

    if (status == PermissionStatus.restricted) {
      PermissionDialog(
        permissionFor: 'location',
        context: context,
      );
    }

    if (status == PermissionStatus.disabled) {
      if (Platform.isAndroid) {
        bool service = await Location().serviceEnabled();
        if (!service) {
          Location().requestService();
        }
      }
    }

    return status == PermissionStatus.granted;
  }
}
