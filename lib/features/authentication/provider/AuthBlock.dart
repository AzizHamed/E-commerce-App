import 'package:ecommerce_app/core/entities/Eye.dart';
import 'package:ecommerce_app/features/authentication/provider/AuthStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authblock extends Cubit<AuthStates>{
  Authblock() : super(AuthStates(false, Eye.visibleEyeOff, Eye.visibleEyeOff));


  void showCircularIndicator() {

    emit(AuthStates(true, state.loginEye,state.signupEye));
  }


  void removeCircularIndicator(){
     emit(AuthStates(false, state.loginEye,state.signupEye));
  }

  void changeLoginEye(){
    if(state.loginEye == Eye.visibleEye){

    emit(AuthStates(state.isLoading,Eye.visibleEyeOff,state.signupEye));
    }
    else{

    emit(AuthStates(state.isLoading,Eye.visibleEye,state.signupEye));
    }
  }

  void changeSignupEye(){
    if(state.signupEye == Eye.visibleEye){

      emit(AuthStates(state.isLoading,state.loginEye,Eye.visibleEyeOff));
    }
    else{

    emit(AuthStates(state.isLoading,state.loginEye,Eye.visibleEye));
    }

  }

}








