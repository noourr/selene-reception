abstract class CaseRegistrationEvent {}

class AddCaseEvent extends CaseRegistrationEvent {}

class MoveCaseInsideEvent extends CaseRegistrationEvent {
  final String caseName;

  MoveCaseInsideEvent(this.caseName);
}

class SelectDoctorEvent extends CaseRegistrationEvent {
  final String doctorName;

  SelectDoctorEvent(this.doctorName);
}
