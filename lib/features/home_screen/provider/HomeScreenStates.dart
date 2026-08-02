import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:equatable/equatable.dart';

class Homescreenstates extends Equatable{

  final String categorySelected;

  final bool isLoading;

  final List<Product> products;
  


  const Homescreenstates(this.categorySelected,this.isLoading,this.products);

  @override
  List<Object?> get props => [categorySelected,isLoading];

}




class ErrorState extends Homescreenstates{
  final String error;
   const ErrorState(this.error) : super( "None",false,const []);
 @override
  List<Object?> get props => [error];

}

