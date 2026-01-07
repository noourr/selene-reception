abstract class CaseRegistrationEvent {}

class RegisterCasePressed extends CaseRegistrationEvent {}

class EnterSessionPressed extends CaseRegistrationEvent {
  final String caseName;

  EnterSessionPressed(this.caseName);
}
