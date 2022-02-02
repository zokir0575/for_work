
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_work/blocs/list_information_state.dart';

import '../services/http_service.dart';

class ListInformationCubit extends Cubit<ListInformationState>{
  ListInformationCubit() : super(ListInformationInit());
  void apiInformationList() async{
    emit(ListInformationLoading());
    final response = await Network.GET(Network.API_INFORMATION, Network.paramsEmpty());
    print(response);
    if(response != null){
      emit(ListInformationLoaded(information: Network.parseInformationList(response), isDeleted: false, ));
    }else{
      emit(ListInformationError(error: "Can not fetch users" ));
    }
  }
}