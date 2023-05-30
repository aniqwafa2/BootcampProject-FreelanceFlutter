import 'package:flutter/material.dart';
import 'package:freelance/layouts/header_detail.dart';
import 'package:freelance/model_widget/rounded_detailcard.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/utils/app_styles.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DetailHeader(),
            const SizedBox(
              height: 20,
            ),
            RoundedDetailCardExpanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RoundedImage(
                      size: 100,
                      image: AssetImage('assets/images/profile.jpg')),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Nama'),
                              Text('Email'),
                              Text('Password'),
                              Text('Alamat'),
                              Text('Skill'),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              InputTextField(),
                              InputTextField(),
                              InputTextField(),
                              InputTextField(),
                              InputTextField(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                            onTap: () => Navigator.pop(context),
                            child: const Center(
                              child: Text(
                                'Cancel Edit',
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
                            onTap: () => {},
                            borderRadius: BorderRadius.circular(8),
                            child: const Center(
                              child: Text(
                                'Save Profile',
                              ),
                            ),
                          ),
                        ),
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
      )),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'data',
      decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero),
    );
  }
}
