import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:soteria/app/modules/sign/sign_store.dart';
import 'package:flutter/material.dart';
import 'package:soteria/app/shared/widgets/primary_button.dart';

import '../../shared/utilities.dart';

class SignPage extends StatefulWidget {
  final String title;
  const SignPage({Key? key, this.title = 'SignPage'}) : super(key: key);
  @override
  SignPageState createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  final SignStore store = Modular.get();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

  MaskTextInputFormatter maskFormatterPhone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  String phone = '';
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getOverlayStyleFromColor(getColors(context).secondary),
      child: Listener(
        onPointerDown: (a) => FocusScope.of(context).requestFocus(FocusNode()),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            body: PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 7),
                    Image.asset(
                      "./assets/images/logo_dark.png",
                      width: wXD(120, context),
                      height: wXD(150, context),
                    ),
                    // Image.asset(
                    //   brightness == Brightness.light
                    //       ? "./assets/images/logo.png"
                    //       : "./assets/svg/logo-chamealu-dark.svg",
                    //   width: wXD(173, context),
                    //   height: wXD(153, context),
                    // ),
                    // const Spacer(),
                    // Text(
                    //   'Entrar em sua conta',
                    //   textAlign: TextAlign.center,
                    //   style: textFamily(
                    //     context,
                    //     fontSize: 28,
                    //     color: getColors(context).onBackground,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    Spacer(flex: 10),
                    Text(
                      "Descubra seu\nperfil social.",
                      style: getStyles(context).titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(flex: 10),
                    Container(
                      // height: wXD(62, context),
                      width: wXD(279, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: getColors(context).secondary,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: wXD(20, context),
                            vertical: wXD(13, context)),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            inputFormatters: [maskFormatterPhone],
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Telefone',
                              hintStyle:
                                  getStyles(context).labelSmall?.copyWith(
                                        color: Colors.black.withOpacity(.4),
                                      ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: getStyles(context).labelSmall?.copyWith(
                                  color: Colors.black,
                                ),
                            onChanged: (val) {
                              // print(
                              //     'val: ${maskFormatterPhone.unmaskText(val)} - ${maskFormatterPhone.unmaskText(val).length}');
                              // phone = maskFormatterPhone.unmaskText(val);
                              // store.setPhone(phone);
                            },
                            validator: (value) {
                              if (value != null) {
                                print(
                                    'value validator: $value ${value.length}');
                              }
                              if (value == null || value.isEmpty) {
                                return 'Por favor preenchar o número de telefone';
                              }
                              if (value.length < 15) {
                                return 'Preencha com todos os números';
                              }
                            },
                            onEditingComplete: () {
                              // FocusScope.of(context)
                              //     .requestFocus(new FocusNode());
                              // if (_formKey.currentState!.validate()) {
                              //   if (store.phone == null) {
                              //     store.phone = phone;
                              //   }
                              //   // print('store.start: ${store.getResendingSMSSeconds}');
                              //   print(
                              //       'store.start: ${store.resendingSeconds}');
                              //   // if (store.getResendingSMSSeconds != 60 &&
                              //   //     store.getResendingSMSSeconds != 0) {
                              //   if (store.resendingSeconds != 60 &&
                              //       store.resendingSeconds != 0) {
                              //     Fluttertoast.showToast(
                              //       // msg:"Aguarde ${store.getResendingSMSSeconds} segundos para reenviar um novo código",
                              //       msg:
                              //           "Aguarde ${store.resendingSeconds} segundos para reenviar um novo código",
                              //       toastLength: Toast.LENGTH_SHORT,
                              //       gravity: ToastGravity.BOTTOM,
                              //       timeInSecForIosWeb: 1,
                              //       backgroundColor: Colors.red,
                              //       textColor: Colors.white,
                              //       fontSize: 16.0,
                              //     );
                              //   } else {
                              //     store.verifyNumber(context);
                              //   }
                              // }
                            },
                            controller: _phoneNumberController,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 5),
                    if (1 != 0)
                      const Text(
                        // "Aguarde ${store.getResendingSMSSeconds} segundos para reenviar um novo código",
                        "Aguarde ${55} segundos para reenviar\num novo código",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    Spacer(flex: 5),
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
                        Modular.to.pushNamed("/sign/verify");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Entrar",
                            style: getStyles(context).labelSmall?.copyWith(
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
                    Spacer(flex: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
