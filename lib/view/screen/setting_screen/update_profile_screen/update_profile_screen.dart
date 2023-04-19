
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_one_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';
import 'package:flutter/cupertino.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

   TextEditingController UsernameController = TextEditingController();
   TextEditingController SurnameController = TextEditingController();
   TextEditingController NameController = TextEditingController();
   TextEditingController EmailController = TextEditingController();
   TextEditingController PhonenumberController = TextEditingController();
   TextEditingController DateofbirthController = TextEditingController();
  bool _isTextFieldEmpty = true;
   @override
   void initState() {
     super.initState();
     UsernameController.addListener(() {
       setState(() {
         _isTextFieldEmpty = UsernameController.text.isEmpty;
       });
     });
     SurnameController.addListener(() {
       setState(() {
         _isTextFieldEmpty = SurnameController.text.isEmpty;
       });
     });
     NameController.addListener(() {
       setState(() {
         _isTextFieldEmpty = NameController.text.isEmpty;
       });
     });
     EmailController.addListener(() {
       setState(() {
         _isTextFieldEmpty = EmailController.text.isEmpty;
       });
     });

     PhonenumberController.addListener(() {
       setState(() {
         _isTextFieldEmpty = PhonenumberController.text.isEmpty;
       });
     });

     DateofbirthController.addListener(() {
       setState(() {
         _isTextFieldEmpty = DateofbirthController.text.isEmpty;
       });
     });




   }


   void _saveData() {
     // Perform save operation
   }

  XFile? image;
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

    DateTime? _selectedDate ;
    final DateTime? _userBirthday = authController.user.value?.birthDay;

   Future<void> _selectDate(BuildContext context) async {
     final DateTime? picked = await showDatePicker(
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
  @override
  void dispose() {
    UsernameController.dispose();
    SurnameController.dispose();
    NameController.dispose();
    EmailController.dispose();
    PhonenumberController.dispose();
    DateofbirthController.dispose();
    super.dispose();
  }

   bool obsecur = true;
  
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
                                Text('Username',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                  controller: UsernameController,
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
                                Text('Surname',
                                  style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil().setSp(65),
                                  fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
                                TextFormField(
                                     controller: SurnameController,
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
                                TextFormField(
                                  controller: NameController,
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
                                  controller: EmailController,
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
                                  controller: PhonenumberController,
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

                                  controller: DateofbirthController,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.done,
                                  autocorrect: false,
                                  obscureText: false,
                                  readOnly: true,


                                    onTap: () async {
                                      _selectDate(context);
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
                                  onPressed: () => _selectDate(context),
                                  child: Text('Select Date'),
                                ),
                              ],
                            ),

                          ),







                          Padding(
                            padding: const EdgeInsets.only(top: 100, bottom: 200).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isTextFieldEmpty ?
                                ElevatedButton(
                                  style: ButtonStyle(

                                      backgroundColor: MaterialStatePropertyAll<Color>(ColorConstant.blue51),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: ColorConstant.blue51)))),
                                  onPressed: () {  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(900),
                                    height: ScreenUtil().setHeight(190),
                                    margin: EdgeInsets.only(
                                      left: 19,
                                      top: 20,
                                      right: 19,
                                    ).r,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Save',
                                      style: TextStyle(fontSize: 65.sp),
                                    ),
                                  ),
                                ):

                                ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.blue)))),
                                  onPressed: () {
                                    _saveData();
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(900),
                                    height: ScreenUtil().setHeight(190),
                                    margin: EdgeInsets.only(
                                      left: 19,
                                      top: 20,
                                      right: 19,
                                    ).r,
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

