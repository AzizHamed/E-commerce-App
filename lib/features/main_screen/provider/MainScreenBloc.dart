import 'package:ecommerce_app/features/main_screen/provider/MainScreenState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Cubit<MainScreenState>{
   MainScreenBloc() : super(MainScreenState(0));


   void selectBottomBarItem(int indx){
    emit(MainScreenState(indx));
   }

   

}