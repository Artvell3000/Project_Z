import 'package:money2/money2.dart';

final uzsCurrency = Currency.create(
  'UZS', 0,
  symbol: "so'm",
  pattern: '# ### S',
);

void initializeCurrency() {
  Currencies().register(uzsCurrency);
}