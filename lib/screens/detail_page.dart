import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String? response;
  final String? salary;
  const DetailPage({Key? key, required this.response, required this.salary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(response!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 10,),
            Text(salary!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
