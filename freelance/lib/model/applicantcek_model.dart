class ApplicantcekModel {
  int userId;
  int jobId;

  ApplicantcekModel({this.userId = 0, this.jobId = 0});

  factory ApplicantcekModel.fromJson(Map<String, dynamic> json) {
    return ApplicantcekModel(
      userId: (json['userId'] != null) ? json['userId'] : 0,
      jobId: (json['jobId'] != null) ? json['jobId'] : 0,
    );
  }
}
