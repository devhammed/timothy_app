import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(TimothyApp());
}

class TimothyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timothy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _emailUri = 'mailto:olamilekan971@gmail.com';

  void _launchEmailApp() async =>
      await canLaunch(_emailUri) && await launch(_emailUri);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/timothy.jpg'),
          ),
        ),
        child: Align(
          child: Container(
            height: 60,
            width: size.width,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  text: 'Timothy O. Akinleye\n',
                  children: [
                    TextSpan(
                      text: 'Graphics Designer',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Send an Email',
        child: Icon(Icons.email),
        onPressed: _launchEmailApp,
      ),
    );
  }
}
