import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import '../pages/signin_page.dart';
import '../widgets/text_feild.dart';
import '../common/themes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Sign Up',
                    style: bigWhiteStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              hintString: 'Email Address',
              myIcon: Icons.email,
            ),
            const SizedBox(height: 12),
            CustomTextFeild(
              hintString: 'Username',
              myIcon: Icons.person,
            ),
            const SizedBox(height: 12),
            CustomTextFeild(
              hintString: 'Password',
              myIcon: Icons.key,
            ),
            const SizedBox(height: 12),
            CustomTextFeild(
              hintString: 'Date Of Birth',
              myIcon: Icons.date_range,
            ),
            const SizedBox(height: 40),
            MyButton(buttonString: 'Sign Up'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('already have an account? ', style: normWhiteStyle),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
