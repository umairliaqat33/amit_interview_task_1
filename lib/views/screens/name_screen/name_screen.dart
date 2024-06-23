import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:amit_interview_task_1/utils/utils.dart';
import 'package:amit_interview_task_1/views/screens/email_screen/email_screen.dart';
import 'package:amit_interview_task_1/views/widgets/buttons/custom_button.dart';
import 'package:amit_interview_task_1/views/widgets/text_fields/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.height(context) - 25,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo1.png',
                        width: SizeConfig.width20(context) * 8,
                        height: SizeConfig.height20(context) * 8,
                      ),
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.width20(context) * 2,
                          right: SizeConfig.width20(context) * 2,
                        ),
                        child: Text(
                          "Please tell us your name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.font20(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomSheet(
                  backgroundColor: Colors.black,
                  onClosing: () {},
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.width15(context) + 1,
                        right: SizeConfig.width15(context) + 1,
                        top: SizeConfig.height15(context) * 2,
                      ),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                inputType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                controller: _firstNameController,
                                validator: (value) =>
                                    Utils.nameValidator(value),
                                label: "First Name",
                                hintText: "John",
                                isLabelColorGiven: true,
                                isBorderColorGiven: true,
                                fillColor: Colors.black,
                              ),
                              SizedBox(
                                height: SizeConfig.height8(context),
                              ),
                              TextFormFieldWidget(
                                inputType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                controller: _lastNameController,
                                validator: (value) =>
                                    Utils.nameValidator(value),
                                label: "Last Name",
                                hintText: "Doe",
                                isLabelColorGiven: true,
                                isBorderColorGiven: true,
                                fillColor: Colors.black,
                              ),
                              SizedBox(
                                height: SizeConfig.height20(context) * 10,
                              ),
                              SizedBox(
                                width: SizeConfig.width20(context) * 10,
                                child: CustomButton(
                                  title: "CONTINUE",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EmailScreen(
                                            name: _firstNameController.text,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  buttonColor: whiteColor,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.height15(context),
                              ),
                            ],
                          ),
                        ),
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
