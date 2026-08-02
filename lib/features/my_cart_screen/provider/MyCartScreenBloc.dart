import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mycartscreenbloc extends Cubit<Mycartstates>{
  Mycartscreenbloc() : super(Mycartstates(0));


  void addToTotalPrice(double price){
    emit(Mycartstates(state.totalPrice + price));
  }

  void decrementFromTotalPrice(double price){
     emit(Mycartstates(state.totalPrice - price));
  }

  void setPrice(double price){
     emit(Mycartstates(price));
  }

}