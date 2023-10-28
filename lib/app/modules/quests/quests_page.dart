import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../shared/utilities.dart';
import '../../shared/widgets/primary_button.dart';

class QuestsPage extends StatefulWidget {
  const QuestsPage({Key? key}) : super(key: key);

  @override
  State<QuestsPage> createState() => _QuestsPageState();
}

class _QuestsPageState extends State<QuestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: maxHeight(context),
            width: maxWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(wXD(65, context)),
                Center(
                  child: Image.asset(
                    "./assets/images/logo_dark.png",
                    width: wXD(120, context),
                  ),
                ),
                vSpace(wXD(50, context)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: wXD(42, context)),
                  child: Text(
                    "Através das seguintes palavras, ordene de acordo com o que você mais se identifica",
                    style:
                        getStyles(context).titleSmall?.copyWith(fontSize: 35),
                  ),
                ),
                Spacer(),
                PrimaryButton(
                  maxWid: true,
                  title: "Iniciar",
                  onTap: () {
                    Modular.to.pushNamed("/quests/quest");
                  },
                ),
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
