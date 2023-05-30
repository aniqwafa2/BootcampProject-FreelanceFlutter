import 'package:freelance/api/api_myjob.dart';
import 'package:freelance/model/applicant_model.dart';
import 'package:freelance/utils/user_token.dart';
import 'package:http/http.dart' as http;

class MyJobController {
  final ApiMyJob _apiMyJob = ApiMyJob();
  final UserToken _userToken = UserToken();

  Future<List<ApplicantModel>?> getData() async {
    final getId = await _userToken.getUserId();
    http.Response result = await _apiMyJob.getAllMyJob(getId);
    if (result.statusCode == 200) {
      return applicantModelFromJson(result.body);
    } else {
      return null;
    }
  }
}
