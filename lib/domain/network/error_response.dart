/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]

class ErrorResponse {
  List<Errors>? _errors;

  List<Errors> get errors => _errors ?? [];

  ErrorResponse({List<Errors> errors = const []}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      _errors = [];
      json["errors"].forEach((v) {
        _errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// code : "l_name"
/// message : "The last name field is required."

class Errors {
  String? code;
  String? message;

  Errors({
    required String code,
    required String message,
  });

  Errors.fromJson(dynamic json) {
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    return map;
  }
}
