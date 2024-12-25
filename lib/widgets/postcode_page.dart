import 'package:flutter/material.dart';
import 'dart:html' as html;
// import 'dart:ui_web' as ui_web;

class PostcodePage extends StatefulWidget {
  @override
  _PostcodePageState createState() => _PostcodePageState();
}

class _PostcodePageState extends State<PostcodePage> {
  bool isAddressSelected = false;

  @override
  void initState() {
    super.initState();
    _setupMessageListener();
  }

  void _setupMessageListener() {
    html.window.onMessage.listen((event) {
      if (event.data is String) {
        // Assuming the address is selected when a message is received
        setState(() {
          isAddressSelected = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Postcode'),
      ),
      body: Column(
        children: [
          Expanded(
            child: HtmlElementView(
              viewType: 'postcode-html',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: isAddressSelected ? () {
                // Handle continue action
                Navigator.pushNamed(context, '/address'); // Ensure this route is correct
              } : null,
              child: Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
} 