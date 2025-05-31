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
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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

  /// No description provided for @searchTitle.
  ///
  /// In ru, this message translates to:
  /// **'Все продукты'**
  String get searchTitle;

  /// No description provided for @basketTitle.
  ///
  /// In ru, this message translates to:
  /// **'Моя корзина'**
  String get basketTitle;

  /// No description provided for @ordersTitle.
  ///
  /// In ru, this message translates to:
  /// **'История покупок'**
  String get ordersTitle;

  /// No description provided for @profileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Моя страница'**
  String get profileTitle;

  /// No description provided for @authAlertDialogTitle.
  ///
  /// In ru, this message translates to:
  /// **'Требуется авторизация'**
  String get authAlertDialogTitle;

  /// No description provided for @authAlertDialogContent.
  ///
  /// In ru, this message translates to:
  /// **'Для получения информации о товаре или совершения покупки необходимо зарегистрироваться. Пожалуйста, войдите в систему, чтобы продолжить.'**
  String get authAlertDialogContent;

  /// No description provided for @authAlertDialogBackButton.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get authAlertDialogBackButton;

  /// No description provided for @authAlertDialogContinueButton.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get authAlertDialogContinueButton;

  /// No description provided for @productNotFoundAlertTitle.
  ///
  /// In ru, this message translates to:
  /// **'Товар отсутствует'**
  String get productNotFoundAlertTitle;

  /// No description provided for @productNotFoundAlertContent.
  ///
  /// In ru, this message translates to:
  /// **'Извините, запрашиваемый товар отсутствует или был удалён. Пожалуйста, посмотрите другие товары.'**
  String get productNotFoundAlertContent;

  /// No description provided for @profileFullNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Имя и фамилия'**
  String get profileFullNameLabel;

  /// No description provided for @profilePhoneLabel.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get profilePhoneLabel;

  /// No description provided for @profileUserInfoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваши данные'**
  String get profileUserInfoTitle;

  /// No description provided for @profileGeoTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваше местоположение'**
  String get profileGeoTitle;

  /// No description provided for @profileDistinct.
  ///
  /// In ru, this message translates to:
  /// **'Район'**
  String get profileDistinct;

  /// No description provided for @profileTown.
  ///
  /// In ru, this message translates to:
  /// **'Область / Город'**
  String get profileTown;

  /// No description provided for @homeGoToAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get homeGoToAll;

  /// No description provided for @homeCategoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Категории.'**
  String get homeCategoryTitle;

  /// No description provided for @homeNewProductsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новые продукты.'**
  String get homeNewProductsTitle;

  /// No description provided for @homeSpecialOfferTitle.
  ///
  /// In ru, this message translates to:
  /// **'Специальное предложение.'**
  String get homeSpecialOfferTitle;

  /// No description provided for @addToBasketText.
  ///
  /// In ru, this message translates to:
  /// **'В корзину'**
  String get addToBasketText;

  /// No description provided for @createOrderText.
  ///
  /// In ru, this message translates to:
  /// **'Заказ'**
  String get createOrderText;

  /// No description provided for @productDescriptionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание товара'**
  String get productDescriptionTitle;

  /// No description provided for @productCharacteristicTitle.
  ///
  /// In ru, this message translates to:
  /// **'Характеристики товара'**
  String get productCharacteristicTitle;

  /// No description provided for @quantity.
  ///
  /// In ru, this message translates to:
  /// **'Количество'**
  String get quantity;

  /// No description provided for @locale.
  ///
  /// In ru, this message translates to:
  /// **'Ру'**
  String get locale;

  /// No description provided for @authSendCodeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваш номер телефона'**
  String get authSendCodeTitle;

  /// No description provided for @authSendCodePhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get authSendCodePhone;

  /// No description provided for @registerButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get registerButtonText;

  /// No description provided for @authSendCodeQuestion1.
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта? '**
  String get authSendCodeQuestion1;

  /// No description provided for @authSendCodeQuestion2.
  ///
  /// In ru, this message translates to:
  /// **'Пройти авторизацию'**
  String get authSendCodeQuestion2;

  /// No description provided for @authVerifyCodeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите код'**
  String get authVerifyCodeTitle;

  /// No description provided for @authVerifyCodeDescription.
  ///
  /// In ru, this message translates to:
  /// **'Для подтверждения телефона\nCompanyBot отправил 6-значный код'**
  String get authVerifyCodeDescription;

  /// No description provided for @authVerifyCodePS.
  ///
  /// In ru, this message translates to:
  /// **'Если код не пришёл, вы можете\nзапросить новый через 120 секунд'**
  String get authVerifyCodePS;

  /// No description provided for @unauthText.
  ///
  /// In ru, this message translates to:
  /// **'Необходимо войти в систему'**
  String get unauthText;

  /// No description provided for @unauthButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get unauthButtonText;

  /// No description provided for @searchScreenFilterButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get searchScreenFilterButtonText;

  /// No description provided for @searchScreenAllButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Все продукты'**
  String get searchScreenAllButtonText;

  /// No description provided for @orderScreenDateText.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get orderScreenDateText;

  /// No description provided for @orderScreenOrderIdText.
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа'**
  String get orderScreenOrderIdText;

  /// No description provided for @orderScreenOrderPriceText.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость заказа'**
  String get orderScreenOrderPriceText;

  /// No description provided for @orderScreenProductPriceText.
  ///
  /// In ru, this message translates to:
  /// **'Цена товара'**
  String get orderScreenProductPriceText;

  /// No description provided for @basketScreenCreateOrderButtonText.
  ///
  /// In ru, this message translates to:
  /// **'Оформить заказ'**
  String get basketScreenCreateOrderButtonText;

  /// No description provided for @basketScreenFinalPriceText.
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get basketScreenFinalPriceText;

  /// No description provided for @createOrderAlertDialogTitle.
  ///
  /// In ru, this message translates to:
  /// **'Создание заказа'**
  String get createOrderAlertDialogTitle;

  /// No description provided for @createOrderAlertDialogBasketText.
  ///
  /// In ru, this message translates to:
  /// **'В вашей корзине: '**
  String get createOrderAlertDialogBasketText;

  /// No description provided for @createOrderAlertDialogFinalPrice.
  ///
  /// In ru, this message translates to:
  /// **'Итог: '**
  String get createOrderAlertDialogFinalPrice;

  /// No description provided for @changePhoneAlertDialogContent.
  ///
  /// In ru, this message translates to:
  /// **'Изменение номера телефона временно недоступно в мобильном приложении. Пожалуйста, воспользуйтесь нашим Telegram-ботом для этой операции.'**
  String get changePhoneAlertDialogContent;

  /// No description provided for @changePhoneAlertDialogTitle.
  ///
  /// In ru, this message translates to:
  /// **'Изменение номера телефона'**
  String get changePhoneAlertDialogTitle;
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
