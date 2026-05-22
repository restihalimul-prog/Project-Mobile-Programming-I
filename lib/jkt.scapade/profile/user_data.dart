class UserData {
  // Data user
  static String nama = "";
  static String email = "";
  static String noHp = "";
  static String password = "";

  // Foto profile (opsional nanti)
  static String profileImagePath = "";

  // Method reset/logout
  static void clearUser() {
    nama = "";
    email = "";
    noHp = "";
    password = "";
    profileImagePath = "";
  }
}
