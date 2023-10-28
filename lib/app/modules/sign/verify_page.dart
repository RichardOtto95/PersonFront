import 'package:fluttertoast/fluttertoast.dart';
import 'package:soteria/app/shared/utilities.dart';
import 'package:soteria/app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/custom_pincode_textfield.dart';

class VerifyPage extends StatefulWidget {
  final String phoneNumber;
  const VerifyPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // print('onWillPo verify');
        // if (store.loadOverlay != null) {
        //   if (store.loadOverlay!.mounted) {
        //     return false;
        //   }
        // }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                Image.asset(
                  "./assets/images/logo_dark.png",
                  width: wXD(120, context),
                  height: wXD(150, context),
                ),
                const Spacer(flex: 12),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: wXD(30, context)),
                  width: maxWidth(context),
                  child: CustomPinCodeTextField(controller: _pinCodeController),
                ),
                const Spacer(flex: 5),
                Observer(
                  builder: (context) => 0 != 0
                      ? Text(
                          "Aguarde ${50} segundos para reenviar\num novo código",
                          textAlign: TextAlign.center,
                          style: getStyles(context).bodySmall,
                        )
                      : TextButton(
                          child: Text(
                            'Reenviar o código',
                            style: getStyles(context).bodySmall,
                          ),
                          onPressed: () {
                            // store.resendingSMS(context);
                          },
                        ),
                ),
                const Spacer(flex: 6),
                PrimaryButton(
                  onTap: () {
                    // if (_formKey.currentState!.validate()) {
                    //   FocusScope.of(context)
                    //       .requestFocus(new FocusNode());
                    //   if (phone.length < 11) {
                    //     showToast("Preencha o campo corretamente");
                    //     return;
                    //   }
                    //   if (store.phone == null) {
                    //     store.phone = phone;
                    //   }
                    //   // print('store.resendingSMSSeconds: ${store.getResendingSMSSeconds}');
                    //   print(
                    //       'store.resendingSMSSeconds: ${store.resendingSeconds}');

                    //   // if (store.getResendingSMSSeconds != 0) {
                    //   if (store.resendingSeconds != 0) {
                    //     Fluttertoast.showToast(
                    //       // msg: "Aguarde ${store.getResendingSMSSeconds} segundos para reenviar um novo código",
                    //       msg:
                    //           "Aguarde ${store.resendingSeconds} segundos para reenviar um novo código",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.BOTTOM,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: getColors(context).error,
                    //       textColor: getColors(context).onError,
                    //       fontSize: 16.0,
                    //     );
                    //   } else {
                    //     store.verifyNumber(context);
                    //   }
                    // }
                    Modular.to.pushNamed("/home", arguments: false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Entrar",
                        style: getStyles(context).labelMedium?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(width: wXD(2, context)),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: wXD(18, context),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const Spacer(flex: 10),
              ],
            ),
            Positioned(
              top: viewPaddingTop(context) + wXD(10, context),
              left: wXD(15, context),
              child: IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: wXD(23, context),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       print('onWillPo verify');
  //       if (store.loadOverlay != null) {
  //         if (store.loadOverlay!.mounted) {
  //           return false;
  //         }
  //       }
  //       return true;
  //     },
  //     child: Scaffold(
  //       backgroundColor: getColors(context).background,
  //       body: Stack(
  //         children: [
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Spacer(flex: 6),
  //               Text(
  //                 'Insira o código enviado para o \n número ${phoneMask.maskText(widget.phoneNumber)}',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontSize: 14, height: 1.5),
  //               ),
  //               Spacer(flex: 2),
  //               Container(
  //                 margin: EdgeInsets.symmetric(horizontal: wXD(30, context)),
  //                 width: maxWidth(context),
  //                 child: CustomPinCodeTextField(controller: _pinCodeController),
  //               ),
  //               Spacer(
  //                 flex: 2,
  //               ),
  //               Observer(builder: (context) {
  //                 return store.resendingSeconds != 0
  //                     ? Text(
  //                         "Aguarde ${store.resendingSeconds} segundos para reenviar um novo código",
  //                         style: TextStyle(
  //                           fontSize: 13,
  //                           fontWeight: FontWeight.normal,
  //                         ),
  //                       )
  //                     : TextButton(
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             border: Border(
  //                                 bottom: BorderSide(
  //                                     color: getColors(context).secondary,
  //                                     width: 2)),
  //                           ),
  //                           padding: EdgeInsets.only(bottom: wXD(3, context)),
  //                           child: Text(
  //                             'Reenviar o código',
  //                             style: textFamily(
  //                               context,
  //                               color: getColors(context).onBackground,
  //                               fontWeight: FontWeight.w400,
  //                               fontSize: 15,
  //                             ),
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           store.resendingSMS(context);
  //                         },
  //                       );
  //               }),
  //               Spacer(flex: 2),
  //               PrimaryButton(
  //                 onTap: () async {
  //                   if (_pinCodeController.text.length == 6 &&
  //                       _pinCodeController.text.isNotEmpty) {
  //                     await store.signinPhone(
  //                       _pinCodeController.text,
  //                       // authStore.userVerifyId!,
  //                       context,
  //                     );
  //                   } else {
  //                     Fluttertoast.showToast(
  //                         msg: "Código incompleto!",
  //                         toastLength: Toast.LENGTH_SHORT,
  //                         gravity: ToastGravity.BOTTOM,
  //                         timeInSecForIosWeb: 1,
  //                         backgroundColor: getColors(context).error,
  //                         textColor: getColors(context).onError,
  //                         fontSize: 16.0);
  //                   }
  //                 },
  //                 title: 'Validar',
  //                 height: wXD(52, context),
  //                 width: wXD(142, context),
  //               ),
  //               Spacer(),
  //             ],
  //           ),
  //           DefaultAppBar(
  //             'Código enviado',
  //             onPop: () {
  //               print('onWillPo verify');
  //               if (store.loadOverlay == null) {
  //                 Modular.to.pop();
  //               } else if (!store.loadOverlay!.mounted) {
  //                 Modular.to.pop();
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  showToast(message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
    );
  }
}
