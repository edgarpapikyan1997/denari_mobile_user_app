import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/profile/model/profile.dart';
import 'package:denari_app/view/screens/authentication/code/sign_up_code_screen.dart';
import 'package:denari_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:denari_app/view/screens/main_screen/token_balance_screen.dart';
import 'package:denari_app/view/screens/profile/pages/code_page.dart';
import 'package:denari_app/view/screens/profile/pages/profile_page.dart';
import 'package:denari_app/view/screens/send_gift_screen/send_gift_card_screen.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/authentication/model/reset_model.dart';
import '../view/screens/authentication/code/forgot_code_screen.dart';
import '../view/screens/authentication/forgot/forgot_screen.dart';
import '../view/screens/authentication/password/create_password_screen.dart';
import '../view/screens/authentication/sign_in/sign_in_screen.dart';
import '../view/screens/main_screen/main_screen.dart';
import '../view/screens/notification_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/send_gift_screen/send_gift_screen.dart';
import '../view/screens/shop_screen.dart';
import '../view/widgets/scaffold_nav_bar.dart';
import 'listeners/auth_listener.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const MainScreen();
          },
          routes: [
            GoRoute(
              path: 'tokenBalance',
              builder: (BuildContext context, GoRouterState state) {
                return const TokenBalanceScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) {
            return const NotificationScreen();
          },
        ),
        GoRoute(
          path: '/shopScreen',
          builder: (context, state) {
            return const ShopScreen();
          },
        ),
        GoRoute(
          name: Routes.profile,
          path: '/${Routes.profile}',
          builder: (context, state) {
            return const ProfileScreen();
          },
          routes: [
            GoRoute(
              name: Routes.profileData,
              path: Routes.profileData,
              builder: (context, state) => ProfilePage(
                profile: state.extra as Profile,
              ),
              routes: [
                GoRoute(
                  name: Routes.profileCode,
                  path: Routes.code,
                  builder: (context, state) =>
                      ProfileCodePage(model: state.extra as Profile),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
        path: '/sendGift',
        builder: (context, state) {
          return const SendGiftScreen();
        },
        routes: [
          GoRoute(
              name: 'sendGiftCardScreen',
              path: 'sendGiftCardScreen',
              builder: (context, state) {
                BrandItemWidget brandItemWidget =
                    state.extra as BrandItemWidget;
                return SendGiftCardScreen(brandItemWidget: brandItemWidget);
              }),
        ]),
    GoRoute(
      name: Routes.signIn,
      path: '/${Routes.signIn}',
      builder: (context, state) => const SignInScreen(),
      routes: [
        GoRoute(
          name: Routes.forgot,
          path: Routes.forgot,
          builder: (context, state) => const ForgotScreen(),
          routes: [
            GoRoute(
              name: Routes.forgotCode,
              path: Routes.code,
              builder: (context, state) =>
                  ForgotCodeScreen(model: state.extra as ResetModel),
              routes: [
                GoRoute(
                  name: Routes.password,
                  path: Routes.password,
                  builder: (context, state) =>
                      CreatePasswordScreen(model: state.extra as ResetModel),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.signUp,
      path: '/${Routes.signUp}',
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          name: Routes.code,
          path: Routes.code,
          builder: (context, state) =>
              SignUpCodeScreen(model: state.extra as RegModel),
        ),
      ],
    ),
  ],
  refreshListenable: authListener,
  redirect: (context, state) {
    final path = state.uri.path;
    final login = authListener.isLogin;
    if (login &&
        (path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
      return '/';
    }
    if (!login &&
        !(path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
      return '/${Routes.signIn}';
    }
    return null;
  },
);

final class Routes {
  static const signIn = 'sign-in';
  static const signUp = 'sign-up';
  static const forgot = 'forgot';
  static const code = 'code';
  static const forgotCode = 'f-code';
  static const profileCode = 'p-code';
  static const password = 'password';
  static const profile = 'profile';
  static const profileData = 'data';
}
