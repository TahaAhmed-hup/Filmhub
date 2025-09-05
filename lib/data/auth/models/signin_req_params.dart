class SigninReqParams {
  final String email;
  final String password;

  const SigninReqParams({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
