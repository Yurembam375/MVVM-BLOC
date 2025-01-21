import 'package:blocwitmvvm/config/app_url.dart';
import 'package:blocwitmvvm/config/model/user/user_model.dart';
import 'package:blocwitmvvm/data/network/network_service_api.dart';

class LoginRepo {
  final _api = NetworkServiceApi();
  Future<UserModel> loginApi(dynamic data) async {
final response = await _api.postApi(AppUrl.loginApi, data);
return UserModel.fromJson(response);
  }
}