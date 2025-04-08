import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/services/custom_validator.dart';
import '../firebase_options.dart';
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
      initialRoute: SignUpPage.signupRoute,
      routes: {
        SignUpPage.signupRoute: (context) => const SignUpPage(),
        SignInPage.signinRoute: (context) => const SignInPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      // initialRoute: ,
      // routes: ,
    );
  }
}
 