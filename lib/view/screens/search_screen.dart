import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../gen/assets.gen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_widget/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 88),
        child: CustomAppBar(
          leadingIcon: GestureDetector(
            onTap: () {
              context.go('/myGiftCards');
            },
            child: Assets.media.icons.chevronLeft.svg(),
          ),
          title: Text(
            "main.search".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: const SearchWidget(),
    );
  }
}
