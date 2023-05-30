import 'package:flutter/material.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:intl/intl.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/model/api_respons.dart';
import 'package:freelance/model/job_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../utils/app_styles.dart';
import '../home_detail.dart';

class HomeJobItem extends StatefulWidget {
  final JobModel jobModel;
  const HomeJobItem(this.jobModel, {super.key});

  @override
  State<HomeJobItem> createState() => _HomeJobItemState();
}

class _HomeJobItemState extends State<HomeJobItem> {
  final JobController _jobAplicantController = JobController();
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  void initState() {
    getJobAplicant(widget.jobModel.id);
    super.initState();
  }

  void getJobAplicant(int jobId) async {
    ApiRespons result4 = await _jobAplicantController.getJobsAplicant(jobId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDetail(
                      jobModel: widget.jobModel,
                      applicant: _jobAplicantController.useritems.length,
                    )));
      },
      child: Row(
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
                  backgroundImage: AssetImage('assets/images/profile.jpg')),
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
                Row(
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 16,
                      color: (widget.jobModel.status)
                          ? Colors.red
                          : Styles.primaryColor,
                    ),
                    (widget.jobModel.status)
                        ? const Text("Closed")
                        : const Text("Open")
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
                  Text(
                    "${_jobAplicantController.useritems.length} applicant",
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
                    timeago.format(DateTime.parse(widget.jobModel.createdAt)),
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
                    formatCurrency.format(widget.jobModel.price),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
