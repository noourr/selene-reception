abstract class CaseRegistrationState {}

class CaseViewState extends CaseRegistrationState {
  final List<String> waitingCases;
  final List<String> insideCases;
  final List<String> finishedCases;
  final String selectedDoctor;
  final String selectedRoom;

  CaseViewState({
    required this.waitingCases,
    required this.insideCases,
    required this.finishedCases,
    required this.selectedDoctor,
    required this.selectedRoom,
  });
}
