import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/address.dart';
import 'dart:html' as html;

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController line1Controller = TextEditingController();
  final TextEditingController line2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setupMessageListener();
  }

  void _setupMessageListener() {
    html.window.onMessage.listen((event) {
      if (event.data is String) {
        final Map<String, dynamic> addressData = jsonDecode(event.data);
        final Address address = Address.fromJson(addressData);
        _updateFields(address);
      }
    });
  }

  void _updateFields(Address address) {
    setState(() {
      line1Controller.text = address.line1;
      line2Controller.text = address.line2;
      cityController.text = address.city;
      districtController.text = address.district;
      countryController.text = address.country;
      postCodeController.text = address.postCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: line1Controller,
              decoration: InputDecoration(labelText: 'Line 1'),
            ),
            TextField(
              controller: line2Controller,
              decoration: InputDecoration(labelText: 'Line 2'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: districtController,
              decoration: InputDecoration(labelText: 'District'),
            ),
            TextField(
              controller: countryController,
              decoration: InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: postCodeController,
              decoration: InputDecoration(labelText: 'Post Code'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   line1Controller.dispose();
  //   line2Controller.dispose();
  //   cityController.dispose();
  //   districtController.dispose();
  //   countryController.dispose();
  //   postCodeController.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }
} 