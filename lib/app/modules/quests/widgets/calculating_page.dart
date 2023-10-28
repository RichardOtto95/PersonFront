import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math' as math;

import '../../../shared/utilities.dart';

class CalculatingPage extends StatefulWidget {
  const CalculatingPage({Key? key}) : super(key: key);

  @override
  State<CalculatingPage> createState() => _CalculatingPageState();
}

class _CalculatingPageState extends State<CalculatingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.forward();
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      Modular.to.pushNamed("/quests/results", arguments: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.clearListeners();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          width: maxWidth(context),
          height: maxHeight(context),
          child: Column(
            children: [
              const Spacer(flex: 17),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * (2 * math.pi),
                    child: Image.asset(
                      "./assets/images/sologo.png",
                      height: wXD(80, context),
                      width: wXD(80, context),
                    ),
                  );
                },
              ),
              const Spacer(flex: 10),
              Text(
                "Calculando\nresultados...",
                textAlign: TextAlign.center,
                style: getStyles(context).titleMedium?.copyWith(height: 1.2),
              ),
              const Spacer(flex: 42),
            ],
          ),
        ),
      ),
    );
  }
}
