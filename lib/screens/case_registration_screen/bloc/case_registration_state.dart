abstract class CaseRegistrationState {}

class CaseState extends CaseRegistrationState {
  final List<String> waitingCases;
  final List<String> insideCases;

  CaseState({
    required this.waitingCases,
    required this.insideCases,
  });
}
