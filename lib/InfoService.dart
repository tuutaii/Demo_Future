import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/Info.dart';
import 'package:http/http.dart' as http;

class InfoService {
  final String _url = "https://agrichapp.herokuapp.com/members";

    Future<List<Info>> fetchInfo() async {
    final response = await http.get(Uri.parse(_url));
    

    if(response.statusCode == 200)
    {
  
      List jsonRespone = json.decode(response.body);

      List<Info> _info = jsonRespone.map((json) => Info.fromJson(json)).toList();
   
      return _info;
    }
    else{
      throw Exception('Faild to load');
    }
  }
}


