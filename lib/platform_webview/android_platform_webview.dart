import 'package:flutter/src/widgets/framework.dart';
import 'package:webinflutterapp/platform_webview/custom_platform_webview.dart';
import 'package:webinflutterapp/sobre_nos_mobile.dart';

CustomPlatformWebview getWebviewInstance() => AndroidPlatformWebview();

class AndroidPlatformWebview implements CustomPlatformWebview {
  @override
  Widget getWebviewWidget(BuildContext context) {
    return const SobreNosMobile();
  }
}
