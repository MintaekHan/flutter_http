import 'users.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers(String authKey) async {
  String url = "http://211.43.15.100/get_employee.php?key=" + authKey;
  final response = await http.get(url);
  return usersFromJson(response.body);
}
