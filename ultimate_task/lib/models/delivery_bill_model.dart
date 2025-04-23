class DeliveryBill {
  final int billType;
  final String billNo;
  final String billSrl;
  final String billDate;
  final String billTime;
  final double billAmt;
  final double taxAmt;
  final double deliveryAmt;
  final String mobileNo;
  final String customerName;
  final String region;
  final String buildingNo;
  final String floorNo;
  final String apartmentNo;
  final String address;
  final String latitude;
  final String longitude;
  final int status;

  DeliveryBill({
    required this.billType,
    required this.billNo,
    required this.billSrl,
    required this.billDate,
    required this.billTime,
    required this.billAmt,
    required this.taxAmt,
    required this.deliveryAmt,
    required this.mobileNo,
    required this.customerName,
    required this.region,
    required this.buildingNo,
    required this.floorNo,
    required this.apartmentNo,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  static double parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  factory DeliveryBill.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic val) {
      if (val == null) return 0.0;
      if (val is num) return val.toDouble();
      return double.tryParse(val.toString()) ?? 0.0;
    }

    return DeliveryBill(
      billType: int.tryParse(json["BILL_TYPE"].toString()) ?? 0,
      billNo: json["BILL_NO"].toString(),
      billSrl: json["BILL_SRL"].toString(),
      billDate: json["BILL_DATE"] ?? "",
      billTime: json["BILL_TIME"] ?? "",
      billAmt: parseDouble(json["BILL_AMT"]),
      taxAmt: parseDouble(json["TAX_AMT"]),
      deliveryAmt: parseDouble(json["DLVRY_AMT"]),
      mobileNo: json["MOBILE_NO"]?.toString() ?? "",
      customerName: json["CSTMR_NM"] ?? "---",
      region: json["RGN_NM"] ?? "---",
      buildingNo: json["CSTMR_BUILD_NO"]?.toString() ?? "---",
      floorNo: json["CSTMR_FLOOR_NO"]?.toString() ?? "---",
      apartmentNo: json["CSTMR_APRTMNT_NO"]?.toString() ?? "---",
      address: json["CSTMR_ADDRSS"] ?? "---",
      latitude: json["LATITUDE"] ?? "",
      longitude: json["LONGITUDE"] ?? "",
      status: int.tryParse(json["DLVRY_STATUS_FLG"].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'BILL_TYPE': billType,
      'BILL_NO': billNo,
      'BILL_SRL': billSrl,
      'BILL_DATE': billDate,
      'BILL_TIME': billTime,
      'BILL_AMT': billAmt,
      'TAX_AMT': taxAmt,
      'DLVRY_AMT': deliveryAmt,
      'MOBILE_NO': mobileNo,
      'CSTMR_NM': customerName,
      'RGN_NM': region,
      'CSTMR_BUILD_NO': buildingNo,
      'CSTMR_FLOOR_NO': floorNo,
      'CSTMR_APRTMNT_NO': apartmentNo,
      'CSTMR_ADDRSS': address,
      'LATITUDE': latitude,
      'LONGITUDE': longitude,
      'DLVRY_STATUS_FLG': status,
    };
  }

  factory DeliveryBill.fromMap(Map<String, dynamic> map) {
    return DeliveryBill(
      billType: map['BILL_TYPE'] ?? 0,
      billNo: map['BILL_NO'].toString(),
      billSrl: map['BILL_SRL'],
      billDate: map['BILL_DATE'],
      billTime: map['BILL_TIME'],
      billAmt: parseDouble(map['BILL_AMT']),
      taxAmt: parseDouble(map['TAX_AMT']),
      deliveryAmt: parseDouble(map['DLVRY_AMT']),
      mobileNo: map['MOBILE_NO']?.toString() ?? '',
      customerName: map['CSTMR_NM'],
      region: map['RGN_NM'],
      buildingNo: map['CSTMR_BUILD_NO']?.toString() ?? '',
      floorNo: map['CSTMR_FLOOR_NO']?.toString() ?? '',
      apartmentNo: map['CSTMR_APRTMNT_NO']?.toString() ?? '',
      address: map['CSTMR_ADDRSS'],
      latitude: map['LATITUDE']?.toString() ?? '',
      longitude: map['LONGITUDE']?.toString() ?? '',
      status: map['DLVRY_STATUS_FLG'],
    );
  }
}
