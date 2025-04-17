import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/auth_service.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final User? user = FirebaseAuth.instance.currentUser;
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [

              SizedBox(height: 30.h,),

              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 35.w),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset("assets/images/login/back.png", width: 150.w,height: 150.w,),
                      ),
                    ),
                  ),

                  SizedBox(width: 30.w),

                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: (user?.photoURL != null && user!.photoURL!.isNotEmpty)
                        ? NetworkImage(user!.photoURL!)
                        : null,
                    child: (user?.photoURL == null || user!.photoURL!.isEmpty)
                        ? Icon(Icons.person, color: Colors.grey.shade700)
                        : null,
                  ),

                  SizedBox(width: 30.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${user?.displayName ?? 'User'}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontFamily: "bold",
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Studio Owner",style: TextStyle(fontSize: 35.sp,color: Colors.grey),)
                    ],
                  ),

                  Spacer(),

                  Image.asset("assets/images/setting/edit.png", width: 150.w,height: 150.w,),

                  SizedBox(width: 30.w),
                ],
              ),

              SizedBox(height: 30.h,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Personalised Settings",style: TextStyle(fontSize: 35.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/logo.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Switch Workspace",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Streamline",style: TextStyle(fontSize: 35.sp,color: Color(0xFF5056F6),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/setting/switch.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/home/setting.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Company Setting",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("All your company detaills here.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/report.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Reports",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("You can see all your reports.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/notification.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Notifications",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Set notification by yourself.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/notification.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Invitations",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("All the invitations found here.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/theme.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Theme",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Light",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    },
                                    activeColor: Colors.white,
                                    activeTrackColor: Color(0xFF4E55F5),
                                    inactiveThumbColor: Colors.black,
                                    inactiveTrackColor: Colors.black12,
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),

                            Text("Security",style: TextStyle(fontSize: 35.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/security.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Enable 2FA Authentication",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                        Text("You'll only be able to log in using Google while this is on.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),maxLines: 2,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/change_password.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Change Password",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Account Security",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),

                            Text("Support & Report",style: TextStyle(fontSize: 35.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/terms.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Terms of Services",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Streamline T&C of use",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/privacy.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Privacy Policy",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Streamline Privacy Policy",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/bug.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Bug Report",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Feel free to report a bug.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/help.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Help & Support",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Streamline will help you.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),

                            Text("Account",style: TextStyle(fontSize: 35.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/delete.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Delete Account",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("You will lost all your data.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xFFECECEC),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [

                                  Image.asset("assets/images/setting/logout.png",width: 150.w,height: 150.w,),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Logout of all devices",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                      Text("Logout of all active sessions across all devices",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            GestureDetector(
                              onTap: () async {
                                await AuthService().signOut();

                                Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
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
                                ),(route) => false,);
                              },
                              child: Container(
                                padding: EdgeInsets.all(20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Color(0xFFECECEC),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  children: [

                                    Image.asset("assets/images/setting/logout.png",width: 150.w,height: 150.w,),
                                    SizedBox(width: 30.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Logout",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                        Text("See you soon.",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                      ],
                                    ),
                                    Spacer(),
                                    Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 70.h,),

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "APP ", style: TextStyle(fontSize: 40.sp, color: Color(0xFF87888E), fontFamily: 'mid',),),
                            TextSpan(text: "V.2.16", style: TextStyle(fontSize: 40.sp, color: Color(0xFF5960F6), fontFamily: 'mid',),),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h,),

                      Image.asset("assets/images/setting/streamline_logo.png",height: 100.h,),

                      SizedBox(height: 20.h,),

                      Text("© 2024-2025 STREAMLINE. All Rights Reserved.",
                        style: TextStyle(fontSize: 35.sp,color: Color(0xFF87888E),fontFamily: 'mid'),
                      ),

                      SizedBox(height: 50.h,),

                      Opacity(
                        opacity: 0.1,
                        child: Image.asset("assets/images/intro/stroke_line.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Opacity(
                        opacity: 0.1,
                        child: Image.asset("assets/images/intro/stroke_line.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Opacity(
                        opacity: 0.1,
                        child: Image.asset("assets/images/setting/stroke_line.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
