import 'package:flutter/material.dart';

import '../utilities.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final Widget? child;
  final bool isDark;
  final void Function() onTap;
  final String title;
  final Color? color;
  final bool maxWid;

  const PrimaryButton({
    Key? key,
    this.width,
    required this.onTap,
    this.title = '',
    this.height,
    this.child,
    this.isDark = false,
    this.fontSize,
    this.color,
    this.maxWid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              maxWid ? null : const BorderRadius.all(Radius.circular(30)),
          color: isDark
              ? getColors(context).primary
              : color ?? getColors(context).secondary,
          border: Border.all(
            color: isDark ? Colors.white : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 3),
              color: getColors(context).shadow,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onTap,
            child: Container(
              width: maxWid ? maxWidth(context) : width ?? wXD(310, context),
              height: height ?? wXD(67, context),
              alignment: Alignment.center,
              child: child ??
                  Text(
                    title,
                    style: getStyles(context).labelSmall?.copyWith(
                          color: isDark
                              ? getColors(context).onPrimary
                              : getColors(context).primary,
                          fontSize: fontSize ?? 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
