import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../account/presentation/screens/account_screen.dart'
    show AccountScreen;
import '../constants/app_categories.dart' show AppCategories;
import '../widgets/balance_widget.dart' show BalanceWidget;
import '../widgets/drawer_icon_button.dart' show DrawerIconButton;
import '../widgets/spending_widget.dart' show SpendingWidget;
import 'categories_screen.dart' show CategoriesScreen;
import 'spending_screen.dart' show SpendingScreen;

class HomeScreen extends HookConsumerWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          spacing: 10.r,
          children: <Widget>[
            InkWell(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                AppAssets.user,
                width: 30.r,
                height: 30.r,
              ),
            ),
            Text(
              'Hi Sharon',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: .1.sh),
                  Row(
                    spacing: 10.r,
                    children: <Widget>[
                      Image.asset(
                        AppAssets.user,
                        width: 30.r,
                        height: 30.r,
                      ),
                      Text(
                        'Hi Sharon',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: .1.sh),
                  Column(
                    spacing: 20.r,
                    children: <Widget>[
                      DrawerIconButton(
                        icon: AppAssets.profileCircle,
                        name: 'My Account',
                        onTap: () {
                          scaffoldKey.currentState?.closeDrawer();
                          AppHelpers.goNamed(
                              routeName: AccountScreen.routeName,
                              context: context);
                        },
                      ),
                      DrawerIconButton(
                        icon: AppAssets.spending,
                        width: 18.r,
                        height: 18.r,
                        name: 'Spending',
                        onTap: () {
                          scaffoldKey.currentState?.closeDrawer();
                          AppHelpers.goNamed(
                              routeName: SpendingScreen.routeName,
                              context: context);
                        },
                      ),
                      DrawerIconButton(
                        icon: AppAssets.chart,
                        width: 18.r,
                        height: 19.r,
                        name: 'Categories',
                        onTap: () {
                          scaffoldKey.currentState?.closeDrawer();
                          AppHelpers.goNamed(
                              routeName: CategoriesScreen.routeName,
                              context: context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              BottomAppBar(
                elevation: 0,
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Divider(),
                    DrawerIconButton(
                        icon: AppAssets.logout, name: 'Log Out', onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: [
          SizedBox(height: 10.h),
          Text(
            'Balance',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            spacing: 10.r,
            children: <Widget>[
              Expanded(
                child: BalanceWidget(
                  balance: '-£2740',
                  message: 'Spent this month',
                ),
              ),
              Expanded(
                child: BalanceWidget(
                  balance: '£2000',
                  message: 'Personal Balance',
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Spending',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: <Widget>[
                SpendingWidget(
                    category: AppCategories.general,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.eatingOut,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.transport,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.transport,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.groceries,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.eatingOut,
                    amount: '-£100',
                    action: 'spent'),
                SpendingWidget(
                    category: AppCategories.transport,
                    amount: '-£100',
                    action: 'spent'),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      AppHelpers.goNamed(
                          routeName: SpendingScreen.routeName,
                          context: context);
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
