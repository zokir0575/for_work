
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_work/blocs/list_contracts_state.dart';

import '../services/http_service.dart';

class ListContractsCubit extends Cubit<ListContractsState>{
  ListContractsCubit() : super(ListContractsInit());
  void apiContractsList() async{
    emit(ListContractsLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if(response != null){
      emit(ListContractsLoaded(contracts: Network.parsePostList(response), isDeleted: false, ));
    }else{
      emit(ListContractsError(error: "Can not fetch users" ));
    }
  }
}