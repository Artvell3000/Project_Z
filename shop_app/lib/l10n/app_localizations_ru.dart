// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get searchTitle => 'Все продукты';

  @override
  String get basketTitle => 'Моя корзина';

  @override
  String get ordersTitle => 'История покупок';

  @override
  String get profileTitle => 'Моя страница';

  @override
  String get authSendCodeTitle => 'Ваш номер телефона';

  @override
  String get authSendCodePhone => 'Телефон';

  @override
  String get registerButtonText => 'Зарегистрироваться';

  @override
  String get authSendCodeQuestion1 => 'Нет аккаунта? ';

  @override
  String get authSendCodeQuestion2 => 'Пройти авторизацию';

  @override
  String get authVerifyCodeTitle => 'Введите код';

  @override
  String get authVerifyCodeDescription =>
      'Для подтверждения телефона\nCompanyBot отправил 6-значный код';

  @override
  String authVerifyCodePS(int seconds) {
    return 'Если код не пришёл, вы можете\nзапросить новый через $seconds секунд';
  }

  @override
  String get homeGoToAll => 'Все';

  @override
  String get homeCategoryTitle => 'Категории';

  @override
  String get homeNewProductsTitle => 'Новые продукты';

  @override
  String get homeSpecialOfferTitle => 'Специальное предложение';

  @override
  String get addToBasketText => 'В корзину';

  @override
  String get createOrderText => 'Заказ';

  @override
  String get productDescriptionTitle => 'Описание товара';

  @override
  String get productCharacteristicTitle => 'Характеристики товара';

  @override
  String get quantity => 'Количество';

  @override
  String get profileFullNameLabel => 'Имя и фамилия';

  @override
  String get profilePhoneLabel => 'Телефон';

  @override
  String get profileUserInfoTitle => 'Ваши данные';

  @override
  String get profileGeoTitle => 'Ваше местоположение';

  @override
  String get profileDistinct => 'Район';

  @override
  String get profileTown => 'Область / Город';

  @override
  String get orderScreenDateText => 'Дата';

  @override
  String get orderScreenOrderIdText => 'Номер заказа';

  @override
  String get orderScreenOrderPriceText => 'Стоимость заказа';

  @override
  String get orderScreenProductPriceText => 'Цена товара';

  @override
  String get basketScreenCreateOrderButtonText => 'Оформить заказ';

  @override
  String get basketScreenFinalPriceText => 'Итого';

  @override
  String get searchScreenFilterButtonText => 'Фильтры';

  @override
  String get searchScreenAllButtonText => 'Все продукты';

  @override
  String get authAlertDialogTitle => 'Требуется авторизация';

  @override
  String get authAlertDialogContent =>
      'Для получения информации о товаре или совершения покупки необходимо зарегистрироваться. Пожалуйста, войдите в систему, чтобы продолжить.';

  @override
  String get authAlertDialogBackButton => 'Назад';

  @override
  String get authAlertDialogContinueButton => 'Продолжить';

  @override
  String get productNotFoundAlertTitle => 'Товар отсутствует';

  @override
  String get productNotFoundAlertContent =>
      'Извините, запрашиваемый товар отсутствует или был удалён. Пожалуйста, посмотрите другие товары.';

  @override
  String get createOrderAlertDialogTitle => 'Создание заказа';

  @override
  String get createOrderAlertDialogBasketText => 'В вашей корзине: ';

  @override
  String get createOrderAlertDialogFinalPrice => 'Итог: ';

  @override
  String get changePhoneAlertDialogTitle => 'Изменение номера телефона';

  @override
  String get changePhoneAlertDialogContent =>
      'Изменение номера телефона временно недоступно в мобильном приложении. Пожалуйста, воспользуйтесь нашим Telegram-ботом для этой операции.';

  @override
  String get locale => 'Ру';

  @override
  String get unauthText => 'Необходимо войти в систему';

  @override
  String get unauthButtonText => 'Войти';
}
