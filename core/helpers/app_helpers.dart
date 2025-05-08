import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../data_state/data_state.dart'
    show DataFailure, DataState, NetworkFailure;
import '../widgets/alert_dialog.dart' show alertDialog;
import '../widgets/bottom_sheet_picker.dart' show CupertinoPickerBottomSheet;

class AppHelpers {
  static void changeMobileNavColor({
    required Color color,
    Brightness? brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: brightness ?? Brightness.light,
      ),
    );
  }

  static String handleError(dynamic error) {
    String responseMessage = 'Something went wrong';
    if (error is DataState) {
      if (error is NetworkFailure) {
        alertDialog(message: 'Bad internet connection');
        responseMessage = 'Bad internet connection';
      } else if (error is DataFailure) {
        alertDialog(
          message: error.status >= 500 ? 'Something went wrong' : error.message,
        );
        responseMessage =
            error.status >= 500 ? 'Something went wrong' : error.message;
      } else {
        alertDialog(message: 'Something went wrong');
      }
    } else {
      alertDialog(message: 'Something went wrong');
    }
    return responseMessage;
  }

  static void goNamed({
    required String routeName,
    required BuildContext context,
    Object? extra,
  }) {
    context.push(routeName, extra: extra);
  }

  static void goNamedReplacement({
    required String routeName,
    required BuildContext context,
  }) {
    context.go(routeName);
  }

  static Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static String formatDate(DateTime data) {
    final now = DateTime.now();
    final date = data.toLocal();

    // Check if the date is today
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      // Show only time if today
      return DateFormat("h:mm a").format(date);
    }

    // Check if the date is from this year
    if (date.year == now.year) {
      // Show day and month if it's from this year but not today
      return DateFormat("d, MMMM, h:mm a").format(date);
    }

    // If it's from a previous year, show day, month, year, and time
    return DateFormat("d, MMMM yyyy, h:mm a").format(date);
  }

  static // Utility function to show the picker
      Future<String?> showCupertinoPickerBottomSheet({
    required BuildContext context,
    required List<String> items,
    required String title,
    String? suffix,
    double heightFactor = 0.4,
    Color? backgroundColor,
    Color? textColor,
    Color? primaryColor,
    int initialIndex = 0,
  }) async {
    final selectedItem = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context1) {
        return CupertinoPickerBottomSheet(
          items: items,
          title: title,
          suffix: suffix,
          heightFactor: heightFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          primaryColor: primaryColor,
          onSelected: (value) => Navigator.pop(context1, value),
        );
      },
    );

    return selectedItem;
  }

  static String formatMoney(
    String amount, {
    String currency = 'USDT',
    String locale = 'en_US',
  }) {
    final format = NumberFormat.currency(
        locale: locale, symbol: getCurrencySymbol(currency));
    return format.format(double.parse(amount));
  }

// Function to get the currency symbol
  static String getCurrencySymbol(String currency) {
    Map<String, String> symbols = {
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
      'NGN': '₦',
      'BTC': '₿',
      'ETH': 'Ξ',
      'USDT': 'USDT',
      'BNB': 'BNB'
    };
    return symbols[currency] ?? currency;
  }

  static void print(Object data) {
    if (kDebugMode) {
      print(data);
    }
  }

  static bool checkIndexAtItem<T>(List<T> list, int index) {
    if (index >= 0 && index < list.length) {
      return true;
    } else {
      // Handle the invalid index case
      return false;
    }
  }

  static int calculateTotalPrice(Map<int, String?> selectedRequiredItemsPrice) {
    return selectedRequiredItemsPrice.values.map((priceString) {
      return int.tryParse(priceString ?? '') ?? 0;
    }).fold(0, (sum, price) => sum + price);
  }

  static int calculateTotalPriceInt(Map<int, int> selectedRequiredItemsPrice) {
    return selectedRequiredItemsPrice.values.map((priceString) {
      return priceString;
    }).fold(0, (sum, price) => sum + price);
  }

  static int calculateTotalPriceList(List<int> selectedRequiredItemsPrice) {
    return selectedRequiredItemsPrice.fold(0, (sum, price) => sum + price);
  }

  static String convertedAmount(
    String data, {
    String currency = 'naira',
    bool? obSecure,
    bool addDecimal = false,
  }) {
    if (obSecure == true) {
      return returnCurrencyAmounth('****', currency);
    }

    double amount = double.tryParse(data) ?? 0.0;
    NumberFormat format = NumberFormat.currency(
      symbol: '', // We'll add the symbol manually
      decimalDigits: addDecimal ? 2 : 0,
      locale: 'en_US',
    );

    return returnCurrencyAmounth(format.format(amount), currency);
  }

  static String returnCurrencyAmounth(String amount, String currency) {
    return '${returnCurrency(currency)}$amount';
  }

  static String returnCurrency(String currency) {
    switch (currency.toLowerCase()) {
      case 'dollar':
        return '\$';
      case 'rands':
        return 'R';
      case 'cfa':
        return 'CFA ';
      default:
        return '₦';
    }
  }

  static GoRoute createCustomTransitionRoute({
    required String routeName,
    required Widget screen,
  }) {
    return GoRoute(
      name: routeName,
      path: routeName,
      // redirect: (context, state) => redirect(context, state),
      pageBuilder: (context, state) => CupertinoPage(child: screen),
    );
  }

  static GoRoute createCustomTransitionRouteExtra<T>({
    required String path, // Add path parameter
    required Widget Function(T? extra, Map<String, String> params)
        screenBuilder,
  }) {
    return GoRoute(
      path: path, // Use the path parameter here
      pageBuilder: (context, state) {
        final extra = state.extra as T?;
        return CupertinoPage(
          key: state.pageKey,
          child: screenBuilder(extra, state.pathParameters),
        );
      },
    );
  }

  // Future<bool> isLoggedIn() async {
  //   final token = await getToken();
  //   if (token != null) return true;
  //   return false;
  // }

  // static Future<String?> redirect(
  //   BuildContext context,
  //   GoRouterState? state,
  // ) async {
  //   bool isLoggedIn = await AppHelpers().isLoggedIn();
  //   if (isLoggedIn) {
  //     return null;
  //   } else {
  //     return '/';
  //   }
  // }

  static String formatDateTime(
    DateTime dateTime, {
    required String formatType,
  }) {
    if (formatType == 'time') {
      return DateFormat('h:mm a').format(dateTime);
    } else if (formatType == 'date') {
      return DateFormat('dd-MM-yyyy').format(dateTime);
    } else {
      return DateFormat('h:mm a dd-MM-yyyy').format(dateTime);
    }
  }
}
