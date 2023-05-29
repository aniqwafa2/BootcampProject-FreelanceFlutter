import 'package:flutter/material.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/job_model.dart';
import 'package:freelance/pages/home/home_detail.dart';
import 'package:freelance/pages/home/home_jobs_item.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JobController _jobController = JobController();

  @override
  void initState() {
    getAllJobs();

    super.initState();
  }

  void getAllJobs() async {
    ApiRespons result = await _jobController.getJobslist();
    setState(() {});
    //debugPrint("${_jobController.items}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              )
            ],
          ),
          const Gap(25),
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
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg')),
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return HomeJobItem(
                  _jobController.items[index],
                  key: Key("$index"),
                );
              },
              itemCount: _jobController.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
