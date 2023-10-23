import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:ew_app/constants/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LandingController {

  Future<bool> _sendTokenCheckRequest(String accessToken) async {
    final url = Uri.parse(apiAuthVerifyTokenUrl);
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      // TODO: create redirect to server error page
      return false;
    }
  }

  Future<void> initial(BuildContext context) async {
    // TODO: Create logic for refresh token
    final prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken') ?? '';

    var result = await _sendTokenCheckRequest(accessToken);
    if (result) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home');
    }
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}