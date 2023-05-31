import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freelance/controller/category_controller.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/pages/home/widgets/home_bycategories.dart';
import 'package:freelance/pages/home/widgets/home_categories_item.dart';
import 'package:freelance/pages/home/widgets/home_jobs_item.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JobController _jobController = JobController();
  final CategoryController _categoryController = CategoryController();

  @override
  void initState() {
    getAllJobs();

    super.initState();
  }

  void getAllJobs() async {
    await _jobController.getJobslist();
    await _categoryController.getCategorylist();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
      child: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Search",
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeByCategories(
                                    categoryname: _searchController.text)));
                      },
                      child: Text("Search"),
                    )
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
            SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HomeCategoriesItem(
                            _categoryController.items[index],
                            key: Key("$index"),
                          );
                        },
                        itemCount: _categoryController.items.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                )),
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
      ),
    );
  }
}
