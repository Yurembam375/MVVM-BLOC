
import 'package:blocwitmvvm/config/model/user/user_model.dart';
 abstract class LoginRepo {
  Future<UserModel> loginApi(dynamic data);
 
}