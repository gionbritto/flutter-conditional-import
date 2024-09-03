import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SobreNosMobile extends StatefulWidget {
  const SobreNosMobile({super.key});

  @override
  State<SobreNosMobile> createState() => _SobreNosMobileState();
}

class _SobreNosMobileState extends State<SobreNosMobile> {
  late WebViewController _controllerWeb;

  @override
  void initState() {
    super.initState();
    _controllerWeb = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
        const Text("carregando..");
      }, onPageStarted: (String url) {
        const Text("carregando..");
      }, onNavigationRequest: (NavigationRequest request) {
        if (request.url
            .startsWith('https://www.riagah.com.br/servicos-empresa.html')) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      }))
      ..loadRequest(
          Uri.parse('https://www.riagah.com.br/servicos-empresa.html'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sobre nós")),
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
          Expanded(
            child: WebViewWidget(controller: _controllerWeb),
          ),
        ],
      ),
    );
  }
}



// // verificadorDeSistema() {
// //     if (!kIsWeb) {
// //       late WebViewController _controllerWeb = WebViewController()
// //         ..setJavaScriptMode(JavaScriptMode.disabled)
// //         ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
// //           const Text("carregando..");
// //         }, onPageStarted: (String url) {
// //           const Text("carregando..");
// //         }, onNavigationRequest: (NavigationRequest request) {
// //           if (request.url
// //               .startsWith('https://www.riagah.com.br/servicos-empresa.html')) {
// //             return NavigationDecision.navigate;
// //           }
// //           return NavigationDecision.prevent;
// //         }))
// //         ..loadRequest(
// //             Uri.parse('https://www.riagah.com.br/servicos-empresa.html'));
// //       return _controllerWeb;
// //     } else {
// //       Navigator.push(context,
// //           MaterialPageRoute(builder: (context) => const SobreMimWeb()));
// //     }
// //   }
