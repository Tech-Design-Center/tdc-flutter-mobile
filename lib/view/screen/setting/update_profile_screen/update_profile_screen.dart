import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/controller/setting_controller.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';
import 'package:flutter/cupertino.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool _isTextFieldEmpty = true;
  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _fullNameController.text.isEmpty;
      });
    });
    _surNameController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _surNameController.text.isEmpty;
      });
    });
    _nameController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _nameController.text.isEmpty;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _emailController.text.isEmpty;
      });
    });

    _phoneNumberController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _phoneNumberController.text.isEmpty;
      });
    });

    _birthdayController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _birthdayController.text.isEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _passwordController.text.isEmpty;
      });
    });
  }

  void _saveData() {
    // Perform save operation
  }

  DateTime? _selectedDate;
  final DateTime? _userBirthday = authController.user.value?.birthDay;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blueAccent, // <-- SEE HERE
              //onPrimary: Colors.redAccent, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.blue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        print(_selectedDate);
      });
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'.tr),
            content: Container(
              height: ScreenUtil().setHeight(400),
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      settingController.pickImage();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _surNameController.dispose();
    _nameController!.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  bool obsecur = true;

  String? profileImage = authController.user.value?.imageURL ??
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: 'Update Profile'.tr,
            ),
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
                    width: ScreenUtil().screenWidth,
                    height: 500.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgRectangle792), fit: BoxFit.cover),
                    ),
                  ),
                ),

                //Avatar
                Positioned(
                  bottom: 20,
                  child: Column(
                    children: [
                      //profile image
                      GestureDetector(
                        onTap: () {
                          settingController.pickImage();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            //avatar
                            Positioned(
                              child: GetBuilder(
                                  init: SettingController(),
                                  builder: (state) {
                                    if (settingController.profile == null) {
                                      return Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          //avatar
                                          Positioned(
                                            child: CircleAvatar(
                                              radius: 280.r,
                                              foregroundImage: NetworkImage(profileImage!),
                                            ),
                                          ),

                                          //icon and text
                                          Positioned(
                                            child: Container(
                                              width: 560.w,
                                              height: 560.h,
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(1.r),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                    size: 160.r,
                                                  ),
                                                  SizedBox(
                                                    height: 60.h,
                                                  ),
                                                  Text(
                                                    'Edit'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 80.sp),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return CircleAvatar(
                                          backgroundColor: Colors.white70,
                                          radius: 280.r,
                                          backgroundImage: FileImage(settingController.profile!));
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        "Student ID : # ".tr + " ${authController.user.value?.id ?? 0}",
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
                    ],
                  ),
                ),
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
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _fullNameController,
                                  keyboardType: TextInputType.emailAddress,
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
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Surname'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _surNameController,
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
                                      hintText: '${authController.user.value?.surname}'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lastname'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextFormField(
                                  controller: _nameController,
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
                                      hintText: '${authController.user.value?.name}'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty".tr;
                                    } else if (!value.isValidEmail) {
                                      return "Please enter valid email".tr;
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
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty".tr;
                                    } else if (!value.isValidPhone) {
                                      return "Please enter valid phone number".tr;
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
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date of Birth'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _birthdayController,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  readOnly: true,
                                  onTap: () async {
                                    _selectDate(context);
                                    _isTextFieldEmpty = false;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey)),
                                    hintText: _selectedDate == null
                                        ? DateFormat('dd / MMMM / yyyy').format(_userBirthday!)
                                        : DateFormat('dd / MMMM / yyyy').format(_selectedDate!),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _selectDate(context);
                                    _isTextFieldEmpty = false;
                                  },
                                  child: Text('Select Date'.tr),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter your password to confirm'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty".tr;
                                    }
                                    return null;
                                  },
                                  //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey)),

                                    hintText: 'Password'.tr,
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 100, bottom: 200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isTextFieldEmpty
                                    ? ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll<Color>(
                                                ColorConstant.blue51),
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18.0),
                                                        side: BorderSide(
                                                            color: ColorConstant.blue51)))),
                                        onPressed: () {},
                                        child: Container(
                                          width: ScreenUtil().setWidth(900),
                                          height: ScreenUtil().setHeight(190),
                                          margin: REdgeInsets.only(
                                            left: 19,
                                            top: 20,
                                            right: 19,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Save'.tr,
                                            style: TextStyle(fontSize: 65.sp),
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18.0).r,
                                                        side: BorderSide(color: Colors.blue)))),
                                        onPressed: () async {
                                          _saveData();
                                          SharedPreferences prefs =
                                              await SharedPreferences.getInstance();
                                          String? _imageURL = prefs.getString('imageURL');

                                          ///if user not update their info then save current data
                                          String fullName = _fullNameController.text.isEmpty
                                              ? authController.user.value!.fullName!
                                              : _fullNameController.text;
                                          String email = _emailController.text.isEmpty
                                              ? authController.user.value!.email!
                                              : _emailController.text;
                                          String surName = _surNameController.text.isEmpty
                                              ? authController.user.value!.surname!
                                              : _surNameController.text;
                                          String name = _nameController.text.isEmpty
                                              ? authController.user.value!.name!
                                              : _nameController.text;
                                          String phoneNumber = _phoneNumberController.text.isEmpty
                                              ? authController.user.value!.phoneNumber.toString()
                                              : _phoneNumberController.text;
                                          String image = _imageURL!.isEmpty
                                              ? authController.user.value!.imageURL!
                                              : _imageURL;
                                          String birthday = _birthdayController.text.isEmpty
                                              ? authController.user.value!.imageURL.toString()
                                              : _birthdayController.text;
                                          authController.updateUser(
                                            email: email,
                                            password: _passwordController.text,
                                            surName: surName,
                                            name: name,
                                            phoneNumber: phoneNumber,
                                            imageURL: image,
                                            birthday: birthday,
                                            oldEmail: authController.user.value!.email,
                                            fullName: fullName,
                                            gender: '',
                                          );
                                        },
                                        child: Container(
                                          width: ScreenUtil().setWidth(900),
                                          height: ScreenUtil().setHeight(190),
                                          margin: REdgeInsets.only(
                                            left: 19,
                                            top: 20,
                                            right: 19,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontSize: 65.sp),
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
