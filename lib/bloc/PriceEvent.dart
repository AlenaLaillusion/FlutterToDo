import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PriceEvent extends Equatable {
  const PriceEvent();

  @override
  List<Object> get props => [];
}

class CreateProfile extends PriceEvent {
  const CreateProfile();

  @override
  List<Object> get props => [];
}
