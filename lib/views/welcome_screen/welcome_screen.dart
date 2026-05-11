import 'package:code_u/views/auth/sign_in_screen.dart';
import 'package:code_u/views/auth/sign_up_screen.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemChrome

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                Image.asset('assets/images/welcome.png', fit: BoxFit.contain),
                const SizedBox(height: 50),
                GreenFilledButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
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
               
               
                const SizedBox(height: 24),

                const Text(
                  'Or',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),

                SocialSignInButton(
                  text: 'Continue with Google',
                  iconPath:
                      'assets/images/google_icon.png', // Replace with your Google icon path
                  onPressed: () {},
                ),
                const SizedBox(height: 16),

                SocialSignInButton(
                  text: 'Continue with Apple',
                  iconPath:
                      'assets/images/apple_icon.png', // Replace with your Apple icon path
                  onPressed: () {
                    // Handle Apple Sign In logic
                    print('Continue with Apple pressed');
                  },
                ),
     
                const SizedBox(height: 50), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
