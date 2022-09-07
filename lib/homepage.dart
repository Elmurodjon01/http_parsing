import 'package:flutter/material.dart';
import 'package:http_parsing/model/emplist.dart';
import 'package:http_parsing/services/http_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _apiEmpList() {
    Net.GET(Net.Api_get, Net.paramsEmpty()).then((response) => {
          print(response),
          if (response != null) {_showresponse(response)} else {null}
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _showresponse(String response) {
    Emplist emplist = Net.parseEmplist(response);
    print(emplist.data.length);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http parsing'),
      ),
      body: Center(child: Text('http parsing')),
    );
  }
}
