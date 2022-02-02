import 'package:equatable/equatable.dart';
import 'package:for_work/model/contracts_model.dart';

abstract class ListContractsState extends Equatable{
  @override
  List<Object> get props =>  [];
}

class ListContractsInit extends ListContractsState{}

class ListContractsLoading extends ListContractsState{}

class ListContractsLoaded extends ListContractsState{
late  final List<Contracts> contracts;
  late final bool isDeleted;
  ListContractsLoaded({required this.contracts, required this.isDeleted});
}

class ListContractsError extends ListContractsState{
  final error;
  ListContractsError({this.error});
}