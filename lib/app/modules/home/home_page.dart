import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:soteria/app/shared/widgets/primary_button.dart';
import 'dart:math' as math;

import '../../shared/utilities.dart';

class HomePage extends StatefulWidget {
  final bool withResult;

  const HomePage({Key? key, required this.withResult}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  OverlayEntry? signoutOverlay;

  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics();

  final layerLink = LayerLink();

  @override
  void initState() {
    addScrollListener();
    super.initState();
  }

  @override
  void dispose() {
    draggableScrollableController.removeListener(() {});
    draggableScrollableController.dispose();
    super.dispose();
  }

  addScrollListener() {
    draggableScrollableController.addListener(() {
      // print("1# ${draggableScrollableController.pixels}");
      // print("2# ${draggableScrollableController.size}");
      if (draggableScrollableController.size == 1) {
        scrollPhysics = AlwaysScrollableScrollPhysics();
      } else if (draggableScrollableController.size < .3) {
        scrollPhysics = NeverScrollableScrollPhysics();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Listener(
        onPointerDown: (_) {
          if (signoutOverlay != null) {
            signoutOverlay!.remove();
            signoutOverlay = null;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: maxHeight(context),
                width: maxWidth(context),
                child: Column(
                  children: [
                    Spacer(flex: 13),
                    Image.asset(
                      "./assets/images/logo_dark.png",
                      width: wXD(120, context),
                      height: wXD(150, context),
                    ),
                    Spacer(flex: 8),
                    Text(
                      "Bem-Vindo,\nnome.",
                      style: getStyles(context).titleMedium,
                    ),
                    Spacer(flex: 26),
                    if (!widget.withResult)
                      PrimaryButton(
                        title: "Iniciar",
                        onTap: () {
                          Modular.to.pushNamed("/home/rules");
                        },
                      ),
                    if (widget.withResult) ...[
                      PrimaryButton(
                        height: wXD(50, context),
                        width: wXD(368, context),
                        onTap: () {
                          Modular.to.pushNamed(
                            "/quests/results",
                            arguments: true,
                          );
                        },
                        title: "Ver resultado",
                      ),
                      vSpace(wXD(20, context)),
                      PrimaryButton(
                        height: wXD(50, context),
                        width: wXD(368, context),
                        onTap: () {
                          Modular.to.pushNamed(
                            "/quests/results",
                            arguments: true,
                          );
                        },
                        isDark: true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: wXD(20, context)),
                          child: Row(
                            children: [
                              Text(
                                "Refazer teste daqui",
                                style: getStyles(context).labelSmall?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Spacer(),
                              Text(
                                "60 dias",
                                style: getStyles(context).labelSmall?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    Spacer(flex: 60),
                  ],
                ),
              ),
              if (widget.withResult)
                Positioned(
                  top: viewPaddingTop(context) + wXD(10, context),
                  right: wXD(10, context),
                  child: CompositedTransformTarget(
                    link: layerLink,
                    child: IconButton(
                      onPressed: () {
                        getSignoutOverlay();
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              DraggableScrollableSheet(
                initialChildSize: (wXD(190, context) / maxHeight(context)),
                minChildSize: (wXD(190, context) / maxHeight(context)),
                maxChildSize: 1.0,
                expand: true,
                snap: true,
                snapSizes: [
                  (wXD(190, context) / maxHeight(context)),
                  1.0,
                ],
                controller: draggableScrollableController,
                builder: (context, scrollController) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: SizedBox(
                        height: maxHeight(context),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: wXD(10, context),
                                  top: viewPaddingTop(context) +
                                      wXD(10, context)),
                              child: IconButton(
                                onPressed: () {
                                  // print(
                                  //     "scrollController1: ${scrollController.position.maxScrollExtent}");
                                  // print(
                                  //     "90% of height = ${.9 * maxHeight(context)}");
                                  if (draggableScrollableController.size > .9) {
                                    draggableScrollableController.animateTo(
                                        (wXD(190, context) /
                                            maxHeight(context)),
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  } else {
                                    draggableScrollableController.animateTo(1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  }
                                },
                                icon: Transform.rotate(
                                  angle: draggableScrollableController.size > .9
                                      ? math.pi
                                      : 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: getColors(context).secondary,
                                    size: wXD(30, context),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: maxWidth(context),
                              height: maxHeight(context) -
                                  viewPaddingTop(context) -
                                  wXD(73, context),
                              padding: EdgeInsets.symmetric(
                                horizontal: wXD(21, context),
                                vertical: wXD(15, context),
                              ),
                              decoration: BoxDecoration(
                                color: getColors(context).surface,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                physics: scrollPhysics,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (draggableScrollableController.size < .3)
                                      Row(
                                        children: [
                                          Text(
                                            "Sobre o SOTERIA",
                                            style: getStyles(context)
                                                .labelMedium
                                                ?.copyWith(
                                                  color: Colors.black,
                                                ),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            "./assets/images/sologo.png",
                                            height: wXD(50, context),
                                            width: wXD(50, context),
                                          )
                                        ],
                                      ),
                                    Text(
                                      "Definindo o SOTERIA",
                                      style: getStyles(context)
                                          .titleLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    vSpace(wXD(45, context)),
                                    Text(
                                      "Considerada hoje como uma das mais confiáveis ferramentas de avaliação de perfil comportamental disponíveis no mundo.",
                                      style: getStyles(context)
                                          .bodyLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    vSpace(wXD(25, context)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: wXD(25, context),
                                        horizontal: wXD(59, context),
                                      ),
                                      child: Text(
                                        "O APP é uma metodologia que possibilita a análise de ações e comportamentos das pessoas a partir de quatro fatores: Dominância, Influência, Estabilidade, Conformidade.",
                                        style: getStyles(context)
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Colors.black,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    vSpace(wXD(25, context)),
                                    Text(
                                      "A teoria APP, parte do princípio de que nenhum perfil é melhor ou pior, qualquer indivíduo pode se adaptar a um estilo comportamental, porém, isso exigirá esforço e conhecimento acerca de quais são as características que devem ser desenvolvidas, pessoas que realizam atividades alinhadas ao seu perfil tornam-se mais realizadas e ",
                                      style: getStyles(context)
                                          .bodyLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  getSignoutOverlay() {
    signoutOverlay = OverlayEntry(
      builder: (context) => Positioned(
        // height: wXD(33, context),
        width: wXD(150, context),
        child: CompositedTransformFollower(
          offset: Offset(wXD(-120, context), wXD(20, context)),
          link: layerLink,
          child: Container(
            color: Colors.white,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  signoutOverlay?.remove();
                  signoutOverlay = null;
                  Modular.to.pushNamed("/home", arguments: false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: wXD(12, context),
                    vertical: wXD(8, context),
                  ),
                  // height: wXD(33, context),
                  width: wXD(150, context),
                  child: Text(
                    "Sair",
                    style: getStyles(context).labelSmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)?.insert(signoutOverlay!);
  }
}
