import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/features/Chat/presentation/pages/home_page.dart';
import 'package:scholar_chat/services/custom_validator.dart';
import 'package:scholar_chat/services/login.dart';

import '../../../../Core/themes.dart';
import '../../../../Shared/widgets/my_button.dart';
import '../../../../Shared/widgets/show_snack_bar.dart';
import '../../../../Shared/widgets/text_feild.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = 'signinRouteName';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? emailAddress;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff274460),
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                    //logo
                    Image.asset('assets/images/scholar.png'),
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                        fontSize: 26,
                      ),
                    ),

                    //title
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

                    //Email Adress
                    CustomTextFeild(
                      hintString: 'Email',
                      myIcon: Icons.email,
                      validateType: CustomValidator.loginValidateEmail,
                      onChanged: (p0) {
                        emailAddress = p0;
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    //Password
                    CustomTextFeild(
                      hintString: 'Password',
                      myIcon: Icons.key,
                      validateType: CustomValidator.loginValidatePassword,
                      onChanged: (p0) {
                        password = p0;
                      },
                      textInputType: TextInputType.number,
                      isPassword: true,
                    ),

                    const SizedBox(height: 40),
                    MyButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() => isLoading = true);

                          try {
                            final bool success = await login(
                                context: context,
                                emailAddress: emailAddress!,
                                password: password!);
                                print('Login success: $success');
                            if (success) {
                              Navigator.pushReplacementNamed(
                                  context, HomePage.routeName);
                            }
                          } catch (e) {
                            showCustomSnackBar(context, 'Error: $e');
                          }
                          setState(() => isLoading = false);
                        }
                      },
                      buttonString: 'Sign In',
                    ),
                    
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('don\'t have an account? ', style: minWhiteStyle),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                  context, SignInPage.routeName);
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
        ),
      ),
    );
  }
}
