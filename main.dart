import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_router.dart' show AppRouter;
import 'core/constants/app_theme.dart' show AppTheme;
// import 'core/helpers/backend_service.dart' show BackendService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // BackendService.instance.sessionManager.initialize();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ToastificationWrapper(
        child: MaterialApp.router(
          title: 'Track Ease',
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
