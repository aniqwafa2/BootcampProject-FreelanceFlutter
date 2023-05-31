import 'package:flutter/material.dart';
import 'package:freelance/controller/myjob_controller.dart';
import 'package:freelance/model/applicant_model.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/model_widget/row_status.dart';
import 'package:freelance/pages/my_job/my_job_detail.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:intl/intl.dart';

class MyJobListView extends StatefulWidget {
  const MyJobListView({
    super.key,
  });

  @override
  State<MyJobListView> createState() => _MyJobListViewState();
}

class _MyJobListViewState extends State<MyJobListView> {
  final MyJobController _myJobController = MyJobController();
  List<ApplicantModel>? _myJobList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List<ApplicantModel>? myJobList = await _myJobController.getData();
    if (myJobList != null) {
      setState(() {
        _myJobList = myJobList;
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
              ApplicantModel item = _myJobList![index];
              return RoundedCard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyJobDetail(
                          jobData: item.job,
                          status: item.status,
                        ),
                      ));
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
                                  item.job.name,
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
                              Expanded(
                                child: Text(
                                  item.job.category.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                DateFormat('MMM, d yyyy')
                                    .format(item.createdAt),
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (item.status && item.job.status)
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
