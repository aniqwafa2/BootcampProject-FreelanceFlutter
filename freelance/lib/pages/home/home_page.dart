import 'package:flutter/material.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary2,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find Your Job",
                          style: Styles.headLineStyle1,
                        ),
                        Text(
                          "Earn Your Money",
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 246, 241, 241)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: Styles.headLineStyle3,
                    )
                  ],
                ),
                Row(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 75,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/profile.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Cat. name",
                                style: Styles.headLineStyle3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Jobs",
                      style: Styles.headLineStyle3,
                    )
                  ],
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 12),
                      child: Row(
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
                    )),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
