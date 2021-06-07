class LoginResponse {
  String status;



  LoginResponse (
      this.status,

      );

//Create the same factory converter, but using another inner factory 'fromJson' converter
//for the inner class object (InnerClass.fromJson(json['inner_class']))

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
        json['status'] as String, // << put your json response keys instead.

    );
  }

}