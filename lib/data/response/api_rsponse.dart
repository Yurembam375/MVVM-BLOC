import '../../utils/enums.dart';

class ApiRsponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiRsponse(this.data, this.status, this.message);
  ApiRsponse.loading() : status = Status.loading;
  ApiRsponse.completed(this.data) : status = Status.completed;
  ApiRsponse.error(this.message) : status = Status.error;
  @override
  String toString() {
    return 'Status:$status\n Message :$message Data :$data';
  }
}

//ApiRsponse<String> name =ApiRsponse('1', Status.loading, 'ss');
