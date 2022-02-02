
import 'package:equatable/equatable.dart';

abstract class CreateContractsState extends Equatable{
  @override
  List<Object> get props =>  [];
}

class CreateContractsInit extends CreateContractsState{}

class CreateContractsLoading extends CreateContractsState{}

class CreateContractsLoaded extends CreateContractsState{
  final bool isCreated;

  CreateContractsLoaded({required this.isCreated});
}

class CreateContractsError extends CreateContractsState{
  final error;
  CreateContractsError({this.error});
}