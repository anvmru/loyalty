# loyalty

Test work - loyalty programs

Domain model
--------------
Portfolio                   // Портфель
  User user;                // Пользователь
  LoyaltyProg loyaltyProg;  // Программа лояльности
  List<Purchase> purchases; // Покупки
    
User                        // Пользователь    
  String email;             // Логин
  String firstName;         // Имя
  String middleName;        // Отчество
  String lastName;          // Фамилия
  String phoneNumber;       // Телефон
  String pwd;               // Пароль (для простоты тут и в открытом виде)
  DateTime birthday;        // Дата рождения

LoyaltyProg                 // Программа лояльности
  String id;                // Идентификатор
  String name;              // Наименование программы
  double bonuses;           // Накопления бонусов суммарно с начала действия программы
  List<LoyalityLevel> levels; // Правила начисления бонусов

LoyalityLevel               // Правила начисления бонусов
  Level level;              // Уровень льготности
  double minPay;            // Минимальная сумма покупки по чеку
  double bonusAmount;       // Количество начисляемых бонусов

Purchases                   // Покупки
  String id;                // Идентификатор
  DateTime date;            // Дата и время
  String shop;              // Наименование торговой точки (по чеку)
  double totalPay;          // Сумма покупки (руб)
  double bonusPay;          // Списано бонусов
  double payWoBonus;        // Сумма за вычетом бонусов (руб)
  String loyaltyProgId;     // Программа лояльности по которой списаны бонусы
