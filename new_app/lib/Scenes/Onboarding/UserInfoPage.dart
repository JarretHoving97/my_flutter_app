import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Scenes/Onboarding/OnboardingForm.dart';
import 'package:new_app/Util/AppColor.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Kloppen je gegevens?",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                "Pas je gegevens aan en vul nodige informatie is om door te kunnen gaan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            OnboardingForm(),
          ],
        ),
      ),
    );
  }
}
