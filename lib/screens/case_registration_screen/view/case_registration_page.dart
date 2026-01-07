import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/case_registration_bloc.dart';
import '../bloc/case_registration_event.dart';
import '../bloc/case_registration_state.dart';

class CaseRegistrationPage extends StatelessWidget {
  const CaseRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CaseRegistrationBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Selene Reception')),
        body: BlocBuilder<CaseRegistrationBloc, CaseRegistrationState>(
          builder: (context, state) {
            if (state is CaseViewState) {
              return Row(
                children: [
                  // ===== Waiting =====
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Waiting',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Doctor selector
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: state.selectedDoctor,
                            items: const [
                              DropdownMenuItem(
                                value: 'Dr Ahmed',
                                child: Text('Dr Ahmed'),
                              ),
                              DropdownMenuItem(
                                value: 'Dr Sara',
                                child: Text('Dr Sara'),
                              ),
                              DropdownMenuItem(
                                value: 'Dr Omar',
                                child: Text('Dr Omar'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CaseRegistrationBloc>().add(
                                  SelectDoctorEvent(value),
                                );
                              }
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: state.selectedRoom,
                            items: const [
                              DropdownMenuItem(
                                value: 'Room 1',
                                child: Text('Room 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Room 2',
                                child: Text('Room 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Room 3',
                                child: Text('Room 3'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CaseRegistrationBloc>().add(
                                  SelectRoomEvent(value),
                                );
                              }
                            },
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            context.read<CaseRegistrationBloc>().add(
                              AddCaseEvent(),
                            );
                          },
                          child: const Text('Register Case'),
                        ),

                        Expanded(
                          child: ListView.builder(
                            itemCount: state.waitingCases.length,
                            itemBuilder: (context, index) {
                              final caseName = state.waitingCases[index];
                              return ListTile(
                                title: Text(caseName),
                                trailing: IconButton(
                                  icon: const Icon(Icons.login),
                                  onPressed: () {
                                    context.read<CaseRegistrationBloc>().add(
                                      MoveCaseInsideEvent(caseName),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const VerticalDivider(),

                  // ===== Inside =====
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Inside',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.insideCases.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(Icons.meeting_room),
                                title: Text(state.insideCases[index]),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    context.read<CaseRegistrationBloc>().add(
                                      FinishCaseEvent(state.insideCases[index]),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(),

                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Finished',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.finishedCases.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(Icons.done_all),
                                title: Text(state.finishedCases[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
