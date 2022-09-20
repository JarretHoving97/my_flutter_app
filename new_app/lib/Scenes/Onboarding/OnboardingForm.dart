// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/Model/LocalUserModel.dart';
import 'package:new_app/Model/RegisterResponse.dart';
import 'package:new_app/Network/OnboardingClient.dart';
import 'package:new_app/Util/AppColor.dart';
import 'package:provider/provider.dart';

import '../../Network/AccessClient.dart';

class OnboardingForm extends StatefulWidget {
  const OnboardingForm({Key? key}) : super(key: key);

  @override
  State<OnboardingForm> createState() => _OnboardingFormState();
}

class _OnboardingFormState extends State<OnboardingForm> {
  @override
  void initState() {
    nameController.value =
        TextEditingValue(text: LocalUserModel.shared.user.displayName ?? "");

    phoneController.value =
        TextEditingValue(text: LocalUserModel.shared.user.phoneNumber ?? "");
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool isMember = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final membershipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final accessData = Provider.of<AccessAppProviver>(context, listen: false);

    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Naam",
                    labelText: "Naam",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "Vul je naam in";
                  }
                }),
              ),
              TextFormField(
                controller: phoneController,
                initialValue: LocalUserModel.shared.user.phoneNumber,
                decoration: const InputDecoration(
                    hintText: "Telefoonnummer", labelText: "Telefoonnummer"),
                // initialValue: LocalUserModel.shared.user.phoneNumber,
                validator: ((value) {
                  // TODO: Regex phone
                  if (value == null || value.isEmpty) {
                    return "Vul een geldig telefoonnummer in";
                  }
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Switch(
                      activeColor: AppColor.secondairyColor,
                      value: isMember,
                      onChanged: (value) {
                        setState(() {
                          isMember = value;
                        });
                      }),
                  const Text(
                    "Ben je lid van onze vereniging?",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              isMember
                  ? TextFormField(
                      controller: membershipController,
                      decoration: const InputDecoration(
                          hintText: "Lidnummer", labelText: "Lidnummer"),
                      validator: ((value) {
                        if (isMember) {
                          if (value == null || value.isEmpty) {
                            return "Vul je lidnummer in waarmee je ingeschreven staat";
                          }
                        }
                      }),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: screenWidth / 1.5,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      RegisteResponse? response = await sendOnboardingInfo(
                          LocalUserModel.shared.user,
                          phoneController.text,
                          nameController.text,
                          membershipController.text);

                      if (response != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Gegevens opgeslagen!")));

                        await Provider.of<AccessAppProviver>(context,
                                listen: false)
                            .fetchAccess(context);

                        // Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Er is iets misgegaan..")));
                      }
                    }
                  },
                  child: Text("Volgende"),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.appColor,
                    onPrimary: AppColor.appBackground,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
