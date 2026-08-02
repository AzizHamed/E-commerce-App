import 'package:equatable/equatable.dart';

class Mycartstates  extends Equatable{

  final double totalPrice;

  const Mycartstates(this.totalPrice);

  @override
  List<Object?> get props => [totalPrice];

}