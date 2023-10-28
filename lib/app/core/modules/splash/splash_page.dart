import 'package:flutter_modular/flutter_modular.dart';
import 'package:soteria/app/core/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:soteria/app/shared/utilities.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Modular.to.pushReplacementNamed('/sign/');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          brightness == Brightness.dark ? Colors.black : Colors.white,
      body: Center(
        child: Image.asset(
          brightness == Brightness.dark
              ? "./assets/images/logo_dark.png"
              : "./assets/images/logo.png",
          width: wXD(129, context),
          height: wXD(176, context),
        ),
      ),
    );
  }
}
