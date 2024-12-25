import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'widgets/address_form.dart';
import 'widgets/postcode_page.dart';

void main() {
  ui_web.platformViewRegistry.registerViewFactory(
    'postcode-html',
    (int viewId) => html.IFrameElement()
      ..width = '640'
      ..height = '360'
      ..src = 'assets/web/uk_postcode.html'
      ..style.border = 'none'..style.height = '360px'..style.width = '640px' 
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Form',
      initialRoute: '/',
      routes: {
        '/': (context) => PostcodePage(),
        '/address': (context) => AddressForm(),
      },
    );
  }
}
