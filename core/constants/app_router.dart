import 'package:go_router/go_router.dart';

import '../../features/account/presentation/constants/change_data_enum.dart'
    show ChangeData;
import '../../features/account/presentation/screens/account_screen.dart'
    show AccountScreen;
import '../../features/account/presentation/screens/change_data_screen.dart'
    show ChangeDataScreen;
import '../../features/auth/presentation/screens/change_password_screen.dart'
    show ChangePasswordScreen;
import '../../features/auth/presentation/screens/forgotten_password_screen.dart'
    show ForgottenPasswordScreen;
import '../../features/auth/presentation/screens/login_screen.dart'
    show LoginScreen;
import '../../features/base/presentation/screens/categories_screen.dart'
    show CategoriesScreen;
import '../../features/base/presentation/screens/home_screen.dart'
    show HomeScreen;
import '../../features/base/presentation/screens/spend_screen.dart'
    show SpendScreen;
import '../../features/base/presentation/screens/spending_chart_screen.dart'
    show SpendingChartScreen;
import '../../features/base/presentation/screens/spending_screen.dart'
    show SpendingScreen;
import '../../features/util/presentation/screens/onboarding_screen.dart'
    show OnboardingScreen;
import '../../features/auth/presentation/screens/sign_up_screen.dart'
    show SignUpScreen;
import '../../features/auth/presentation/screens/verification_successful_screen.dart'
    show VerificationSuccessfulScreen;
import '../../features/auth/presentation/screens/verify_screen.dart'
    show VerifyScreen;
import '../../features/util/presentation/screens/splash_screen.dart'
    show SplashScreen;
import '../helpers/app_helpers.dart' show AppHelpers;

class AppRouter {
  static final GoRouter _routerConfig = GoRouter(
    initialLocation: SplashScreen.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      AppHelpers.createCustomTransitionRouteExtra(
        path: SplashScreen.routeName,
        screenBuilder: (extra, params) => SplashScreen(),
      ),
      // Auth Screens
      AppHelpers.createCustomTransitionRouteExtra(
        path: SignUpScreen.routeName,
        screenBuilder: (extra, params) => SignUpScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: LoginScreen.routeName,
        screenBuilder: (extra, params) => LoginScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: ForgottenPasswordScreen.routeName,
        screenBuilder: (extra, params) => ForgottenPasswordScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: OnboardingScreen.routeName,
        screenBuilder: (extra, params) => OnboardingScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: VerificationSuccessfulScreen.routeName,
        screenBuilder: (extra, params) => VerificationSuccessfulScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: ChangePasswordScreen.routeName,
        screenBuilder: (extra, params) => ChangePasswordScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: VerifyScreen.routeName,
        screenBuilder: (extra, params) => VerifyScreen(),
      ),
      // Base Screens
      AppHelpers.createCustomTransitionRouteExtra(
        path: HomeScreen.routeName,
        screenBuilder: (extra, params) => HomeScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: SpendingScreen.routeName,
        screenBuilder: (extra, params) => SpendingScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: SpendingChartScreen.routeName,
        screenBuilder: (extra, params) => SpendingChartScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: CategoriesScreen.routeName,
        screenBuilder: (extra, params) => CategoriesScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: SpendScreen.routeName,
        screenBuilder: (extra, params) => SpendScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: AccountScreen.routeName,
        screenBuilder: (extra, params) => AccountScreen(),
      ),
      AppHelpers.createCustomTransitionRouteExtra(
        path: ChangeDataScreen.routeName,
        screenBuilder: (extra, params) => ChangeDataScreen(
          changeData: extra as ChangeData,
        ),
      ),
    ],
  );
  static GoRouter get router => _routerConfig;
}
