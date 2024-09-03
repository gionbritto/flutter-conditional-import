import 'package:flutter/material.dart';
import 'package:webinflutterapp/platform_alerts/custom_platform.dart';
import 'package:webinflutterapp/platform_webview/custom_platform_webview.dart';
import 'package:webinflutterapp/sobre_nos_mobile.dart';

/*
Tutorial utilizado:
https://medium.com/techskool/adding-conditional-imports-in-flutter-for-cross-platform-development-5d7b6bff689c
Link to github do tutorial:
https://github.com/Ajaykamble/flutter_conditional_importing?source=post_page-----5d7b6bff689c--------------------------------
 */
void main() {
  //necessário
  WidgetsFlutterBinding.ensureInitialized();
  // WebView.platform = WebWebViewPlatform();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var webviewInstance = CustomPlatformWebview().getWebviewWidget(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: FilledButton(
                onPressed: () {
                  CustomPlatform()
                      .displayAlert(context, "This is sample alert");
                },
                child: const Text("Show Alert"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => webviewInstance));
              },
              child: const Text("WebView Mobile"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
