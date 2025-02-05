import 'package:flutter/material.dart';
import 'package:scholar_chat/common/themes.dart';
import 'package:scholar_chat/pages/signup_page.dart';
import 'package:scholar_chat/widgets/my_button.dart';
import 'package:scholar_chat/widgets/text_feild.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff274460),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Image.asset('assets/images/scholar.png'),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Sign In',
                    style: bigWhiteStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              hintString: 'Email',
              myIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomTextFeild(
              hintString: 'Password',
              myIcon: Icons.key,
            ),
            const SizedBox(height: 40),
            MyButton(buttonString: 'Sign In'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don\'t have an account? ', style: normWhiteStyle),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
