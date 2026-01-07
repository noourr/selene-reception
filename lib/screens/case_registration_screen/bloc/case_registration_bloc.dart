import 'package:flutter_bloc/flutter_bloc.dart';
import 'case_registration_event.dart';
import 'case_registration_state.dart';

class CaseRegistrationBloc
    extends Bloc<CaseRegistrationEvent, CaseRegistrationState> {
  final List<String> _waitingCases = [];
  final List<String> _insideCases = [];

  String _selectedDoctor = 'Dr Ahmed';
  String _selectedRoom = 'Room 1';

  CaseRegistrationBloc()
      : super(
          CaseViewState(
            waitingCases: [],
            insideCases: [],
            selectedDoctor: 'Dr Ahmed',
            selectedRoom: 'Room 1',
          ),
        ) {
    on<AddCaseEvent>((event, emit) {
      _waitingCases.add('Case ${_waitingCases.length + 1}');
      emit(_currentState());
    });

    on<SelectDoctorEvent>((event, emit) {
      _selectedDoctor = event.doctorName;
      emit(_currentState());
    });

    on<SelectRoomEvent>((event, emit) {
      _selectedRoom = event.roomName;
      emit(_currentState());
    });

    on<MoveCaseInsideEvent>((event, emit) {
      _waitingCases.remove(event.caseName);
      _insideCases.add(
        '$_selectedRoom | ${event.caseName} - $_selectedDoctor',
      );
      emit(_currentState());
    });
  }

  CaseViewState _currentState() {
    return CaseViewState(
      waitingCases: List.from(_waitingCases),
      insideCases: List.from(_insideCases),
      selectedDoctor: _selectedDoctor,
      selectedRoom: _selectedRoom,
    );
  }
}
