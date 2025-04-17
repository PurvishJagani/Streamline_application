import 'package:company_task/screens/settings_screen.dart';
import 'package:company_task/utils/auth_service.dart';
import 'package:company_task/utils/press_unpress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final User? user = FirebaseAuth.instance.currentUser;
  bool isHome = true;
  bool isCRM = false;
  bool isProjects = false;
  bool isShoots = false;
  bool isTasks = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [

              SizedBox(height: 30.h,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Hello, ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.sp,
                                fontFamily: "bold",
                              ),
                            ),
                            TextSpan(
                              text: "${user?.displayName ?? 'User'}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.sp,
                                fontFamily: "bold",
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Studio Owner",style: TextStyle(fontSize: 35.sp,color: Colors.grey),)
                    ],
                  ),

                  Spacer(),

                  Visibility(
                    visible: isHome,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsScreen()));
                        },
                        child: Image.asset("assets/images/home/setting.png",width: 150.w,height: 150.w,)
                    ),
                  ),

                  Visibility(
                    visible: isCRM,
                    child: GestureDetector(
                        onTap: (){

                        },
                        child: Image.asset("assets/images/home/notification.png",width: 150.w,height: 150.w,)
                    ),
                  ),

                  Visibility(
                    visible: isProjects,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: (){

                            },
                            child: Image.asset("assets/images/home/notification.png",width: 150.w,height: 150.w,)
                        ),
                        SizedBox(width: 20.w,),
                        GestureDetector(
                            onTap: (){

                            },
                            child: Image.asset("assets/images/home/gallery.png",width: 150.w,height: 150.w,)
                        ),
                      ],
                    ),
                  ),

                  Visibility(
                    visible: isShoots,
                    child: GestureDetector(
                        onTap: (){

                        },
                        child: Image.asset("assets/images/home/calendar.png",width: 150.w,height: 150.w,)
                    ),
                  ),

                  Visibility(
                    visible: isTasks,
                    child: GestureDetector(
                        onTap: (){

                        },
                        child: Image.asset("assets/images/home/more.png",width: 150.w,height: 150.w,)
                    ),
                  ),

                  SizedBox(width: 40.w),

                ],
              ),

              SizedBox(height: 30.h,),

              Expanded(
                child: isHome
                    ? Column(
                  children: [
                
                    Container(
                      width: 1000.w,
                      height: 350.h,
                      padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 40.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home/current_balance_bg.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                
                          Text("Current Balance",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: 'mid'),),
                          Row(
                            children: [
                
                              Image.asset("assets/images/home/wallet.png",width: 150.w,height: 150.w,),
                              SizedBox(width: 50.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("₹89,099",style: TextStyle(fontSize: 70.sp,color: Colors.white,fontFamily: 'bold'),),
                                  Text("Total Receivables",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontFamily: 'mid'),),
                                ],
                              ),
                
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/home/bill_check.png",width: 40.w,height: 40.w,),
                              Text("Last Payment on October 26,2004",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontFamily: 'reg'),),
                            ],
                          ),
                
                        ],
                      ),
                    ),
                
                    SizedBox(height: 20.h,),
                
                    Container(
                      width: 1000.w,
                      height: 180.h,
                      padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 30.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home/total_payable_bg.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                
                          Text("₹23,12,099",style: TextStyle(fontSize: 70.sp,color: Color(0xFF4D54F3),fontFamily: 'bold'),),
                          Text("Total Payables",style: TextStyle(fontSize: 30.sp,color: Color(0xFF4D54F3),fontFamily: 'bold'),),
                
                        ],
                      ),
                    ),
                
                    SizedBox(height: 50.h,),
                
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("New \nLeads",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("12",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 10.w),
                                          child: Image.asset("assets/images/home/arrow_right_up.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("Shoots this \nMonth",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("05",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 10.w),
                                          child: Image.asset("assets/images/home/arrow_right_up.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("All \nDeliverables",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("02",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 10.w),
                                          child: Image.asset("assets/images/home/arrow_right_up.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("Pending \nTasks",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("43",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 15.w),
                                          child: Image.asset("assets/images/home/add.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                
                        ],
                      ),
                    ),
                
                    SizedBox(height: 10.h,),
                
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("All \nProducts",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("04",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 15.w),
                                          child: Image.asset("assets/images/home/archive.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("All \nProposal",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("05",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 15.w),
                                          child: Image.asset("assets/images/home/document_add.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("All Team\nMembers",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("12",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 15.w),
                                          child: Image.asset("assets/images/home/user_group.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 230.w,
                            height: 230.w,
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                
                                  Text("All \nPayments",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("34",style: TextStyle(fontSize: 70.sp,color: Colors.black,fontFamily: 'bold'),),
                                      SizedBox(width: 10.w,),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 15.w),
                                          child: Image.asset("assets/images/home/money_bag.png",width: 50.w,height: 50.w,)
                                      ),
                                    ],
                                  ),
                
                                ],
                              ),
                            ),
                          ),
                
                        ],
                      ),
                    ),
                
                  ],
                )
                    : isCRM
                      ? Column(
                        children: [

                          Container(
                            padding: EdgeInsets.all(20.w),
                            margin: EdgeInsets.all(30.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Color(0xFFECECEC),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [

                                Container(
                                  margin: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("New Leads",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'mid'),),
                                      Text("5 Lead",style: TextStyle(fontSize: 35.sp,color: Colors.black,fontFamily: 'mid'),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Image.asset("assets/images/home/add_btn.png",width: 150.w,height: 150.w,)

                              ],
                            ),
                          ),

                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildCard([
                                  {"name": "Alice Smith", "email": "alice123@gmail.com", "time": "9 Nov, 2024 at 10:00 AM"},
                                  {"name": "John Doe", "email": "john.doe@gmail.com", "time": "9 Nov, 2024 at 10:30 AM"},
                                  {"name": "Emily Clark", "email": "emilyc@gmail.com", "time": "9 Nov, 2024 at 11:00 AM"},
                                  {"name": "David Lee", "email": "dlee87@gmail.com", "time": "9 Nov, 2024 at 11:30 AM"},
                                  {"name": "Sophia Rose", "email": "sophia.rose@gmail.com", "time": "9 Nov, 2024 at 12:00 PM"},
                                  {"name": "Mike Jordan", "email": "mjordan@gmail.com", "time": "9 Nov, 2024 at 12:30 PM"},
                                  {"name": "Nina Patel", "email": "ninap@gmail.com", "time": "9 Nov, 2024 at 1:00 PM"},
                                  {"name": "Oscar Wild", "email": "oswild@gmail.com", "time": "9 Nov, 2024 at 1:30 PM"},
                                  {"name": "Rachel Green", "email": "rachel.g@gmail.com", "time": "9 Nov, 2024 at 2:00 PM"},
                                  {"name": "Steve King", "email": "sking@gmail.com", "time": "9 Nov, 2024 at 2:30 PM"},
                                ]),
                                _buildCard([
                                  {"name": "Tina Ray", "email": "tinar@gmail.com", "time": "8 Nov, 2024 at 10:00 AM"},
                                  {"name": "George Kim", "email": "george.kim@gmail.com", "time": "8 Nov, 2024 at 10:30 AM"},
                                  {"name": "Linda Yu", "email": "lyu@gmail.com", "time": "8 Nov, 2024 at 11:00 AM"},
                                  {"name": "Brian Cox", "email": "bcox@gmail.com", "time": "8 Nov, 2024 at 11:30 AM"},
                                  {"name": "Mona Lisa", "email": "monalisa@gmail.com", "time": "8 Nov, 2024 at 12:00 PM"},
                                  {"name": "Victor Hugo", "email": "vhugo@gmail.com", "time": "8 Nov, 2024 at 12:30 PM"},
                                  {"name": "Angela White", "email": "awhite@gmail.com", "time": "8 Nov, 2024 at 1:00 PM"},
                                  {"name": "Karl Marx", "email": "kmarx@gmail.com", "time": "8 Nov, 2024 at 1:30 PM"},
                                  {"name": "Sandy Bell", "email": "sandyb@gmail.com", "time": "8 Nov, 2024 at 2:00 PM"},
                                  {"name": "Wendy Wu", "email": "wendywu@gmail.com", "time": "8 Nov, 2024 at 2:30 PM"},
                                ]),
                                _buildCard([
                                  {"name": "Leonardo D", "email": "leo.d@gmail.com", "time": "7 Nov, 2024 at 10:00 AM"},
                                  {"name": "Rita Ora", "email": "rita.ora@gmail.com", "time": "7 Nov, 2024 at 10:30 AM"},
                                  {"name": "Tom Hardy", "email": "tom.h@gmail.com", "time": "7 Nov, 2024 at 11:00 AM"},
                                  {"name": "Uma Thurman", "email": "uma.t@gmail.com", "time": "7 Nov, 2024 at 11:30 AM"},
                                  {"name": "Xander Cage", "email": "xander@gmail.com", "time": "7 Nov, 2024 at 12:00 PM"},
                                  {"name": "Yara Shahidi", "email": "yara.s@gmail.com", "time": "7 Nov, 2024 at 12:30 PM"},
                                  {"name": "Zack Efron", "email": "zacke@gmail.com", "time": "7 Nov, 2024 at 1:00 PM"},
                                  {"name": "Clark Kent", "email": "clark.k@gmail.com", "time": "7 Nov, 2024 at 1:30 PM"},
                                  {"name": "Bruce Wayne", "email": "batman@gmail.com", "time": "7 Nov, 2024 at 2:00 PM"},
                                  {"name": "Diana Prince", "email": "wonder@gmail.com", "time": "7 Nov, 2024 at 2:30 PM"},
                                ]),
                              ],
                            ),
                          ),

                        ],
                        )
                      : isProjects
                        ? Column(
                        children: [

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.w),
                            child: TextField(
                              style: TextStyle(fontSize: 40.sp),
                              onChanged: (value) {

                              },
                              decoration: InputDecoration(
                                hintText: "Search client or proposal",
                                hintStyle: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: "mid"),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                                suffixIcon: Icon(
                                    Icons.search_rounded,
                                    color: Colors.black,
                                    size: 60.sp,
                                  ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [

                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xFF4E55F5),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("All \nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("05",style: TextStyle(fontSize: 70.sp,color: Colors.white,fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10.w),
                                                  child: Image.asset("assets/images/home/arrow_right_down.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Active\nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("43",style: TextStyle(fontSize: 70.sp,color: Color(0xFF81BB7C),fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10.w),
                                                  child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Starred \nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("02",style: TextStyle(fontSize: 70.sp,color: Color(0xFFF8886B),fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10.w),
                                                  child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Work \nOverdue",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("12",style: TextStyle(fontSize: 70.sp,color: Color(0xFF6DB4E7),fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 15.w),
                                                  child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Pending \nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("03",style: TextStyle(fontSize: 70.sp,color: Color(0xFFE0B7F4),fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 15.w),
                                                  child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  Container(
                                    width: 230.w,
                                    height: 230.w,
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Completed \nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("33",style: TextStyle(fontSize: 70.sp,color: Color(0xFF64CDE6),fontFamily: 'bold'),),
                                              SizedBox(width: 10.w,),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 15.w),
                                                  child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Expanded(
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                
                                        Text("October",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                        SizedBox(height: 10.h,),
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
                                
                                              Image.asset("assets/images/home/party.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Abhishek & Vaishnavi",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Oct, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/wedding.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Brooke Party",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Oct, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.h,),
                                        Text("September",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                        SizedBox(height: 10.h,),
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
                                
                                              Image.asset("assets/images/home/birthday.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Rajive Singh Mehndi",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Sep, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/wedding.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Rachel Wedding",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Sep, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/wedding.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Shaachal Wedding",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Sep, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/party.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("David Lee's Party",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("9 Oct, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        Text("August",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                        SizedBox(height: 10.h,),
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
                                
                                              Image.asset("assets/images/home/birthday.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Abhishek Birthday Party",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("19 Aug, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/party.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Tom Hardy's Party",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("19 Aug, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
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
                                
                                              Image.asset("assets/images/home/wedding.png",width: 150.w,height: 150.w,),
                                              SizedBox(width: 30.w,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Clark's Wedding",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                  Text("19 Aug, 2024",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                ],
                                              ),
                                              Spacer(),
                                              Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)
                                
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 30.w,bottom: 0,
                                    child: PressUnpress(
                                        height: 150.h,
                                        width: 400.w,
                                        child: Center(
                                            child: Container(
                                                padding: EdgeInsets.only(bottom: 25.w,left: 50.w),
                                                child: Text("Project",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                            )
                                        ),
                                        press: "home/add_bg.png",
                                        onTap: (){},
                                        isImgFill: true
                                    ),
                                ),
                              ],
                            ),
                          )

                        ],
                      )
                        : isShoots
                          ? Column(
                            children: [

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.w),
                                child: TextField(
                                  style: TextStyle(fontSize: 40.sp),
                                  onChanged: (value) {

                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search client or proposal",
                                    hintStyle: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: "mid"),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                                    suffixIcon: Icon(
                                      Icons.search_rounded,
                                      color: Colors.black,
                                      size: 60.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Container(
                                      width: 230.w,
                                      height: 230.w,
                                      padding: EdgeInsets.all(15.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xFF4E55F5),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("All \nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontFamily: 'mid'),),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text("03",style: TextStyle(fontSize: 70.sp,color: Colors.white,fontFamily: 'bold'),),
                                                SizedBox(width: 10.w,),
                                                Padding(
                                                    padding: EdgeInsets.only(bottom: 10.w),
                                                    child: Image.asset("assets/images/home/arrow_right_up_white.png",width: 50.w,height: 50.w,)
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Container(
                                      width: 230.w,
                                      height: 230.w,
                                      padding: EdgeInsets.all(15.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Today\nShoots",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFF81BB7C),fontFamily: 'bold'),),
                                                SizedBox(width: 10.w,),
                                                Padding(
                                                    padding: EdgeInsets.only(bottom: 10.w),
                                                    child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Container(
                                      width: 230.w,
                                      height: 230.w,
                                      padding: EdgeInsets.all(15.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Shoots \nWeeks",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFFF8886B),fontFamily: 'bold'),),
                                                SizedBox(width: 10.w,),
                                                Padding(
                                                    padding: EdgeInsets.only(bottom: 10.w),
                                                    child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Container(
                                      width: 230.w,
                                      height: 230.w,
                                      padding: EdgeInsets.all(15.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Shoots \nThis month",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFF6DB4E7),fontFamily: 'bold'),),
                                                SizedBox(width: 10.w,),
                                                Padding(
                                                    padding: EdgeInsets.only(bottom: 15.w),
                                                    child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Expanded(
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

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

                                                  Image.asset("assets/images/home/party_shoots.png",width: 150.w,height: 150.w,),
                                                  SizedBox(width: 30.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Hushal Engagement Function",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(text: "Ring Ceremony: ", style: TextStyle(fontSize: 30.sp, color: Colors.black, fontFamily: 'mid',),),
                                                            TextSpan(text: "Evening", style: TextStyle(fontSize: 30.sp, color: Color(0xFFFAAD14), fontFamily: 'mid',),),
                                                          ],
                                                        ),
                                                      ),
                                                      Text("Update: 9 Nov, 2024 at 2:30 pm",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15.h,),
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

                                                  Image.asset("assets/images/home/wedding_shoots.png",width: 150.w,height: 150.w,),
                                                  SizedBox(width: 30.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Viral & Sikha",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(text: "Mehndi: ", style: TextStyle(fontSize: 30.sp, color: Colors.black, fontFamily: 'mid',),),
                                                            TextSpan(text: "Morning", style: TextStyle(fontSize: 30.sp, color: Color(0xFFFAAD14), fontFamily: 'mid',),),
                                                          ],
                                                        ),
                                                      ),
                                                      Text("Update: 9 Nov, 2024 at 2:30 pm",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15.h,),
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

                                                  Image.asset("assets/images/home/birthday_shoots.png",width: 150.w,height: 150.w,),
                                                  SizedBox(width: 30.w,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Shaachal & Priyash",style: TextStyle(fontSize: 45.sp,color: Colors.black,fontFamily: 'bold'),),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(text: "Party: ", style: TextStyle(fontSize: 30.sp, color: Colors.black, fontFamily: 'mid',),),
                                                            TextSpan(text: "Night", style: TextStyle(fontSize: 30.sp, color: Color(0xFFFAAD14), fontFamily: 'mid',),),
                                                          ],
                                                        ),
                                                      ),
                                                      Text("Update: 9 Nov, 2024 at 11:30 pm",style: TextStyle(fontSize: 30.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Image.asset("assets/images/home/right_arrow.png",width: 100.w,height: 100.w,)

                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      right: 30.w,bottom: 0,
                                      child: PressUnpress(
                                          height: 150.h,
                                          width: 400.w,
                                          child: Center(
                                              child: Container(
                                                  padding: EdgeInsets.only(bottom: 25.w,left: 50.w),
                                                  child: Text("Shoot",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                              )
                                          ),
                                          press: "home/add_bg.png",
                                          onTap: (){},
                                          isImgFill: true
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          )
                          : Column(
                            children: [

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.w),
                                child: TextField(
                                  style: TextStyle(fontSize: 40.sp),
                                  onChanged: (value) {

                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search Tasks",
                                    hintStyle: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: "mid"),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFE6E9F4), width: 2.w),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                                    suffixIcon: Icon(
                                      Icons.search_rounded,
                                      color: Colors.black,
                                      size: 60.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [

                                      Container(
                                        width: 230.w,
                                        height: 230.w,
                                        padding: EdgeInsets.all(15.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Color(0xFF4E55F5),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("All \nTasks",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontFamily: 'mid'),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("00",style: TextStyle(fontSize: 70.sp,color: Colors.white,fontFamily: 'bold'),),
                                                  SizedBox(width: 10.w,),
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 10.w),
                                                      child: Image.asset("assets/images/home/arrow_right_down.png",width: 50.w,height: 50.w,)
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Container(
                                        width: 230.w,
                                        height: 230.w,
                                        padding: EdgeInsets.all(15.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("Pending\nTasks",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFF81BB7C),fontFamily: 'bold'),),
                                                  SizedBox(width: 10.w,),
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 10.w),
                                                      child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Container(
                                        width: 230.w,
                                        height: 230.w,
                                        padding: EdgeInsets.all(15.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("In\nProgress",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFFF8886B),fontFamily: 'bold'),),
                                                  SizedBox(width: 10.w,),
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 10.w),
                                                      child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Container(
                                        width: 230.w,
                                        height: 230.w,
                                        padding: EdgeInsets.all(15.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("In \nReview",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFF6DB4E7),fontFamily: 'bold'),),
                                                  SizedBox(width: 10.w,),
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 15.w),
                                                      child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Container(
                                        width: 230.w,
                                        height: 230.w,
                                        padding: EdgeInsets.all(15.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("Completed \nTasks",style: TextStyle(fontSize: 30.sp,color: Colors.black,fontFamily: 'mid'),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("00",style: TextStyle(fontSize: 70.sp,color: Color(0xFF64CDE6),fontFamily: 'bold'),),
                                                  SizedBox(width: 10.w,),
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 15.w),
                                                      child: Image.asset("assets/images/home/arrow_right_up_blue.png",width: 50.w,height: 50.w,)
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Expanded(
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("October",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              padding: EdgeInsets.all(30.w),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Medium",style: TextStyle(fontSize: 50.sp,color: Color(0xFFFAAD14),fontFamily: 'bold'),),
                                                          Text("Due Date: 9 Oct, 2024",style: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Image.asset("assets/images/home/more.png",width: 150.w,height: 150.w,),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.w,),
                                                  Text("Task Name",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Assign To",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 100.h,
                                                        width: 600.w,
                                                        child: Stack(
                                                          children: List.generate(4, (index) {
                                                            return Positioned(
                                                              left: index * 60.w, // use .w for screen adaptation
                                                              child: CircleAvatar(
                                                                radius: 50.w,
                                                                backgroundImage: AssetImage("assets/images/home/user${index + 1}.png"),
                                                              ),
                                                            );
                                                          })
                                                            ..add(
                                                              Positioned(
                                                                left: 4 * 60.w,
                                                                child: CircleAvatar(
                                                                  radius: 50.w,
                                                                  backgroundColor: Color(0xFF5F5BFF),
                                                                  child: Text(
                                                                    "02+",
                                                                    style: TextStyle(
                                                                      fontSize: 30.sp,
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      PressUnpress(
                                                          height: 100.h,
                                                          width: 300.w,
                                                          child: Container(
                                                              padding: EdgeInsets.only(top: 25.w,left: 50.w),
                                                              child: Text("To Do",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                                          ),
                                                          press: "home/to_do.png",
                                                          onTap: (){},
                                                          isImgFill: true
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Text("September",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              padding: EdgeInsets.all(30.w),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("High",style: TextStyle(fontSize: 50.sp,color: Color(0xFFFF4D4F),fontFamily: 'bold'),),
                                                          Text("Due Date: 9 Sep, 2024",style: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Image.asset("assets/images/home/more.png",width: 150.w,height: 150.w,),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.w,),
                                                  Text("Task Name",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Assign To",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 100.h,
                                                        width: 600.w,
                                                        child: Stack(
                                                          children: List.generate(4, (index) {
                                                            return Positioned(
                                                              left: index * 60.w, // use .w for screen adaptation
                                                              child: CircleAvatar(
                                                                radius: 50.w,
                                                                backgroundImage: AssetImage("assets/images/home/user${index + 1}.png"),
                                                              ),
                                                            );
                                                          })
                                                            ..add(
                                                              Positioned(
                                                                left: 4 * 60.w,
                                                                child: CircleAvatar(
                                                                  radius: 50.w,
                                                                  backgroundColor: Color(0xFF5F5BFF),
                                                                  child: Text(
                                                                    "02+",
                                                                    style: TextStyle(
                                                                      fontSize: 30.sp,
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      PressUnpress(
                                                          height: 100.h,
                                                          width: 300.w,
                                                          child: Container(
                                                              padding: EdgeInsets.only(top: 25.w,left: 50.w),
                                                              child: Text("To Do",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                                          ),
                                                          press: "home/to_do.png",
                                                          onTap: (){},
                                                          isImgFill: true
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Text("August",style: TextStyle(fontSize: 40.sp,fontFamily: 'mid',color: Color(0xFF87888E)),),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              padding: EdgeInsets.all(30.w),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Low",style: TextStyle(fontSize: 50.sp,color: Color(0xFF38CB82),fontFamily: 'bold'),),
                                                          Text("Due Date: 9 Aug, 2024",style: TextStyle(fontSize: 40.sp,color: Color(0xFF87888E),fontFamily: 'mid'),),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Image.asset("assets/images/home/more.png",width: 150.w,height: 150.w,),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.w,),
                                                  Text("Task Name",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Text("Assign To",style: TextStyle(fontSize: 40.sp,color: Colors.black,fontFamily: 'mid'),),
                                                  SizedBox(height: 30.w,),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 100.h,
                                                        width: 600.w,
                                                        child: Stack(
                                                          children: List.generate(4, (index) {
                                                            return Positioned(
                                                              left: index * 60.w, // use .w for screen adaptation
                                                              child: CircleAvatar(
                                                                radius: 50.w,
                                                                backgroundImage: AssetImage("assets/images/home/user${index + 1}.png"),
                                                              ),
                                                            );
                                                          })
                                                            ..add(
                                                              Positioned(
                                                                left: 4 * 60.w,
                                                                child: CircleAvatar(
                                                                  radius: 50.w,
                                                                  backgroundColor: Color(0xFF5F5BFF),
                                                                  child: Text(
                                                                    "02+",
                                                                    style: TextStyle(
                                                                      fontSize: 30.sp,
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      PressUnpress(
                                                          height: 100.h,
                                                          width: 300.w,
                                                          child: Container(
                                                              padding: EdgeInsets.only(top: 25.w,left: 50.w),
                                                              child: Text("To Do",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                                          ),
                                                          press: "home/to_do.png",
                                                          onTap: (){},
                                                          isImgFill: true
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 160.h,),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      right: 30.w,bottom: 0,
                                      child: PressUnpress(
                                          height: 150.h,
                                          width: 400.w,
                                          child: Center(
                                              child: Container(
                                                  padding: EdgeInsets.only(bottom: 25.w,left: 50.w),
                                                  child: Text("Task",style: TextStyle(fontSize: 45.sp,color: Colors.white,fontFamily: 'bold'),)
                                              )
                                          ),
                                          press: "home/add_bg.png",
                                          onTap: (){},
                                          isImgFill: true
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          )
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical:20.w),
                margin: EdgeInsets.all(30.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xFFECECEC),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isHome = true;
                            isCRM = false;
                            isProjects = false;
                            isShoots = false;
                            isTasks = false;
                          });
                        },
                        child: isHome
                            ? Container(
                                width: 175.w,
                                height: 175.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xFF4E55F5),
                                ),
                                child: Center(child: Text("Home",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: "mid"),)),
                              )
                            : Image.asset("assets/images/home/home.png",width: 175.w,height: 175.w,)
                    ),

                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            isCRM = true;
                            isProjects = false;
                            isShoots = false;
                            isTasks = false;
                          });
                        },
                        child: isCRM
                            ? Container(
                          width: 175.w,
                          height: 175.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF4E55F5),
                          ),
                          child: Center(child: Text("CRM",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: "mid"),)),
                        )
                            : Image.asset("assets/images/home/crm.png",width: 175.w,height: 175.w,)
                    ),

                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            isCRM = false;
                            isProjects = true;
                            isShoots = false;
                            isTasks = false;
                          });
                        },
                        child: isProjects
                            ? Container(
                          width: 175.w,
                          height: 175.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF4E55F5),
                          ),
                          child: Center(child: Text("Projects",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: "mid"),)),
                        )
                            : Image.asset("assets/images/home/projects.png",width: 175.w,height: 175.w,)
                    ),

                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            isCRM = false;
                            isProjects = false;
                            isShoots = true;
                            isTasks = false;
                          });
                        },
                        child: isShoots
                            ? Container(
                          width: 175.w,
                          height: 175.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF4E55F5),
                          ),
                          child: Center(child: Text("Shoots",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: "mid"),)),
                        )
                            : Image.asset("assets/images/home/shoots.png",width: 175.w,height: 175.w,)
                    ),

                    GestureDetector(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            isCRM = false;
                            isProjects = false;
                            isShoots = false;
                            isTasks = true;
                          });
                        },
                        child: isTasks
                            ? Container(
                          width: 175.w,
                          height: 175.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF4E55F5),
                          ),
                          child: Center(child: Text("Tasks",style: TextStyle(fontSize: 40.sp,color: Colors.white,fontFamily: "mid"),)),
                        )
                            : Image.asset("assets/images/home/tasks.png",width: 175.w,height: 175.w,)
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(List<Map<String, String>> items) {
    return Container(
      width: 1000.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: items.map((item) {
                String name = item['name']!;
                String email = item['email']!;
                String time = item['time']!;
                return Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xFFECECEC), width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150.w,
                        height: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.primaries[name.length % Colors.primaries.length],
                        ),
                        child: Center(
                          child: Text(
                            name[0], // First letter
                            style: TextStyle(fontSize: 50.sp, color: Colors.black, fontFamily: "bold"),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: TextStyle(fontSize: 45.sp, fontFamily: 'bold')),
                          Text(email, style: TextStyle(fontSize: 30.sp, color: Color(0xFF2697FF), fontFamily: 'mid')),
                          Text(time, style: TextStyle(fontSize: 30.sp, color: Color(0xFF87888E), fontFamily: 'mid')),
                        ],
                      ),
                      Spacer(),
                      Image.asset("assets/images/home/right_arrow.png", width: 100.w, height: 100.w),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

}
