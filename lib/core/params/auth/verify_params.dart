import 'package:equatable/equatable.dart';

class VerifyParams extends Equatable {
  final String phoneNumber;
  final String otp;
  final String fcmToken;
  const VerifyParams({
    required this.phoneNumber,
    required this.otp,
    required this.fcmToken,
  });

  @override
  List<Object?> get props => [phoneNumber, otp, fcmToken];

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
      'code': otp,
      'fcmToken': fcmToken,
    };
  }
}
