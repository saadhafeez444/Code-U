import 'package:code_u/views/auth/sign_up_screen.dart';
import 'package:code_u/views/reset_password/verify_identity_screen.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:code_u/widgets/reusable_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),

              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                     'assets/images/reset_password.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                
                ],
              ),

              const SizedBox(height: 16),

              const Text(
                'Reset your password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'ll help you get back in',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),

              const ReusableTextField(
                labelText: 'Your Email',
                hintText: 'ex. johnjones@gmail.com',
                isPassword: false,
              ),
              const SizedBox(height: 20),

              // const Spacer(flex: 2),
              GreenFilledButton(
                text: 'Send',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyIdentityScreen(),
                    ),
                  );
                },
              ),

              const Spacer(flex: 2),

              const Text(
                'Do you have an account ?',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              SignUpButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
