import 'package:equatable/equatable.dart';
import 'package:for_work/model/information_model.dart';

abstract class ListInformationState extends Equatable{
  @override
  List<Object> get props =>  [];
}

class ListInformationInit extends ListInformationState{}

class ListInformationLoading extends ListInformationState{}

class ListInformationLoaded extends ListInformationState{
  late  final List<Information> information;
  late final bool isDeleted;
  ListInformationLoaded({required this.information, required this.isDeleted});
}

class ListInformationError extends ListInformationState{
  final error;
  ListInformationError({this.error});
}