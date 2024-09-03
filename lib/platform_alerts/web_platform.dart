import 'package:flutter/src/widgets/framework.dart';
import 'dart:js' as js;

import 'package:webinflutterapp/platform_alerts/custom_platform.dart';

CustomPlatform getAlertInstance() => CustomPlatformWeb();

class CustomPlatformWeb implements CustomPlatform {
  @override
  Future<void> displayAlert(BuildContext context, String message) async {
    js.context.callMethod("displayAlert", [message]);
  }
}
