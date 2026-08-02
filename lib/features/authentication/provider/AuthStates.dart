import 'package:ecommerce_app/core/entities/Eye.dart';
import 'package:equatable/equatable.dart';

class AuthStates extends Equatable{

    final bool isLoading;
    final Eye loginEye;
    final Eye signupEye;



  const AuthStates(this.isLoading,this.loginEye,this.signupEye);

  @override
  List<Object> get props => [isLoading,loginEye,signupEye];
}





