import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/views/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.width20(context),
                right: SizeConfig.width20(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 370,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "ABC Private Limited",
                              style: TextStyle(
                                  fontSize: SizeConfig.font18(context),
                                  color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: "CONTINUE",
                      onPressed: () {},
                      buttonColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
