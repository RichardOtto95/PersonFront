import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/shared/widgets/primary_button.dart';

import '../../../shared/utilities.dart';

class ResultsPage extends StatefulWidget {
  final bool concluded;
  const ResultsPage({Key? key, required this.concluded}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<bool> viewAll = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.concluded,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: wXD(25, context)),
              child: SizedBox(
                width: maxWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpace(wXD(50, context)),
                    Center(
                      child: Image.asset(
                        "./assets/images/logo_dark.png",
                        width: wXD(120, context),
                        height: wXD(150, context),
                      ),
                    ),
                    vSpace(wXD(10, context)),
                    Text("Resultados", style: getStyles(context).titleMedium),
                    vSpace(wXD(35, context)),
                    Result(
                      blue: true,
                      onTap: () {
                        if (viewAll[0]) {
                          viewAll[0] = false;
                        } else {
                          if (viewAll.indexOf(true) != -1) {
                            viewAll[viewAll.indexOf(true)] = false;
                          }
                          viewAll[0] = true;
                        }
                        setState(() {});
                      },
                      label: "Estabilidade",
                      percentage: "31%",
                      description:
                          "Você é uma pessoa orientada à colaboração e a manter o equilíbrio em um ambiente seguro",
                      viewAll: viewAll[0],
                    ),
                    Result(
                      onTap: () {
                        if (viewAll[1]) {
                          viewAll[1] = false;
                        } else {
                          if (viewAll.indexOf(true) != -1) {
                            viewAll[viewAll.indexOf(true)] = false;
                          }
                          viewAll[1] = true;
                        }
                        setState(() {});
                      },
                      label: "Influência",
                      percentage: "31%",
                      description:
                          "Você é uma pessoa orientada à colaboração e a manter o equilíbrio em um ambiente seguro",
                      viewAll: viewAll[1],
                    ),
                    Result(
                      red: true,
                      onTap: () {
                        if (viewAll[2]) {
                          viewAll[2] = false;
                        } else {
                          if (viewAll.indexOf(true) != -1) {
                            viewAll[viewAll.indexOf(true)] = false;
                          }
                          viewAll[2] = true;
                        }
                        setState(() {});
                      },
                      label: "Dominância",
                      percentage: "31%",
                      description:
                          "Você é uma pessoa orientada à ação, rápida solução de problemas, tomada de decisões e assumir riscos.",
                      viewAll: viewAll[2],
                    ),
                    Result(
                      onTap: () {
                        if (viewAll[3]) {
                          viewAll[3] = false;
                        } else {
                          if (viewAll.indexOf(true) != -1) {
                            viewAll[viewAll.indexOf(true)] = false;
                          }
                          viewAll[3] = true;
                        }
                        setState(() {});
                      },
                      label: "Conformidade",
                      percentage: "31%",
                      description:
                          "Você é uma pessoa orientada à colaboração e a manter o equilíbrio em um ambiente seguro",
                      viewAll: viewAll[3],
                    ),
                    if (!widget.concluded) ...[
                      PrimaryButton(
                        height: wXD(50, context),
                        width: wXD(368, context),
                        onTap: () {
                          Modular.to.pushNamed("/home", arguments: true);
                        },
                        title: "Concluir teste",
                      ),
                      vSpace(wXD(20, context)),
                      PrimaryButton(
                        height: wXD(50, context),
                        width: wXD(368, context),
                        onTap: () {
                          Modular.to.pushNamed("/home", arguments: true);
                        },
                        isDark: true,
                        title: "Enviar para meu e-mail",
                      ),
                    ]
                  ],
                ),
              ),
            ),
            if (widget.concluded)
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
      ),
    );
  }
}

class Result extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final String percentage;
  final String description;
  final bool viewAll;
  final bool red;
  final bool blue;

  const Result({
    Key? key,
    required this.label,
    required this.percentage,
    required this.description,
    required this.viewAll,
    this.red = false,
    this.blue = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(bottom: wXD(25, context)),
        decoration:
            BoxDecoration(color: blue ? Color(0xff2EDBFF) : Color(0xff2d2d2d)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: wXD(350, context),
              margin: EdgeInsets.symmetric(
                horizontal: wXD(14, context),
                vertical: wXD(15, context),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        label,
                        style: getStyles(context).labelMedium?.copyWith(
                              color: red ? Color(0xffB80000) : Colors.white,
                            ),
                      ),
                      Spacer(),
                      Text(
                        percentage,
                        style: getStyles(context).labelMedium?.copyWith(
                              color: red ? Color(0xffB80000) : Colors.white,
                            ),
                      ),
                    ],
                  ),
                  if (viewAll)
                    Padding(
                      padding: EdgeInsets.only(top: wXD(20, context)),
                      child: Text(
                        description,
                        style: getStyles(context).displayMedium,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
