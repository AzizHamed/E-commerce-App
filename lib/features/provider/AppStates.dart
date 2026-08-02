import 'package:ecommerce_app/core/entities/User.dart';
import 'package:equatable/equatable.dart';

class AppStates extends Equatable{

  final User? signedInUser;
  const AppStates(this.signedInUser);

  @override
  List<Object?> get props => [signedInUser];

  
}