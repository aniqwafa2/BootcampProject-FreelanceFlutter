import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:freelance/model/job_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../utils/app_styles.dart';
import '../home_detail.dart';

class HomeJobItem extends StatelessWidget {
  final JobModel jobModel;
  const HomeJobItem(this.jobModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: cardBorder),
        child: InkWell(
          borderRadius: cardBorder,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeDetail()));
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 12),
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
                        jobModel.name,
                        style: Styles.headLineStyle3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(jobModel.category),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 16,
                            color: (jobModel.status)
                                ? Colors.red
                                : Styles.primaryColor,
                          ),
                          (jobModel.status)
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
                        const Text(
                          'N applicant',
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
                          "${timeago.format(DateTime.parse("${jobModel.createdAt}"))}",
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
                        const Text(
                          'Rp. 5.000.000',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
