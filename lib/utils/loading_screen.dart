import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


@protected
final scaffoldGlobalKey = GlobalKey<ScaffoldState>();

class LoadingScreen {
  final GlobalKey globalKey;

  LoadingScreen(this.globalKey);

  show([String? text]) {
    showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) => Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
        body: Container(
          decoration: BoxDecoration(
             //borderRadius: BorderRadius.circular(15.w),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: Colors.white,
                border: Border.all(color: Color(0xFF4E55F5), width: 5.w),
              ),
              padding: EdgeInsets.all(40.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoActivityIndicator(
                    color: Color(0xFF4E55F5),
                    radius: 20.0,
                    animating: true,
                  ),
                 //CircularProgressIndicator(),
                  SizedBox(height: 30.h,),
                  Text("Please wait...",
                    style: TextStyle(
                      color: Color(0xFF4E55F5),
                      fontSize: 50.sp,
                      fontFamily: "mid"
                    ),
                  ).marginSymmetric(horizontal: 50.w, vertical: 5.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  hide() {
    if (Get.context == null) return;

    Navigator.pop(Get.context!);
  }
}

@protected
var loadingScreen = LoadingScreen(scaffoldGlobalKey);
