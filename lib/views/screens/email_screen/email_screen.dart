import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:amit_interview_task_1/utils/utils.dart';
import 'package:amit_interview_task_1/views/screens/account_setup_screen/account_setup_screen.dart';
import 'package:amit_interview_task_1/views/widgets/buttons/custom_button.dart';
import 'package:amit_interview_task_1/views/widgets/text_fields/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.height(context) - 28,
            child: Column(
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
                        "Hello ${widget.name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: SizeConfig.font24(context),
                          fontWeight: FontWeight.w400,
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
                          "Let's set-up your Business Account",
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.width20(context) * 4,
                              right: SizeConfig.width20(context) * 4,
                            ),
                            child: Text(
                              "Enter your Email-Id registered with GST",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.font18(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.height15(context),
                          ),
                          Form(
                            key: _formKey,
                            child: TextFormFieldWidget(
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              controller: _emailController,
                              validator: (value) => Utils.emailValidator(value),
                              label: "",
                              hintText: "johndoe@email.com",
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.height20(context),
                          ),
                          SizedBox(
                            height: SizeConfig.height20(context) * 2,
                          ),
                          SizedBox(
                            width: SizeConfig.width20(context) * 10,
                            child: CustomButton(
                              title: "CONTINUE",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountSetupScreen(),
                                    ),
                                  );
                                }
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
        ),
      ),
    );
  }
}
