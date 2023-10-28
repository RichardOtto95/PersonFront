import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utilities.dart';
import '../../../shared/widgets/primary_button.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: maxHeight(context),
            width: maxWidth(context),
            padding: EdgeInsets.symmetric(horizontal: wXD(42, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 13),
                Center(
                  child: Image.asset(
                    "./assets/images/logo_dark.png",
                    width: wXD(120, context),
                  ),
                ),
                Spacer(flex: 9),
                Text(
                  "Regras",
                  style: getStyles(context).titleMedium,
                ),
                Spacer(flex: 4),
                Text(
                  "As palavras devem ser ordenadas conforme a sua familiaridade com elas\n\nAssim que o teste for iniciado não poderá ser interrompido.",
                  style: getStyles(context).bodySmall,
                ),
                Spacer(flex: 54),
                PrimaryButton(
                  title: "Iniciar",
                  onTap: () {
                    Modular.to.pushNamed("/quests");
                  },
                ),
                Spacer(flex: 13),
              ],
            ),
          ),
          Positioned(
            top: viewPaddingTop(context) + wXD(10, context),
            left: wXD(10, context),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                size: wXD(30, context),
                color: Colors.white,
              ),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
