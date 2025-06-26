import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String phoneNumber;
  final String newPassword;
  const ResetPasswordParams({
    required this.phoneNumber,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        newPassword,
      ];
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
      'newPassword': newPassword,
    };
  }
}
