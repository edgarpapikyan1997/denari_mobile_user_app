import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/utils/services/get_it.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/bottom_sheet_type.dart';
import '../../../utils/themes/app_colors.dart';
import '../balance_widget.dart';
import '../custom_button.dart';
import '../rate_widget/rate_widget.dart';
import 'bottom_sheet_upper_piece.dart';
import 'custom_buttom_sheet_moods/congrats_mood.dart';

void customBottomSheet({
  required BuildContext context,
  required BottomSheetType type,
  required String title,
  required String description,
  String? rateText,
  String? tokens,
  String? balance,
  String? asset,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        switch (type) {
          case BottomSheetType.congrats:
            return _buildCongratsBottomSheet(
              context,
              asset,
              title,
              tokens,
              balance,
            );
          case BottomSheetType.alert:
            return _buildAlertBottomSheet(context, asset);
          case BottomSheetType.custom:
            return _buildCustomBottomSheet(context, asset);
          default:
            return Container();
        }
      });
}

Widget _buildCongratsBottomSheet(
  BuildContext context,
  String? asset,
  String? title,
  String? tokens,
  String? balance,
) {
  return CongratsMood(
    asset: asset!,
    title: title,
    tokens: tokens!,
    balance: balance,
  );
}

Widget _buildAlertBottomSheet(BuildContext context, String? asset) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Congratulations!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Widget _buildCustomBottomSheet(BuildContext context, String? asset) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Custom Bottom Sheet',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // if (asset != null) asset,
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
