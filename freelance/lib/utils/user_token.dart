import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserToken {
  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    Map<String, dynamic> decoded = Jwt.parseJwt(token!);
    int userId = decoded['id'];

    return userId;
  }

  Future<bool> getTokenExp() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    bool isExpired = Jwt.isExpired(token!);

    return isExpired;
  }

  Future<String> tokenAuth() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    String? type = prefs.getString('type');

    String tokenAuth = '$type $token';

    return tokenAuth;
  }
}
