import 'package:flutter/material.dart';
import 'package:freelance/layouts/login.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: Styles.headLineStyle3,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg')),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(51, 0, 0, 0)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(62, 0, 0, 0),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg')),
                        ),
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
                        Material(
                          child: Ink(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 167, 206),
                              borderRadius: buttonBorder,
                            ),
                            child: InkWell(
                              borderRadius: buttonBorder,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileEdit()));
                              },
                              child: const Center(
                                child: Text(
                                  'Edit Profile',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Material(
                          child: Ink(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 167, 206),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: logOut,
                              borderRadius: BorderRadius.circular(8),
                              child: const Center(
                                child: Text(
                                  'Log out',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ));
  }
}
