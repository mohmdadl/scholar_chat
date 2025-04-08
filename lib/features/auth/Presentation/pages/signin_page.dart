import 'package:flutter/material.dart';

import '../../../../Core/themes.dart';
import '../../../../Shared/widgets/my_button.dart';
import '../../../../Shared/widgets/text_feild.dart';


class SignInPage extends StatelessWidget {
  static const String signinRoute = 'signinRouteName';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff274460),
        body: SingleChildScrollView(
          child: InkWell(
            onTap: (){FocusScope.of(context).unfocus();},
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                  textInputType: TextInputType.emailAddress,
                  validateType: 'email',
                ),
                const SizedBox(height: 20),
                CustomTextFeild(
                  isPassword: true,
                  onChanged: (p0) {
                    
                  },
                  validateType: 'password',
                  hintString: 'Password',
                  myIcon: Icons.key,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 40),
                MyButton(buttonString: 'Sign In'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don\'t have an account? ', style: minWhiteStyle),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
