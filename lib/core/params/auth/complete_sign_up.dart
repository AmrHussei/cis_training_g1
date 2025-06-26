import 'package:equatable/equatable.dart';

class CompleteSignUpParams extends Equatable {
  final String birthDate;
  final String password;

  const CompleteSignUpParams({
    required this.birthDate,
    required this.password,
  });

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    print(birthDate + password);
    print('CompleteSignUpParams');
    return <String, dynamic>{
      'birthDay': birthDate,
      'password': password,
    };
  }
}
