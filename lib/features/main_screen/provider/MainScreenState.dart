import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable{

  final int indx;

  const MainScreenState(this.indx);
  
  @override
  List<Object> get props => [indx];


  

  
}