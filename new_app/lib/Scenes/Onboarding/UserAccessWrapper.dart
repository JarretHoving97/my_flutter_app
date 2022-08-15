import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Network/AccessClient.dart';
import 'package:new_app/Scenes/Onboarding/OnboardingForm.dart';
import 'package:new_app/Scenes/Onboarding/UserInfoPage.dart';
import 'package:provider/provider.dart';

import '../../Util/AppColor.dart';

class UserAccessWrapper extends StatefulWidget {
  const UserAccessWrapper({Key? key}) : super(key: key);

  @override
  State<UserAccessWrapper> createState() => _UserAccessWrapperState();
}

class _UserAccessWrapperState extends State<UserAccessWrapper> {
  @override
  void initState() {
    super.initState();

    final accessData = Provider.of<AccessAppProviver>(context, listen: false);
    accessData.fetchAccess(context);
  }

  @override
  Widget build(BuildContext context) {
    final accessProvider = Provider.of<AccessAppProviver>(context);

    return Scaffold(
        body: Container(
      child: UserInfoPage(),
      // child: accessProvider.loading
      //     ? Container(
      //         child: const Center(
      //             child: CircularProgressIndicator(
      //           color: AppColor.secondairyColor,
      //         )),
      //       )
      //     : accessProvider.hasAccess.registered
      //         ? Text("Heeft access!")
      //         : UserInfoPage(),
    ));
  }
}
