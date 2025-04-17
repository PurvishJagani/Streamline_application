import 'package:company_task/screens/create_account_screen.dart';
import 'package:company_task/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/auth_service.dart';
import '../utils/press_unpress.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  bool _obscurePassword = true;

  bool get _isFormValid => _email.isNotEmpty && _password.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 50.h,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.only(left: 35.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/images/login/back.png",
                    width: 150.w,height: 150.w,),
                ),
              ),
            ),

            SizedBox(height: 150.h,),

            Text("Hi, Welcome",
              style: TextStyle(fontSize: 85.sp,color: Color(0xFF4E55F5),fontFamily: "bold"),
            ),

            SizedBox(height: 30.h,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text("Log in to your account to start planning your next shoot.",
                style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: "mid")
                ,textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 100.h,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: TextField(
                style: TextStyle(fontSize: 40.sp),
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.w),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.w),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),

            SizedBox(height: 30.h,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: TextField(
                obscureText: _obscurePassword,
                style: TextStyle(fontSize: 40.sp),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.w),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.w),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      color: Colors.black,
                      size: 60.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    checkboxTheme: CheckboxThemeData(
                      shape: CircleBorder(),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Checkbox(
                    value: _rememberMe,
                    activeColor: Color(0xFF4E55F5),
                    onChanged: (val) {
                      setState(() {
                        _rememberMe = val ?? false;
                      });
                    },
                  ),
                ),
                Text("Remember me", style: TextStyle(fontSize: 35.sp, fontFamily: "mid")),
                Spacer(),
                Text("Forgot password?", style: TextStyle(fontSize: 35.sp,color: Color(0xFF4E55F5) ,fontFamily: "bold")),
                SizedBox(width: 30.w,)
              ],
            ),

            SizedBox(height: 50.h,),

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
                press: _isFormValid ?"login/sign_in_btn.png":"login/sign_in_off_btn.png",
                onTap: () async {
                  final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

                  if (!_isFormValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter both email and password")),
                    );
                    return;
                  }

                  if (!emailRegex.hasMatch(_email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a valid email address")),
                    );
                    return;
                  }

                  User? user = await AuthService().signInWithEmail(_email, _password,context);

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
                  }

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(fontSize: 35.sp, fontFamily: "mid", color: Colors.black)),
                GestureDetector(
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
                    child: Text("Sign Up", style: TextStyle(fontSize: 35.sp,color: Color(0xFF4E55F5),fontFamily: "bold"))
                ),
              ],
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
    );
  }
}
