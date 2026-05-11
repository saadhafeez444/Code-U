import 'package:code_u/views/path/path_screen.dart';
import 'package:code_u/widgets/reusable_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeSecond extends StatelessWidget {
  const WelcomeSecond({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    );
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/welcome_background.png'),
          ),

        ),
        child: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Image.asset('assets/images/welcome.png', fit: BoxFit.contain),
                  SizedBox(height: 30,),
                    GreenFilledButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PathScreen(),
                        ),
                      );
                    },
                  ),
                 
                 
            ],
          ),
        )),
      ),
    );
  }
}