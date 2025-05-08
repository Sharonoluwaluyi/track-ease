import 'package:http/http.dart' as http;

abstract class DataState implements Exception {
  final int status;
  final String message;
  DataState(this.status, this.message);

  @override
  String toString() {
    return "Something went wrong. Please try again later";
  }

  static String getErrorMessage(http.Response response, {String? msg}) {
    switch (response.statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 405:
        return 'Method Not Allowed';
      case 408:
        return 'Request Timeout';
      case 409:
        return 'Conflict';
      case 413:
        return 'Payload Too Large';
      case 415:
        return 'Unsupported Media Type';
      case 429:
        return 'Too Many Requests';
      case 500:
        return 'Internal Server Error';
      case 501:
        return 'Not Implemented';
      case 502:
        return 'Bad Gateway';
      case 503:
        return 'Service Unavailable';
      case 504:
        return 'Gateway Timeout';
      default:
        return 'Something went wrong, please try again later';
    }
  }
}

class DataFailure extends DataState {
  DataFailure(super.status, super.message);
  @override
  String toString() {
    return message;
  }
}

class NetworkFailure extends DataFailure {
  NetworkFailure(super.status, super.message);
  @override
  String toString() {
    return message;
  }
}
