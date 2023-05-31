import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../../controller/job_controller.dart';
import '../../../model/api_respons.dart';
import '../../../utils/app_styles.dart';
import 'home_jobs_item.dart';

class HomeByCategories extends StatefulWidget {
  final String categoryname;
  const HomeByCategories({super.key, required this.categoryname});

  @override
  State<HomeByCategories> createState() => _HomeByCategoriesState();
}

class _HomeByCategoriesState extends State<HomeByCategories> {
  final JobController _jobController = JobController();
  //final CategoryController _categoryController = CategoryController();

  @override
  void initState() {
    getAllJobs();

    super.initState();
  }

  void getAllJobs() async {
    ApiRespons result = await _jobController.getJobslist();
    //ApiRespons result2 = await _categoryController.getCategorylist();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: primary2,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: buttonPojokKananBorder,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "Back",
                      style: Styles.headLineStyle3,
                    ),
                  ),
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
                      child: const Text("Search"),
                    )
                  ],
                )),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category : '${widget.categoryname}'",
                  style: Styles.headLineStyle3,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return (_jobController.items[index].category.toLowerCase() ==
                          widget.categoryname.toLowerCase())
                      ? HomeJobItem(
                          _jobController.items[index],
                          key: Key("$index"),
                        )
                      : const SizedBox();
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
