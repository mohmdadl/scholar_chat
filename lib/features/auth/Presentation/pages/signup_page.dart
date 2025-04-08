import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/services/custom_validator.dart';
import '../../../../Core/themes.dart';
import '../../../../Shared/widgets/my_button.dart';
import '../../../../Shared/widgets/show_snack_bar.dart';
import '../../../../Shared/widgets/text_feild.dart';
import 'package:scholar_chat/services/regeister.dart';
import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  static const String signupRoute = 'signupRouteName';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? emailAddress;
  String? password;
  String? userName;

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                    //LOGO
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: pacificoStyle,
                    ),
                    const SizedBox(height: 40),

                    //title
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

                    //User Name
                    CustomTextFeild(
                      hintString: 'Username',
                      myIcon: Icons.person,
                      validateType: CustomValidator.validateName,
                      onChanged: (p0) {
                        userName = p0;
                      },
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 12),

                    //Email Adress
                    CustomTextFeild(
                      hintString: 'Email Address',
                      myIcon: Icons.email,
                      validateType: CustomValidator.validateEmaile,
                      onChanged: (p0) {
                        emailAddress = p0;
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),

                    //Password
                    CustomTextFeild(
                      hintString: 'Password',
                      myIcon: Icons.key,
                      validateType: CustomValidator.validatePassword,
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
                            final success = await signUp(
                              context: context,
                              emailAddress: emailAddress!,
                              password: password!,
                            );
                            if (success) {
                              Navigator.pushReplacementNamed(
                                  context, '/signin');
                            }
                          } catch (e) {
                            showCustomSnackBar(context, 'Error: $e');
                          } 
                          setState(() => isLoading = false);
                        }
                      },
                      buttonString: 'Sign Up',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('already have an account? ', style: minWhiteStyle),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignInPage.signinRoute);
                          },
                          child: const Text('Sign In'),
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
