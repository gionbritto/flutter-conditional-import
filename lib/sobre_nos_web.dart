// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

class SobreNosWeb extends StatefulWidget {
  const SobreNosWeb({super.key});

  @override
  State<SobreNosWeb> createState() => _SobreNosWebState();
}

class _SobreNosWebState extends State<SobreNosWeb> {
  late PlatformWebViewController _webcontroller;

  @override
  void initState() {
    super.initState();

    WebViewPlatform.instance = WebWebViewPlatform();
    _webcontroller = PlatformWebViewController(
        const PlatformWebViewControllerCreationParams());
    _webcontroller.loadRequest(LoadRequestParams(
        uri: Uri.parse('https://www.riagah.com.br/servicos-empresa.html')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nós'),
        backgroundColor: Colors.grey[100],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Fechar Página',
                style: TextStyle(color: Colors.white)),
          ),
          const Center(
            child: Text("Pagina WebView web"),
          ),
          Expanded(
            child: PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(controller: _webcontroller),
            ).build(context),
          ),
        ],
      ),
    );
  }

  // Future<void> loadLibraryDynamically(String libraryName) async {
  //   final loader = LibraryLoader(libraryName);
  //   await loader.load();
  // }
}
