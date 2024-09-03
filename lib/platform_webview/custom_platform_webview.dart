import 'package:flutter/material.dart';
import 'package:webinflutterapp/platform_webview/webview_platform_helper.dart'
    if (dart.library.html) './web_platform_webview.dart'
    if (dart.library.io) './android_platform_webview.dart';

abstract class CustomPlatformWebview {
  factory CustomPlatformWebview() => getWebviewInstance();
  Widget getWebviewWidget(BuildContext context);
}
