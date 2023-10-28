import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/shared/utilities.dart';
import 'package:soteria/app/shared/widgets/primary_button.dart';

class QuestPage extends StatefulWidget {
  const QuestPage({Key? key}) : super(key: key);

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  List<String> words = [
    "Solitário",
    "Intolerante",
    "Mau ouvinte",
    "Equilibrado",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: maxWidth(context),
              height: maxHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Ordene"),
                  Container(
                    width: wXD(393, context),
                    height: wXD(461, context),
                    padding: EdgeInsets.symmetric(
                      vertical: wXD(25, context),
                      horizontal: wXD(12, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff2e2e2e),
                    ),
                    child: ReorderableListView(
                      physics: NeverScrollableScrollPhysics(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }

                          final item = words.removeAt(oldIndex);

                          words.insert(newIndex, item);
                        });
                      },
                      children: [
                        for (String word in words)
                          QuestTile(
                            title: word,
                            index: words.indexOf(word),
                            key: ValueKey(word),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    "1/26",
                    style: getStyles(context)
                        .bodySmall
                        ?.copyWith(color: Color(0xff8e8e8e)),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: PrimaryButton(
                title: "Próxima",
                onTap: () {
                  Modular.to.pushNamed("/quests/calculating");
                },
                maxWid: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestTile extends StatelessWidget {
  final String title;
  final int index;
  const QuestTile({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == 3 ? 0 : wXD(25, context)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: wXD(84, context),
            width: wXD(368, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: getStyles(context).labelSmall,
            ),
          ),
          Positioned(
            right: wXD(24, context),
            child: const DgragIndicator(),
            // child: Icon(
            //   Icons.drag_indicator_outlined,
            //   size: wXD(40, context),
            //   color: Color(0xff707070),
            // ),
          )
        ],
      ),
    );
  }
}

class DgragIndicator extends StatelessWidget {
  const DgragIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
            vSpace(wXD(2, context)),
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
            vSpace(wXD(2, context)),
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        hSpace(wXD(3, context)),
        Column(
          children: [
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
            vSpace(wXD(2, context)),
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
            vSpace(wXD(2, context)),
            Container(
              height: wXD(9, context),
              width: wXD(9, context),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff707070)),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
