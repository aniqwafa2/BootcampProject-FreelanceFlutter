import 'package:flutter/material.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/layouts/header_detail.dart';
import 'package:freelance/model_widget/rounded_button.dart';
import 'package:freelance/model_widget/rounded_detailcard.dart';
import 'package:freelance/model_widget/row_status.dart';
import 'package:freelance/model_widget/text_link.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:intl/intl.dart';

class MyJobDetail extends StatefulWidget {
  final dynamic jobData;
  final bool status;

  const MyJobDetail({
    super.key,
    required this.jobData,
    required this.status,
  });

  @override
  State<MyJobDetail> createState() => _MyJobDetailState();
}

class _MyJobDetailState extends State<MyJobDetail> {
  final JobController _jobAplicantController = JobController();

  @override
  void initState() {
    super.initState();
    getJobApplicantCount(widget.jobData.id);
  }

  void getJobApplicantCount(int jobId) async {
    await _jobAplicantController.getJobsAplicant(jobId);

    if (mounted) {
      setState(() {});
    }
  }

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
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     // margin: const EdgeInsets.only(top: 5),
                      //     height: 50,
                      //     width: 50,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     child: const CircleAvatar(
                      //         backgroundImage:
                      //             AssetImage('assets/images/profile.jpg')),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jobData.name,
                              style: Styles.headLineStyle3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(widget.jobData.category.name),
                            const SizedBox(
                              height: 10,
                            ),
                            if (widget.status && widget.jobData.status)
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget.status == false ||
                              widget.jobData.status == false) ...[
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
                                Text(
                                  '${_jobAplicantController.useritems.length} Applicant',
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
                                Text(DateFormat('MMM, d yyyy')
                                    .format(widget.jobData.dueDate)),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            )
                          ],
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
                              Text(
                                formatRupiah.format(widget.jobData.price),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.jobData.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (widget.jobData.file.isNotEmpty) ...[
                    Text(
                      'File',
                      style: Styles.headLineStyle3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinkFile(filename: widget.jobData.file)
                  ],
                  const Expanded(
                    child: SizedBox(),
                  ),
                  if (widget.jobData.status && widget.status)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundedButton(
                          title: 'Submit',
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RoundedButton(
                          title: "Chat",
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
