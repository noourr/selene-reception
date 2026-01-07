abstract class CaseRegistrationState {}

class CaseViewState extends CaseRegistrationState {
  final List<String> waitingCases;
  final List<String> insideCases;
  final String selectedDoctor;

  CaseViewState({
    required this.waitingCases,
    required this.insideCases,
    required this.selectedDoctor,
  });
}
