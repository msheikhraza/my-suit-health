import 'package:razasheikhtest/app_constants/app_constants.dart';
import 'package:razasheikhtest/httpservice/http_service.dart';
import 'package:razasheikhtest/modules/login/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{
  HttpService httpService = HttpService();

  @override
  Future<dynamic> login(body) async {
    final url = '${AppConstants.baseUrl}auth/login';
    var response = await httpService.baseApi(url, 'post', body: body);
    return response;
  }

}