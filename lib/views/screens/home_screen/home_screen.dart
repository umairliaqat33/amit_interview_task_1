import 'dart:developer';

import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:amit_interview_task_1/utils/utils.dart';
import 'package:amit_interview_task_1/views/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:amit_interview_task_1/views/widgets/buttons/custom_button.dart';
import 'package:amit_interview_task_1/views/widgets/text_fields/text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _checkBox = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: SizeConfig.width20(context) * 8,
                    height: SizeConfig.height20(context) * 8,
                  ),
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: SizeConfig.font28(context) + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.height18(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.width20(context) * 4,
                      right: SizeConfig.width20(context) * 4,
                    ),
                    child: Text(
                      "Please Enter Your Mobile Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: SizeConfig.font20(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width15(context) + 1,
                    right: SizeConfig.width15(context) + 1,
                    top: SizeConfig.height15(context),
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: TextFormFieldWidget(
                          inputType: TextInputType.phone,
                          inputAction: TextInputAction.done,
                          controller: _phoneController,
                          validator: (value) =>
                              Utils.phoneNumberValidator(value),
                          label: "Mobile Number",
                          hintText: "+92----------",
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height20(context),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _checkBox,
                            onChanged: (value) => changeCheckBoxValue(value),
                            activeColor: Colors.black,
                            overlayColor: WidgetStateProperty.resolveWith(
                              (states) {
                                if (!states.contains(WidgetState.selected)) {
                                  return Colors.black;
                                }
                                return null;
                              },
                            ),
                            semanticLabel:
                                "Enable whatsapp permission to send reminders, updates, etc.",
                          ),
                          SizedBox(
                            width: SizeConfig.width20(context) * 12,
                            child: Text(
                              "Enable whatsapp permission to send reminders, updates, etc.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.font14(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height20(context) * 2,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          title: "SEND OTP",
                          onPressed: () {
                            verifyPhoneNumber();
                          },
                          buttonColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height15(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool changeCheckBoxValue(bool? value) {
    setState(() {
      _checkBox = !_checkBox;
    });
    return _checkBox;
  }

  void verifyPhoneNumber() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (_formKey.currentState!.validate()) {
      try {
        auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential phoneAuthCred) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String verificationID, int? resendTOken) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpVerificationScreen(
                  verificationId: verificationID,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          phoneNumber: _phoneController.text.toString(),
        );
      } catch (e) {
        log("Exception at sending otp: ${e.toString()}");
      }
    }
  }
}
