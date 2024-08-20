import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  
  Future<void> saveUserAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
  }

  Future<String?> getUserAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
}
