import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'features/Chat/presentation/pages/home_page.dart';
import 'features/auth/Presentation/pages/signin_page.dart';
import 'features/auth/Presentation/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.grey,
      ),
      initialRoute: SignUpPage.routeName,
      routes: {
        SignUpPage.routeName: (context) => const SignUpPage(),
        SignInPage.routeName: (context) =>  SignInPage(),
        HomePage.routeName: (context) =>  HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      // initialRoute: ,
      // routes: ,
    );
  }
}
 