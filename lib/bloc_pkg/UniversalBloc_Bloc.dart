import 'dart:async';
import 'dart:io';
import 'package:assignment/resthandler/ApiClient.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

import 'bloc.dart';


class UniversalBloc extends Bloc<UniversalBlocEvent, UniversalBlocStateAbsClass> {
  @override
  void dispose() {
    super.close();
  }

  @override
  UniversalBlocStateAbsClass get initialState => InitialUniversalBlocState();


  @override
  Stream<UniversalBlocStateAbsClass> mapEventToState(
      UniversalBlocEvent event,
      )

  async* {

    if (event is FetchDataBlocEvt) {
      yield Loading();
      final connected = await checkConnectivity().then((bl){
        return bl;
      });

      if (connected) {
        final user = await ApiClient.apiClient.fetchData();
        if (user != null) {
          yield FetchDataSuccessfullyState(user);
        } else {
          yield UniversalBlocFailed();
        }
      } else {
        yield NoInternet();
      }
    }
  }



  Future<bool> checkConnectivity() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi){
        return true;
      }
      else{
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
