import 'package:flutter_bloc/flutter_bloc.dart';
import 'case_registration_event.dart';
import 'case_registration_state.dart';

class CaseRegistrationBloc
    extends Bloc<CaseRegistrationEvent, CaseRegistrationState> {
  final List<String> _waitingCases = [];
  final List<String> _insideCases = [];

  CaseRegistrationBloc()
      : super(CaseState(waitingCases: [], insideCases: [])) {
    on<RegisterCasePressed>((event, emit) {
      _waitingCases.add('Case ${_waitingCases.length + 1}');
      emit(CaseState(
        waitingCases: List.from(_waitingCases),
        insideCases: List.from(_insideCases),
      ));
    });

    on<EnterSessionPressed>((event, emit) {
      _waitingCases.remove(event.caseName);
      _insideCases.add(event.caseName);

      emit(CaseState(
        waitingCases: List.from(_waitingCases),
        insideCases: List.from(_insideCases),
      ));
    });
  }
}
