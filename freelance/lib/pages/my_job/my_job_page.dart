import 'package:flutter/material.dart';
import 'package:freelance/layouts/header_mainpage.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/pages/my_job/my_job_detail.dart';
import 'package:freelance/utils/app_styles.dart';

class MyJobPage extends StatelessWidget {
  const MyJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          MainPageHeader(title: 'MyJob ${MediaQuery.of(context).size.width}'),
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 246, 241, 241)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      //controller: search,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.blue,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Search",
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                RoundedCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyJobDetail()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: RoundedImage(
                          size: 50,
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Job title",
                                    style: Styles.headLineStyle3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Applied At',
                                  style: Styles.headLineStyle3,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Category",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'May, 5 2023',
                                  style: Styles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
