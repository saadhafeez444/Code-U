import 'package:code_u/views/auth/sign_up_second.dart';
import 'package:code_u/views/reset_password/reset_password_screen.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:code_u/widgets/reusable_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.png'),
            fit: BoxFit.fill,
          ),
        ),

        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 50),

                        Image.asset(
                          'assets/images/signup.png',
                          height: 90,
                          fit: BoxFit.contain,
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          textAlign: TextAlign.center,
                          'It only takes a minute to get started',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 22),

                        const ReusableTextField(
                          labelText: 'Your Name',
                          hintText: 'ex. John Jones',
                          isPassword: false,
                        ),

                        const SizedBox(height: 15),

                        const ReusableTextField(
                          labelText: 'Your Email',
                          hintText: 'ex. johnjones@gmail.com',
                          isPassword: false,
                        ),

                        const SizedBox(height: 15),

                        const ReusablePasswordField(
                          labelText: 'Your Password',
                          hintText: '********',
                        ),

                        const SizedBox(height: 8),

                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Maximum 8 Characters',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        GreenFilledButton(
                          text: 'Create an account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SignUpSecondScreen(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 15),

                        SocialSignInButton(
                          text: 'Continue with Google',
                          iconPath: 'assets/images/google_icon.png',
                          onPressed: () {},
                        ),

                        const SizedBox(height: 15),

                        SocialSignInButton(
                          text: 'Continue with Apple',
                          iconPath: 'assets/images/apple_icon.png',
                          onPressed: () {
                            print('Continue with Apple pressed');
                          },
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
