import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/sending_amount_state/sending_amount_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/fields/edit_field.dart';

class SendGiftCardScreen extends StatefulWidget {
  final BrandItemWidget brandItemWidget;

  const SendGiftCardScreen({super.key, required this.brandItemWidget});

  @override
  State<SendGiftCardScreen> createState() => _SendGiftCardScreenState();
}

class _SendGiftCardScreenState extends State<SendGiftCardScreen> {
  TextEditingController textEditingController = TextEditingController();
  SendingAmountState sendingAmountState = SendingAmountState();

  @override
  void initState() {
    super.initState();
    sendingAmountState.setCurrentBalance(
        valueFromBalance: widget.brandItemWidget.tokenBalance ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    print('curent balance is >>> ${sendingAmountState.currentBalance}');
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 88),
          child: CustomAppBar(
            leadingIcon: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Assets.media.icons.chevronLeft.svg()),
            title: Text(
              "giftCard.giftCartTokens".tr(),
              style: context.theme.headline4,
            ),
          ),
        ),
        body: PaddingUtility(
          all: 16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'giftCard.selectAmount'.tr(),
                    style: context.theme.body1.lightGreyText,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                widget.brandItemWidget,
                const SizedBox(
                  height: 32,
                ),
                PreviewBanner(
                  leadingBanner: Text(
                    'giftCard.specifyAmount'.tr(),
                    style: context.theme.body4.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Observer(builder: (context) {
                  return EditField(
                    controller: textEditingController,
                    hint: 'giftCard.amount'.tr(),
                    hintStyle: context.theme.body1.lightGreyText,
                    textStyle: context.theme.body1,
                    borderRadius: 12.0,
                    onChanged: (value) {
                      int newValue = int.tryParse(value) ?? 0;
                      sendingAmountState.setSendingAmount(amount: newValue);
                      value = sendingAmountState.sendingAmount.toString();
                    },
                    error: sendingAmountState.isError
                        ? 'Amount is higher than balance'
                        : null,
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    BalanceWidget(
                      textStyle: context.theme.headline4.medium,
                      balance: 20,
                      horizontalPadding: 12,
                      verticalPadding: 6,
                      color: AppColors.whiteGrey,
                      onTap: () {
                        sendingAmountState.setSendingAmount(amount: 20);
                        textEditingController.text =
                            sendingAmountState.sendingAmount.toString();
                      },
                    ),
                    BalanceWidget(
                      textStyle: context.theme.headline4.medium,
                      balance: 30,
                      horizontalPadding: 12,
                      verticalPadding: 6,
                      color: AppColors.whiteGrey,
                      onTap: () {
                        sendingAmountState.setSendingAmount(amount: 30);
                        textEditingController.text =
                            sendingAmountState.sendingAmount.toString();
                      },
                    ),
                    BalanceWidget(
                      textStyle: context.theme.headline4.medium,
                      balance: 40,
                      horizontalPadding: 12,
                      verticalPadding: 6,
                      color: AppColors.whiteGrey,
                      onTap: () {
                        sendingAmountState.setSendingAmount(amount: 40);
                        textEditingController.text =
                            sendingAmountState.sendingAmount.toString();
                      },
                    ),
                    BalanceWidget(
                      textStyle: context.theme.headline4.medium,
                      balance: 50,
                      horizontalPadding: 12,
                      verticalPadding: 6,
                      color: AppColors.whiteGrey,
                      onTap: () {
                        sendingAmountState.setSendingAmount(amount: 50);
                        textEditingController.text =
                            sendingAmountState.sendingAmount.toString();
                      },
                    ),
                  ],
                ),
                const Delimiter(32),
                PreviewBanner(
                  leadingBanner: Text(
                    'giftCard.sendTo'.tr(),
                    style: context.theme.body4.semiBold,
                  ),
                ),
                const Delimiter(16),
                EditField(hint: 'giftCard.phoneOrEmail'.tr())
              ],
            ),
          ),
        ));
  }
}
