import 'package:flutter/material.dart';
import 'package:freelance/utils/app_styles.dart';
// import 'package:freelance/utils/app_styles.dart';

class MyJobPage extends StatelessWidget {
  const MyJobPage({super.key});

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
                    "MyJob",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                const SizedBox(
                  height: 20,
                ),
                // ListView()
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg')),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(children: [
                          Text(
                            "Job title",
                            style: Styles.headLineStyle3,
                          ),
                          const Text('Category')
                        ]),
                        Column(
                          children: [
                            Text(
                              "Applied At",
                              style: Styles.headLineStyle3,
                            ),
                            Text(
                              'Date',
                              style: Styles.headLineStyle3,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 16,
                          color: Styles.primaryColor,
                        ),
                        const Text("status")
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
