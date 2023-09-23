class ErrorResponse {
  String? data;
  String? error;
  List<dynamic>? stackTrace;
  int? statusCode;

  ErrorResponse({this.data, this.error, this.statusCode, this.stackTrace});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'];
    error = json['error'];
    stackTrace = json['stackTrace'] == null
        ? null
        : List.castFrom<dynamic, String>(json['stacktrance']);
  }

  @override
  String toString() {
    return 'statusCode: $statusCode, '
        '\ndata: $data, '
        '\nerror: $error, '
        '\nstacktrace: $stackTrace';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['data'] = this.data;
    data['error'] = error;
    data['stacktrance'] = stackTrace;
    return data;
  }
}
