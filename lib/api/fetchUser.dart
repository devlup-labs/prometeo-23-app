import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

String email = '';
void fetchUser() async {
  final SharedPreferences prefs = await _prefs;
  email = prefs.getString('email') ?? '';
}

void logout() async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString('email', '');
  email = prefs.getString('email') ?? '';
}

void setUser(String user_email) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString('email', user_email);
  email = prefs.getString('email') ?? '';
}
