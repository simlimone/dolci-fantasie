import 'package:flutter/material.dart';

import 'package:pasticceria/constants/constants.dart';

class MorePageButton extends StatelessWidget {
  final String text;
  final bool primary;
  final void Function()? onPressed;

  const MorePageButton({
    Key? key,
    required this.text,
    this.primary = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: UnconstrainedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: primary
                  ? TextStyles.morePrimaryTitle
                  : TextStyles.moreSecondaryTitle,
            ),
            const SizedBox(
              width: 120,
              child: Divider(
                color: DefaultColors.dividerColor,
                height: 20,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
