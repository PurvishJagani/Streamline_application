import 'package:company_task/screens/create_account_screen.dart';
import 'package:company_task/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/auth_service.dart';
import '../utils/press_unpress.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [

              SizedBox(height: 200.h,),

              Transform.scale(
                scale: 1.07,
                child: Image.asset("assets/images/login/logo.png",
                width: MediaQuery.of(context).size.width,),
              ),

              SizedBox(height: 100.h,),

              Text("Explore the app",
                style: TextStyle(fontSize: 85.sp,color: Color(0xFF4E55F5),fontFamily: "bold"),
              ),

              SizedBox(height: 30.h,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text("Take a tour of our app and see how we can help you plan and execute your dream event.",
                  style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: "mid")
                  ,textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 100.h,),

              PressUnpress(
                  height: 140.h,
                  width: 1000.w,
                  child: Center(
                    child: Text("Sign In",
                      style: TextStyle(fontSize: 50.sp,color: Colors.white,fontFamily: "bold"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  press: "login/sign_in_btn.png",
                  onTap: (){

                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
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
                      transitionDuration: Duration(milliseconds: 600),
                    ));

                  },
                  isImgFill: true
              ),

              SizedBox(height: 30.h,),

              PressUnpress(
                  height: 140.h,
                  width: 1000.w,
                  child: Center(
                    child: Text("Create Account",
                      style: TextStyle(fontSize: 50.sp,color: Colors.black,fontFamily: "bold"),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  press: "login/create_account_btn.png",
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => CreateAccountScreen(),
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
                      transitionDuration: Duration(milliseconds: 600),
                    ));
                  },
                  isImgFill: true
              ),

              SizedBox(height: 70.h,),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 5.h,
                      color: Color(0xFFE6E9F4),
                    ),
                  ),
                  SizedBox(width: 30.w,),

                  Text("or continue with",
                    style: TextStyle(fontSize: 30.sp,color: Color(0xFF4E55F5),fontFamily: "reg"),
                  ),

                  SizedBox(width: 30.w,),

                  Expanded(
                    child: Container(
                      height: 5.h,
                      color: Color(0xFFE6E9F4),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 70.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  PressUnpress(
                      height: 150.w,
                      width: 150.w,
                      child: Container(),
                      press: "login/google.png",
                      onTap: () async {
                        User? user = await AuthService().signInWithGoogle();
                        if (user != null) {
                          Navigator.of(context).pushReplacement(PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
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
                            transitionDuration: Duration(milliseconds: 500),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Google Sign-In Failed")),
                          );
                        }
                      },
                      isImgFill: true
                  ),

                  SizedBox(width: 30.w,),

                  PressUnpress(
                      height: 150.w,
                      width: 150.w,
                      child: Container(),
                      press: "login/apple.png",
                      onTap: (){

                      },
                      isImgFill: true
                  ),

                ],
              ),

              SizedBox(height: 70.h,),

              Text("If you continue means you accept streamline",
                style: TextStyle(fontSize: 35.sp,color: Colors.black,fontFamily: "mid")
                ,textAlign: TextAlign.center,
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 35.sp, fontFamily: "mid", color: Colors.black),
                  children: [
                    TextSpan(text: "Terms of Service", style: TextStyle(color: Color(0xFF4E55F5),fontFamily: "bold")),
                    TextSpan(text: " and ", style: TextStyle(color: Colors.black)),
                    TextSpan(text: "Privacy Policy", style: TextStyle(color: Color(0xFF4E55F5),fontFamily: "bold")),
                  ],
                ),
              ),

              Spacer(),

              Opacity(
                opacity: 0.1,
                child: Image.asset("assets/images/intro/stroke_line.png",
                  width: MediaQuery.of(context).size.width,
                ),
              ),

              SizedBox(height: 10.h),


            ],
          ),
        ),
      ),
    );
  }
}
