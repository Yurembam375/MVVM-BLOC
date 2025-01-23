
import 'package:blocwitmvvm/config/model/user/user_model.dart';
import 'package:blocwitmvvm/data/network/network_service_api.dart';
import 'package:blocwitmvvm/repository/auth/login_repo.dart';

class LoginMockApiRepo implements LoginRepo{
  final _api = NetworkServiceApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
await Future.delayed(Duration(seconds: 2));
final response ={
'token':'sjnkjkl'
};
return UserModel.fromJson(response);
  }
}