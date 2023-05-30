import 'package:flutter/material.dart';
import 'package:freelance/controller/myjob_controller.dart';
import 'package:freelance/layouts/header_mainpage.dart';
import 'package:freelance/model/myjob_model.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/pages/my_job/my_job_detail.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:intl/intl.dart';

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
          const Expanded(
            child: MyJobListView(),
          ),
        ],
      ),
    ));
  }
}

class MyJobListView extends StatefulWidget {
  const MyJobListView({
    super.key,
  });

  @override
  State<MyJobListView> createState() => _MyJobListViewState();
}

class _MyJobListViewState extends State<MyJobListView> {
  final MyJobController _myJobController = MyJobController();
  List<Datum>? _myJobList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    MyJobListModel? myJobList = await _myJobController.getData();
    if (myJobList != null) {
      setState(() {
        _myJobList = myJobList.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _myJobList == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _myJobList!.length,
            itemBuilder: (BuildContext context, int index) {
              Datum item = _myJobList![index];
              return RoundedCard(
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
                                  "${item.job!.name}",
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
                                DateFormat('MMM, d yyyy')
                                    .format(item.createdAt!),
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (item.status! && item.job!.status!)
                            Status(
                              color: Colors.lightGreen.shade800,
                              status: 'Accepted',
                            )
                          else
                            Status(
                              color: Styles.primaryColor,
                              status: 'Applied',
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}

class Status extends StatelessWidget {
  final Color color;
  final String status;

  const Status({
    super.key,
    required this.color,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.fiber_manual_record,
          size: 16,
          color: color,
        ),
        Text(status)
      ],
    );
  }
}
