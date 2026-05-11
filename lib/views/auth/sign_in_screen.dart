import 'package:code_u/views/lessons/lessons.dart';
import 'package:code_u/views/navigation_screen/custom_nav_bar.dart';
import 'package:code_u/views/reset_password/reset_password_screen.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:code_u/widgets/reusable_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage('assets/images/welcome_background.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50), 
                
                // Image/Logo (Height matched to visual appearance in the screenshot)
                Image.asset(
                      'assets/images/welcome.png',
                  height: 120, 
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16), 
        
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your journey continues here',
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
        
                const ReusablePasswordField(
                  labelText: 'Your Password',
                  hintText: '********',
                ),
                const SizedBox(height: 8),
        
         
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen(),
                      ));
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Color(0xFF4CAF50), 
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
        
                GreenFilledButton(
                  text: 'Sign In',
                  onPressed: () {
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomNavBarScreen(),
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
                  iconPath: 'assets/images/google_icon.png', 
                  onPressed: () {
                   
                  },
                ),
                const SizedBox(height: 16),
        
                // Reusable Apple Sign In Button
                SocialSignInButton(
                  text: 'Continue with Apple',
                  iconPath: 'assets/images/apple_icon.png', // Replace with your Apple icon path
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