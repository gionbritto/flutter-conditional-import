import 'package:flutter/cupertino.dart';
import 'package:webinflutterapp/platform_alerts/platform_helper.dart'
    if (dart.library.html) './web_platform.dart'
    if (dart.library.io) './other_platform.dart';

abstract class CustomPlatform {
  factory CustomPlatform() => getAlertInstance();
  Future<void> displayAlert(BuildContext context, String message);
}
