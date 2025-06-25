import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_locales/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('uz')
  ];

  /// Title for the search tab in bottom navigation
  ///
  /// In ru, this message translates to:
  /// **'Все продукты'**
  String get searchTitle;

  /// Title for the basket tab in bottom navigation
  ///
  /// In ru, this message translates to:
  /// **'Моя корзина'**
  String get basketTitle;

  /// Title for the orders history tab in bottom navigation
  ///
  /// In ru, this message translates to:
  /// **'История покупок'**
  String get ordersTitle;

  /// Title for the profile tab in bottom navigation
  ///
  /// In ru, this message translates to:
  /// **'Моя страница'**
  String get profileTitle;

  /// Title for the phone number input screen
  ///
  /// In ru, this message translates to:
  /// **'Ваш номер телефона'**
  String get authSendCodeTitle;

  /// Label for phone number input field
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get authSendCodePhone;

  /// Text for registration button
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get registerButtonText;

  /// First part of the registration prompt
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта? '**
  String get authSendCodeQuestion1;

  /// Second part of the registration prompt
  ///
  /// In ru, this message translates to:
  /// **'Пройти авторизацию'**
  String get authSendCodeQuestion2;

  /// Title for the verification code input screen
  ///
  /// In ru, this message translates to:
  /// **'Введите код'**
  String get authVerifyCodeTitle;

  /// Description of the verification process
  ///
  /// In ru, this message translates to:
  /// **'Для подтверждения телефона\nCompanyBot отправил 6-значный код'**
  String get authVerifyCodeDescription;

  /// Message about requesting a new code
  ///
  /// In ru, this message translates to:
  /// **'Если код не пришёл, вы можете\nзапросить новый через {seconds} секунд'**
  String authVerifyCodePS(int seconds);

  /// Button text to view all items
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get homeGoToAll;

  /// Title for categories section
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get homeCategoryTitle;

  /// Title for new products section
  ///
  /// In ru, this message translates to:
  /// **'Новые продукты'**
  String get homeNewProductsTitle;

  /// Title for special offers section
  ///
  /// In ru, this message translates to:
  /// **'Специальное предложение'**
  String get homeSpecialOfferTitle;

  /// Text for add to basket button
  ///
  /// In ru, this message translates to:
  /// **'В корзину'**
  String get addToBasketText;

  /// Text for create order button
  ///
  /// In ru, this message translates to:
  /// **'Заказ'**
  String get createOrderText;

  /// Title for product description section
  ///
  /// In ru, this message translates to:
  /// **'Описание товара'**
  String get productDescriptionTitle;

  /// Title for product characteristics section
  ///
  /// In ru, this message translates to:
  /// **'Характеристики товара'**
  String get productCharacteristicTitle;

  /// Label for quantity selection
  ///
  /// In ru, this message translates to:
  /// **'Количество'**
  String get quantity;

  /// Label for full name field in profile
  ///
  /// In ru, this message translates to:
  /// **'Имя и фамилия'**
  String get profileFullNameLabel;

  /// Label for phone number field in profile
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get profilePhoneLabel;

  /// Title for user information section
  ///
  /// In ru, this message translates to:
  /// **'Ваши данные'**
  String get profileUserInfoTitle;

  /// Title for location information section
  ///
  /// In ru, this message translates to:
  /// **'Ваше местоположение'**
  String get profileGeoTitle;

  /// Label for district field
  ///
  /// In ru, this message translates to:
  /// **'Район'**
  String get profileDistinct;

  /// add geo button text
  ///
  /// In ru, this message translates to:
  /// **'Область / Город'**
  String get profileTown;

  /// No description provided for @profileAddGeo.
  ///
  /// In ru, this message translates to:
  /// **'+ Manzil qo’shish'**
  String get profileAddGeo;

  /// Label for order date
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get orderScreenDateText;

  /// Label for order ID
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа'**
  String get orderScreenOrderIdText;

  /// Label for total order price
  ///
  /// In ru, this message translates to:
  /// **'Стоимость заказа'**
  String get orderScreenOrderPriceText;

  /// Label for individual product price
  ///
  /// In ru, this message translates to:
  /// **'Цена товара'**
  String get orderScreenProductPriceText;

  /// Text for checkout button
  ///
  /// In ru, this message translates to:
  /// **'Оформить заказ'**
  String get basketScreenCreateOrderButtonText;

  /// Label for final price in basket
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get basketScreenFinalPriceText;

  /// Text for filters button
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get searchScreenFilterButtonText;

  /// Text for all products button
  ///
  /// In ru, this message translates to:
  /// **'Все продукты'**
  String get searchScreenAllButtonText;

  /// Title for authentication required dialog
  ///
  /// In ru, this message translates to:
  /// **'Требуется авторизация'**
  String get authAlertDialogTitle;

  /// Content text for authentication required dialog
  ///
  /// In ru, this message translates to:
  /// **'Для получения информации о товаре или совершения покупки необходимо зарегистрироваться. Пожалуйста, войдите в систему, чтобы продолжить.'**
  String get authAlertDialogContent;

  /// Text for back button in auth dialog
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get authAlertDialogBackButton;

  /// Text for continue button in auth dialog
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get authAlertDialogContinueButton;

  /// Title for product not found dialog
  ///
  /// In ru, this message translates to:
  /// **'Товар отсутствует'**
  String get productNotFoundAlertTitle;

  /// Content text for product not found dialog
  ///
  /// In ru, this message translates to:
  /// **'Извините, запрашиваемый товар отсутствует или был удалён. Пожалуйста, посмотрите другие товары.'**
  String get productNotFoundAlertContent;

  /// Title for create order dialog
  ///
  /// In ru, this message translates to:
  /// **'Создание заказа'**
  String get createOrderAlertDialogTitle;

  /// Label for basket contents in order dialog
  ///
  /// In ru, this message translates to:
  /// **'В вашей корзине: '**
  String get createOrderAlertDialogBasketText;

  /// Label for final price in order dialog
  ///
  /// In ru, this message translates to:
  /// **'Итог: '**
  String get createOrderAlertDialogFinalPrice;

  /// Title for change phone number dialog
  ///
  /// In ru, this message translates to:
  /// **'Изменение номера телефона'**
  String get changePhoneAlertDialogTitle;

  /// Content text for change phone number dialog
  ///
  /// In ru, this message translates to:
  /// **'Изменение номера телефона временно недоступно в мобильном приложении. Пожалуйста, воспользуйтесь нашим Telegram-ботом для этой операции.'**
  String get changePhoneAlertDialogContent;

  /// Short text for language selector
  ///
  /// In ru, this message translates to:
  /// **'Ру'**
  String get locale;

  /// Message shown when authentication is required
  ///
  /// In ru, this message translates to:
  /// **'Необходимо войти в систему'**
  String get unauthText;

  /// Text for login button
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get unauthButtonText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
