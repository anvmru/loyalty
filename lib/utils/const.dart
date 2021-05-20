import 'package:flutter/material.dart';

import '../generated/l10n.dart';

S gLocale;

const String kTitleApp = "LOYALTY PROGRAM";
const String kLogo = "assets/image.png";
const String kMyLink = "https://github.com/anvmru/loyalty";

const TextStyle kSplashStyle = TextStyle(fontSize: 28.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w800);

// Для сохранения в локальном хранилище
const String kStorageCatalog = 'repository.json';
const String kStorageUser = 'user';
const String kStoragePurchases = 'purchases';
const String kStorageLoyalty = 'loyalty';
const int kTimeoutSecond = 10;
const String kFormatDate = 'dd.MM.yyyy';