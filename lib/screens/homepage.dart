import 'package:flutter/material.dart';
import 'package:http_parsing/model/empOne.dart';
import 'package:http_parsing/model/emplist.dart';
import 'package:http_parsing/screens/detail_page.dart';
import 'package:http_parsing/services/http_service.dart';

import '../model/employee.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static String id = 'MyHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> items = [];
  void _apiGetList (){
    Net.GET(Net.Api_get, Net.paramsEmpty()).then((response) => {
      print(response),
     _showResponse(response!),
    });
  }

  void _apiGetOne (){
    Net.GET(Net.Api_getSingle, Net.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _apiGetList();
  }


  void _showResponse (String response){
    if(response != null){
      EmpList empList = Net.parseEmpList(response);
      setState(() {
        items = empList.data;
      });
    } else{
      print('Too many requests, try again');
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: Center(child: ListView.builder(
        itemCount: items.length,
          itemBuilder: (ctx, index){
          return ItemOfList(items[index]);
          }),),
    );
  }
  Widget ItemOfList(Employee item){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return DetailPage(response: '${item.employee_name} (${item.employee_age.toString()})', salary: '${item.employee_salary}\$',);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item.employee_name} (${item.employee_age.toString()})', style: const TextStyle(fontSize: 20, color: Colors.black),),
            const SizedBox(height: 18,),
            Text('${item.employee_salary}\$', style: const TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
