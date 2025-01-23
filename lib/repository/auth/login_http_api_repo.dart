import 'package:blocwitmvvm/config/app_url.dart';
import 'package:blocwitmvvm/config/model/user/user_model.dart';
import 'package:blocwitmvvm/data/network/network_service_api.dart';
import 'package:blocwitmvvm/repository/auth/login_repo.dart';

class LoginHttpApiRepo implements LoginRepo{
  final _api = NetworkServiceApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
final response = await _api.postApi(AppUrl.loginApi, data);
return UserModel.fromJson(response);
  }
}