import 'package:flutter/material.dart';
import 'package:freelance/layouts/login.dart';
import 'package:freelance/layouts/header_mainpage.dart';
import 'package:freelance/model_widget/rounded_button.dart';
import 'package:freelance/model_widget/rounded_detailcard.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/pages/profile/profile_edit.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
    });

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ),
        (route) => false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          "Berhasil logout",
          style: TextStyle(fontSize: 16),
        )),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const MainPageHeader(title: 'Profile'),
          const SizedBox(
            height: 20,
          ),
          RoundedDetailCardExpanded(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const RoundedImage(
                        size: 100,
                        image: AssetImage('assets/images/profile.jpg')),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Ahmad si Rajin',
                      style: Styles.headLineStyle1,
                    ),
                    Text(
                      'Fullstack Developer',
                      style: Styles.headLineStyle3,
                    ),
                    const Text(
                      'Jakarta',
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    RoundedButton(
                      title: 'Edit Profile',
                      width: 120,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileEdit()));
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RoundedButton(
                      title: 'Log Out',
                      width: 120,
                      onTap: logOut,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ));
  }
}
