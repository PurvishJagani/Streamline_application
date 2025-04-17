import 'package:company_task/screens/intro_screen.dart';
import 'package:company_task/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/SharedPreferencesUtils.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      check();
    });
    super.initState();
  }

  Future<void> check() async {
    final isFirstTime = await SharedPreferencesUtils.getFirstTime();
    final user = FirebaseAuth.instance.currentUser;

    print("===> check : $isFirstTime, user : $user");

    if (isFirstTime) {
      // First time: show IntroScreen
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => IntroScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 800),
      ));
    } else {
      // Not first time: check auth state
      Widget targetScreen = (user != null) ? HomeScreen() : LoginScreen();

      Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 800),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF5056F6),
        body: SafeArea(
          child: Stack(
            children: [

              Positioned(
                left: 30.w,
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset("assets/images/splash/stroke_line.png",
                        height: MediaQuery.of(context).size.height),
                  ),
              ),

              Positioned(
                left: 0,right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset("assets/images/splash/logo.png",height: 1700.h,fit: BoxFit.fitHeight,),
                    Text("© 2024-2025 STREAMLINE. All Rights Reserved.",
                      style: TextStyle(fontSize: 35.sp,color: Color(0xFF969AF5),fontFamily: 'mid'),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
