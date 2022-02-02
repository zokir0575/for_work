

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_work/blocs/create_contracts_state.dart';
import 'package:for_work/model/contracts_model.dart';

import '../services/http_service.dart';

class CreateContractsCubit extends Cubit<CreateContractsState>{
  CreateContractsCubit(): super (CreateContractsInit());

  void apiCreateContract(Contracts contracts)async{
    print(contracts.toJson());
    emit(CreateContractsLoading());
    var result = await Network.POST(Network.API_CREATE, Network.paramsCreate(contracts));
    print(result);
    if(result != null){
      emit(CreateContractsLoaded(isCreated: true));
    } else{
      emit(CreateContractsError(error: "Can not create contact"));
    }
  }
}
