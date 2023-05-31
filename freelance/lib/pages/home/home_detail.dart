import 'package:flutter/material.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/job_model.dart';
import 'package:freelance/layouts/header_detail.dart';
import 'package:freelance/model_widget/rounded_button.dart';
import 'package:freelance/model_widget/rounded_detailcard.dart';
import 'package:freelance/model_widget/row_status.dart';
import 'package:freelance/utils/app_styles.dart';
import 'package:intl/intl.dart';

class HomeDetail extends StatefulWidget {
  final JobModel jobModel;
  final int applicant;
  final bool aplied;
  const HomeDetail(
      {super.key,
      required this.jobModel,
      required this.applicant,
      required this.aplied});

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  final JobController _jobController = JobController();

  bool checkStatus() {
    var jobStatus = widget.jobModel.status;
    var dateStatus =
        DateTime.parse(widget.jobModel.dueDate).isBefore(DateTime.now());
    return jobStatus || dateStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
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
                      Expanded(
                        flex: 2,
                        child: Container(
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
                              widget.jobModel.name,
                              style: Styles.headLineStyle3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(widget.jobModel.category),
                            const SizedBox(
                              height: 10,
                            ),
                            checkStatus()
                                ? const Status(
                                    color: Colors.red, status: 'Closed')
                                : Status(
                                    color: Styles.primaryColor, status: 'Open'),
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
                              Text(
                                '${widget.applicant} applicant',
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
                              Text(
                                DateFormat('MMM, d yyyy').format(
                                    DateTime.parse(widget.jobModel.dueDate)),
                                // timeago.format(
                                //     DateTime.parse(widget.jobModel.createdAt)),
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
                              Text(
                                formatRupiah.format(widget.jobModel.price),
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
                        widget.jobModel.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (widget.jobModel.file.isNotEmpty) ...[
                    Text(
                      'File',
                      style: Styles.headLineStyle3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.jobModel.file)
                  ],
                  const Expanded(
                    child: SizedBox(),
                  ),
                  if (!widget.aplied || checkStatus())
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundedButton(
                          title: 'Apply',
                          onTap: apply,
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

  void apply() async {
    ApiRespons result = await _jobController.applyJob(widget.jobModel.id);

    Future.delayed(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message)));
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    });
  }
}
