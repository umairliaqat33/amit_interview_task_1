import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:amit_interview_task_1/views/screens/account_type_screen/account_type_screen.dart';
import 'package:flutter/material.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/account_setup.png',
                width: SizeConfig.width(context),
                height: SizeConfig.height(context) - 100,
              ),
              Text(
                "This may take a while!",
                style: TextStyle(
                  fontSize: SizeConfig.font20(context),
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AccountTypeScreen(),
        ),
      );
    });
  }
}
