// CustomPlatformWebview getInstance() =>

import 'package:flutter/src/widgets/framework.dart';
import 'package:webinflutterapp/platform_webview/custom_platform_webview.dart';
import 'package:webinflutterapp/sobre_nos_web.dart';

CustomPlatformWebview getWebviewInstance() => WebPlatformWebview();

class WebPlatformWebview implements CustomPlatformWebview {
  @override
  Widget getWebviewWidget(BuildContext context) {
    return const SobreNosWeb();
  }
}
