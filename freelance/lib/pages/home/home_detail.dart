import 'package:flutter/material.dart';
import 'package:freelance/layouts/header_detail.dart';
import 'package:freelance/model_widget/rounded_button.dart';
import 'package:freelance/model_widget/rounded_detailcard.dart';
import 'package:freelance/utils/app_styles.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const DetailHeader(),
            const SizedBox(
              height: 20,
            ),
            RoundedDetailCardExpanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          // margin: const EdgeInsets.only(top: 5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg')),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job title",
                              style: Styles.headLineStyle3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text('Category'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  size: 16,
                                  color: Styles.primaryColor,
                                ),
                                const Text("Status")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person_search_outlined,
                                size: 20,
                                color: Styles.primaryColor,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                'N applicant',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                size: 20,
                                color: Styles.primaryColor,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                'May, 5 2023',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.paid_outlined,
                                size: 20,
                                color: Styles.primaryColor,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                'Rp. 5.000.000',
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Description',
                    style: Styles.headLineStyle3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'File',
                    style: Styles.headLineStyle3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('ERD.pdf'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedButton(
                        title: 'Apply',
                        onTap: () {},
                      )
                    ],
                  ),
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
