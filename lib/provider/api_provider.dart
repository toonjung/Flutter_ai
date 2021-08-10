import 'package:http/http.dart' as http;

class APIProvider {
  APIProvider();
  var headders = {
    'content-Type': 'application/json'
        'Connection : keep-alive'
  };
  Future<http.Response> getdata() async {
    String _url = 'https://reqres.in/api/users?page=2';
    return http.get(Uri.parse(_url), headers: headders);
  }
  // Future<http.Response> getdata() async {
  //   return http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  // }
}
