import 'package:flutter/material.dart';
import 'package:freelance/utils/app_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Profile",
                    style: Styles.headLineStyle3,
                  )),
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
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg')),
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
                    Column(
                      children: [
                        InkWell(
                          onTap: () => {},
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 167, 206),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Edit Profile',
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 12),
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 167, 206),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Log out',
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
