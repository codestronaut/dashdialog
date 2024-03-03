import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import 'ext_colors.dart';
import 'ext_dimens.dart';
import 'ext_misc.dart';
import 'ext_styles.dart';

extension OverlaysX on BuildContext {
  dismissLoadingOverlay() => pop();

  showLoadingOverlay() async {
    await showDialog(
      context: this,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(context.spacingMd),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitFadingCircle(
                      color: context.mindfulGreen,
                      size: context.spacingXlg * 2,
                    ),
                    context.spacingMd.hSpace,
                    Text(
                      l10n.pleaseWaitLabel,
                      style: context.semiBold.copyWith(
                        fontSize: context.spacingMd,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
