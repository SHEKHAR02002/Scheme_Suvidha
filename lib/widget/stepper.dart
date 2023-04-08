import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int progress;
  const ProgressBar({super.key, required this.progress});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    bool hide = true;

    int currentStep = widget.progress;
    List<Step> getsteps() => [
          Step(
              state: currentStep >= 0 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 0,
              title: const Text("Requested"),
              content: Container()),
          Step(
              state: currentStep >= 1 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 1,
              title: const Text("Under Process"),
              content: Container()),
          Step(
              state: currentStep >= 2 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 2,
              title: const Text("Scheme Applied"),
              content: Container()),
          // Step(
          //     state: currentStep >= 3 ? StepState.complete : StepState.indexed,
          //     isActive: currentStep >= 3,
          //     title: const Text("Rejected"),
          //     content: Container()),
        ];
    return Scaffold(
      body: Stepper(
        elevation: 0,
        physics: const ScrollPhysics(),
        type: StepperType.vertical,
        steps: getsteps(),
        currentStep: currentStep,
        controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: dtl.onStepContinue,
                child: Text(hide == true ? '' : 'NEXT'),
              ),
              TextButton(
                onPressed: dtl.onStepCancel,
                child: Text(hide == true ? '' : 'CANCEL'),
              ),
            ],
          );
        },
        // onStepContinue: () {},
      ),
    );
  }
}
