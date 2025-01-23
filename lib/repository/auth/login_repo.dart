
import 'package:blocwitmvvm/config/model/user/user_model.dart';
import 'package:blocwitmvvm/data/network/network_service_api.dart';

 abstract class LoginRepo {
  final _api = NetworkServiceApi();
  Future<UserModel> loginApi(dynamic data);
 
}