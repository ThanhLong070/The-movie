class RequestToken {
  RequestToken.fromJson(Map<String, dynamic> json)
      : requestToken = json['requestToken'],
        expiresAt = json['expiresAt'],
        success = json['success'];

  String? requestToken, expiresAt;
  bool? success;

  RequestToken({this.requestToken, this.expiresAt, this.success});
}
