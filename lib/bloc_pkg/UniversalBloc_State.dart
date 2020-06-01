import 'package:assignment/models/ResponseModel.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UniversalBlocStateAbsClass {}

class InitialUniversalBlocState extends UniversalBlocStateAbsClass {}

class Loading extends UniversalBlocStateAbsClass {}

class FetchDataSuccessfullyState extends UniversalBlocStateAbsClass {
  final List<ResponseModel> responseModel;

  FetchDataSuccessfullyState(this.responseModel);
}

class UniversalBlocFailed extends UniversalBlocStateAbsClass {}

class NoInternet extends UniversalBlocStateAbsClass {}
