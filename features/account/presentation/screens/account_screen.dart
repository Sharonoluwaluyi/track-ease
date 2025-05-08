import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import 'tabs/personal_information.dart' show PersonalInformation;
import 'tabs/security.dart' show Security;
import 'widgets/delete_account_widget.dart' show DeleteAccountBottomSheet;

class AccountScreen extends HookConsumerWidget {
  static const routeName = '/account';
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tabs = ['Profile', 'Security'];
    final tabController = useTabController(initialLength: tabs.length);
    final isEditable = useState(false);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: .05.sh),
              Text(
                'My Account',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: .02.sh),
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
              SizedBox(height: .02.sh),
              SegmentedTabControl(
                controller: tabController,
                tabTextColor: theme.textTheme.bodyMedium?.color,
                selectedTabTextColor: theme.textTheme.bodyMedium?.color,
                indicatorDecoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                barDecoration: BoxDecoration(
                  color: Color(0xFF3E3A4D),
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: TextStyle(inherit: false, fontSize: 14.sp),
                tabs: List.generate(
                  tabs.length,
                  (index) => SegmentTab(
                    label: tabs[index],
                  ),
                ),
              ),
              SizedBox(height: .02.sh),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    PersonalInformation(
                      isEditable: isEditable.value,
                      editToggle: (value) {
                        isEditable.value = !value;
                      },
                    ),
                    Security(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: CustomRoundedButton(
            text: isEditable.value ? 'Done' : 'Delete Account',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            textColor: isEditable.value ? Color(0xFF804AF1) : Color(0xFFF7546A),
            btnColor: Color(0xFF222222),
            onPressed: () {
              if (isEditable.value) {
                isEditable.value = false;
              } else {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) {
                    return DeleteAccountBottomSheet(
                      onConfirm: () {
                        Navigator.pop(context);
                        // Handle delete logic here
                      },
                      onCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
