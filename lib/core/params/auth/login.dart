import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String phoneNumber;
  final String password;

  const LoginParams({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, password];
  String get sanitizedPhoneNumber {
    if (phoneNumber.startsWith('+966')) {
      return phoneNumber.replaceFirst('+966', '');
    }
    if (phoneNumber.startsWith('0')) {
      return phoneNumber.replaceFirst('0', '');
    }
    return phoneNumber;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNumber': {
        "number": sanitizedPhoneNumber,
        "key": "+966",
      },
      'password': password,
    };
  }
}
