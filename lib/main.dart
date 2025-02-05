import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch:Colors.grey,
      ),
      home: const WellcomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Sholar Chat',
      // initialRoute: ,
      // routes: ,
    );
  }
}
