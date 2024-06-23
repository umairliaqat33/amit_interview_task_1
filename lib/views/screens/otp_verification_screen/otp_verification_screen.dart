// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:amit_interview_task_1/views/screens/name_screen/name_screen.dart';
import 'package:amit_interview_task_1/views/widgets/buttons/custom_button.dart';
import 'package:amit_interview_task_1/views/widgets/text_fields/text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String verificationId;
  const OtpVerificationScreen({
    super.key,
    required this.verificationId,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otp1Controller = TextEditingController();

  final TextEditingController _otp2Controller = TextEditingController();

  final TextEditingController _otp3Controller = TextEditingController();

  final TextEditingController _otp4Controller = TextEditingController();
  final TextEditingController _otp5Controller = TextEditingController();
  final TextEditingController _otp6Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      "Enter OTP sent to your Mobile Number",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp1Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp1Controller.text.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (_otp1Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp2Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp2Controller.text.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (_otp2Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp3Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp3Controller.text.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (_otp3Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp4Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp4Controller.text.length == 1) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  } else if (_otp4Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp5Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp5Controller.text.length == 1) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  } else if (_otp5Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextFormFieldWidget(
                                inputType: TextInputType.number,
                                inputAction: TextInputAction.next,
                                controller: _otp6Controller,
                                validator: (value) {
                                  if (value == null) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      _otp6Controller.text.length == 1) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  } else if (_otp6Controller.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                label: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height20(context),
                      ),
                      Text(
                        "Didn't receive OTP?",
                        style: TextStyle(
                          fontSize: SizeConfig.font12(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: SizeConfig.font14(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height20(context) * 2,
                      ),
                      SizedBox(
                        width: 200,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: SizeConfig.font12(context),
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              const TextSpan(
                                  text:
                                      'By proceeding you are indicating that you have read and agree to our '),
                              TextSpan(
                                text: 'Terms of Use',
                                style: TextStyle(
                                  fontSize: SizeConfig.font12(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  fontSize: SizeConfig.font12(context),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height8(context),
                      ),
                      SizedBox(
                        width: SizeConfig.width20(context) * 10,
                        child: CustomButton(
                          title: "CONTINUE",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const NameScreen(),
                              ),
                            );
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

  Future<void> verifyCode() async {
    if (_formKey.currentState!.validate()) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: _otp1Controller.text +
              _otp3Controller.text +
              _otp3Controller.text +
              _otp4Controller.text +
              _otp5Controller.text +
              _otp6Controller.text,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: "Verification Complete");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NameScreen(),
            ),
          );
        }
      } catch (e) {
        log("Exception at otp verification: ${e.toString()}");
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
