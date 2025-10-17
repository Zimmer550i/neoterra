import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';
import 'package:neoterra/utils/app_texts.dart';

void showConfirmation({
  required String title,
  required String description,
  required String confirmText,
  required String cancelText,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          border: Border(top: BorderSide(color: AppColors.gray.shade400)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Text(title, style: AppTexts.txlb),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: AppTexts.tsmm.copyWith(color: AppColors.secondaryText),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        child: Center(
                          child: Text(confirmText, style: AppTexts.tmdr),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          onCancel();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.coral),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Center(
                            child: Text(
                              cancelText,
                              style: AppTexts.tmds.copyWith(
                                color: AppColors.coral,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
