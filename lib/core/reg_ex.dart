class RegEx {
  static final RegExp regPhone = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

  static final RegExp regPassword = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$',
  );

  static final RegExp regEmail = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // ✅ Arabic name: allows Arabic letters and spaces only
  static final RegExp regArabicName = RegExp(
    r'^[\u0621-\u064A\s]+$',
  );

  // ✅ English name: allows English letters and spaces only
  static final RegExp regEnglishName = RegExp(
    r'^[A-Za-z\s]+$',
  );
}
