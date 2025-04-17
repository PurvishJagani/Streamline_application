import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/Slide.dart';
import '../utils/SharedPreferencesUtils.dart';
import '../utils/press_unpress.dart';
import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  List<Slide> slides = [
    Slide(
      title: "Plan Your Shoots",
      description: "Easily find the perfect photographer or videographer to capture your special event.",
      image: "assets/images/intro/intro_logo_1.png",
    ),
    Slide(
      title: "Plan Your Deliverables",
      description: "Customize package to get exactly what you need, from raw footage to edited highlights.",
      image: "assets/images/intro/intro_logo_2.png",
    ),
    Slide(
      title: "Manage Your Projects",
      description: "Our integrated CRM tools make it easy to communicate with your photographer, track progress, and manage your project.",
      image: "assets/images/intro/intro_logo_3.png",
    ),
  ];
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/intro/intro_bg.png"),
                      fit: BoxFit.fill,
                    )
                ),
                child: Column(

                  children: [
                    SizedBox(height: 150.h),

                    Image.asset(
                      slides[index].image,
                      height: 900.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 100.h),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < slides.length; i++)
                          i == currentIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),

                    SizedBox(height: 100.h),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          slides[index].title,
                          style: TextStyle(fontSize: 70.sp, color: Color(0xFF4E55F5),fontFamily: "bold"),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        slides[index].description,
                        style: TextStyle(fontSize: 40.sp,color:Colors.black,fontFamily: "mid"),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset("assets/images/intro/next_arrow_btn.png",
                          height: 130.h,
                        ),
                        SizedBox(width: 30.w),
                        PressUnpress(
                            height: 130.h,
                            width: 800.w,
                            child: Center(
                              child: Text("Next",
                                style: TextStyle(fontSize: 50.sp,color: Colors.white,fontFamily: "bold"),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            press: "intro/next_btn.png",
                            onTap: (){

                              if (currentIndex < slides.length - 1) {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              } else {

                                SharedPreferencesUtils.setFirstTime(false);

                                Navigator.of(context).pushReplacement(PageRouteBuilder(
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
                                ));

                              }
                            },
                            isImgFill: true),
                      ],
                    ),

                    Spacer(),

                    Text("© 2024-2025 STREAMLINE. All Rights Reserved.",
                      style: TextStyle(fontSize: 35.sp,color: Color(0xFF909190),fontFamily: 'mid'),
                    ),

                    SizedBox(height: 50.h),

                    Opacity(
                      opacity: 0.1,
                      child: Image.asset("assets/images/intro/stroke_line.png",
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),

                    SizedBox(height: 10.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      height: 10.h,
      width: isActive ? 100.w : 50.w,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF4E55F5) : Color(0xFFA7AAFA),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }


}
