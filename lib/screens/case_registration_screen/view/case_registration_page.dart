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
        appBar: AppBar(
          title: const Text('Selene Reception'),
        ),
        body: BlocBuilder<CaseRegistrationBloc, CaseRegistrationState>(
          builder: (context, state) {
            if (state is CaseState) {
              return Row(
                children: [
                  // Waiting List
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Waiting',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<CaseRegistrationBloc>()
                                .add(RegisterCasePressed());
                          },
                          child: const Text('Register Case'),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.waitingCases.length,
                            itemBuilder: (context, index) {
                              final caseName =
                                  state.waitingCases[index];
                              return ListTile(
                                title: Text(caseName),
                                trailing: IconButton(
                                  icon: const Icon(Icons.login),
                                  onPressed: () {
                                    context
                                        .read<CaseRegistrationBloc>()
                                        .add(
                                          EnterSessionPressed(caseName),
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

                  // Inside Session
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Inside',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.insideCases.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading:
                                    const Icon(Icons.meeting_room),
                                title: Text(state.insideCases[index]),
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
