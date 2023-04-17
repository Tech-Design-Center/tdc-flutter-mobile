
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_one_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: ScreenUtil().setHeight(400),
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


   bool obsecur = true;
    TextEditingController emailController = TextEditingController();

    TextEditingController nameController = TextEditingController();

  
  String profileImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(name: 'Update Profile',),
            Stack(
              alignment: Alignment.center,
              children: [
                //default
                Positioned(
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: 1000.h,
                      // decoration: BoxDecoration(color: Colors.red),
                    )),

                //background
                Positioned(
                  top: 0,
                  child: Container(
                    width:ScreenUtil().screenWidth,
                    height: 500.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgRectangle792), fit: BoxFit.cover),
                    ),
                  ),
                ),

//Avatar
                Positioned(
                    bottom: 0,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 0,
                              left: 29,
                              right: 29,
                            ).r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(
                                  40.00,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (authController.user.value?.fullName == null) {
                                    Get.offAll(() => OnboardingScreen());
                                  } else {
                                    myAlert();
                                    profileImage = '${authController.user.value?.image}';
                                  }
                                },
                                child:
                                CircleAvatar(
                                  foregroundImage:
                                  NetworkImage(profileImage),
                                  radius: 225.r,
                                )
                              ),
                            ),
                          ),

                          Container(
                            width: ScreenUtil().setWidth(
                              600.00,
                            ),
                            margin: EdgeInsets.only(
                              bottom: 25,
                              left: 29,
                              top: 15,
                              right: 29,
                            ),
                            child: Text(
                              "Student ID : # ${authController.user.value?.id ?? 0}",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: ScreenUtil().setSp(
                                  50,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ])),
              ],
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,
                      // decoration: BoxDecoration(color: Colors.yellow),
                    )),
                Positioned(
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(1700),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //body
                          Padding(
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name',
                                  style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil().setSp(65),
                                  fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                     controller: nameController,
                                     keyboardType: TextInputType.text,
                                     textInputAction: TextInputAction.done,
                                     autocorrect: false,
                                     obscureText: false,
                                          decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                borderSide: BorderSide(color: Colors.grey)),
                                                hintText: '${authController.user.value?.fullName}'),
                                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty";
                                    } else if (!value.isValidEmail) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      hintText: '${authController.user.value?.email}'),
                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone Number',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                  //controller: emailController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty";
                                    } else if (!value.isValidPhone) {
                                      return "Please enter valid phone number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      hintText: '0${authController.user.value?.phoneNumber}'),
                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date of Birth',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                  //controller: emailController,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      hintText: '${authController.user.value?.birthDay}'),
                                ),
                              ],
                            ),

                          ),







                          Padding(
                            padding: const EdgeInsets.only(top: 100, bottom: 200).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    height: ScreenUtil().setHeight(200),
                                    width: ScreenUtil().setWidth(1000),
                                    margin: EdgeInsets.only(
                                      right: 24,
                                      left: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueA200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

