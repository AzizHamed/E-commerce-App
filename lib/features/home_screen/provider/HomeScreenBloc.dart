import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/core/services/HomeScreenService.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreenbloc extends Cubit<Homescreenstates>{
  Homescreenbloc() : super(Homescreenstates("All", false, const [])) {
    getAllProducts(); 
  }



  

  Future<void> getAllProducts()async{
     try {
      emit(Homescreenstates("All", true, const []));

    final products = await sl<Homescreenservice>().getAllProducts();

    emit(Homescreenstates("All", false, products));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void getProductsByCategory(String category)async{

    try{
      emit(Homescreenstates(category, true, const []));
          final products = await sl<Homescreenservice>().getCategoryProducts(category);

      emit(Homescreenstates(
       category,
       false,
       products
    ));
    }catch(e){
      emit(ErrorState(e.toString()));
    }


  }


  void getProductsBorder(String category){
    if(state.categorySelected == category){
      getAllProducts();
    }

    else{
      getProductsByCategory(category);
    }
  }


  void filterProducts(String str){
    
    emit(Homescreenstates(state.categorySelected, true, state.products));

    
    List<Product> ls = state.products.where((product)=>product.title.toLowerCase().contains(str.toLowerCase())).toList();
    emit(Homescreenstates(state.categorySelected, false, ls));
  }


}