class LoginRequest {
  final String pLangNo;
  final String pDlvrNo;
  final String pPsswrd;

  LoginRequest({
    required this.pLangNo,
    required this.pDlvrNo,
    required this.pPsswrd,
  });

  Map<String, dynamic> toJson() => {
        "Value": {
          "P_LANG_NO": pLangNo,
          "P_DLVRY_NO": pDlvrNo,
          "P_PSSWRD": pPsswrd,
        },
      };
}
