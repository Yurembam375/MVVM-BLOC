class AppException implements Exception {
  final _messsage;
  final _prefix;
  AppException(
    this._messsage,
    this._prefix,
  );
  @override
  String toString() {
    // TODO: implement ==
    return "$_messsage$_prefix";
  }
}

class NoInterntException extends AppException {
  NoInterntException([String? messsage]) : super(messsage, 'No Internet');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? messsage])
      : super(messsage, 'You dont have acess to this');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? messsage])
      : super(messsage, 'Request Timeout');
}

class FetchDataException extends AppException {
  FetchDataException([String? messsage]) : super(messsage, '');
}
