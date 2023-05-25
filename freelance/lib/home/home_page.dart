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
    return Scaffold(
      backgroundColor: primary2,
      body: ListView(
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
                )
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}