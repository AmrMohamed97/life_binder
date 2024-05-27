abstract class SearchStates {}
class InitialSearchState extends SearchStates {}
class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{}
class SearchSuccessWithoutDataState extends SearchStates{}
class SearchErrorState extends SearchStates{
  SearchErrorState({required this.error});
  final dynamic error;
}

class AssignControllerValueState extends SearchStates{}
