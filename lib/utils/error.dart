import 'package:flutter/material.dart';
import 'package:nikeshop/utils/exaption.dart';

/// this is for Error when network disconnct
class ErorrButtom extends StatelessWidget {
  final AppExption exption;
  final GestureTapCallback onTap;
  const ErorrButtom({
    super.key,
    required this.exption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(exption.message),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('تلاش محجدد'),
        )
      ],
    );
  }
}
