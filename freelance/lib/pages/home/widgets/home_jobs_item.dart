import 'package:flutter/material.dart';
import 'package:freelance/model/applicantcek_model.dart';
import 'package:freelance/model_widget/rounded_card.dart';
import 'package:freelance/controller/job_controller.dart';
import 'package:freelance/model/job_model.dart';
import 'package:freelance/model_widget/row_status.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/user_token.dart';
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
  final UserToken _userToken = UserToken();
  bool aplied = false;

  @override
  void initState() {
    getJobAplicant(widget.jobModel.id);
    super.initState();
  }

  void getJobAplicant(int jobId) async {
    final getId = await _userToken.getUserId();
    await _jobAplicantController.getJobsAplicant(jobId);
    if (mounted) {
      ApplicantcekModel cek = _jobAplicantController.useritems.firstWhere(
        (it) => it.userId == getId,
        orElse: () => ApplicantcekModel(userId: 0, jobId: 0));

    if (cek.userId == getId) {
      aplied = true;
    }
    //if  list.contains(x);
    if (mounted) {
      setState(() {
        // Your state change code goes here
      });
      }
  }
  }

  bool checkStatus() {
    var jobStatus = widget.jobModel.status;
    var dateStatus =
        DateTime.parse(widget.jobModel.dueDate).isBefore(DateTime.now());
    return jobStatus || dateStatus;
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
                      aplied: aplied,
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
                checkStatus()
                    ? const Status(color: Colors.red, status: 'Closed')
                    : Status(color: Styles.primaryColor, status: 'Open'),
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
                  Text(DateFormat('MMM, d yyyy')
                          .format(DateTime.parse(widget.jobModel.dueDate))
                      // timeago.format(DateTime.parse(widget.jobModel.createdAt)),
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
    );
  }
}
