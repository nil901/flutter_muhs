class LoginModel {
  String? sTUDENTID;
  String? pRNNUMBER;
  String? pASSWORD;

  LoginModel({this.sTUDENTID, this.pRNNUMBER, this.pASSWORD});

  LoginModel.fromJson(Map<String, dynamic> json) {
    sTUDENTID = json['STUDENT_ID'];
    pRNNUMBER = json['PRN_NUMBER'];
    pASSWORD = json['PASSWORD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STUDENT_ID'] = this.sTUDENTID;
    data['PRN_NUMBER'] = this.pRNNUMBER;
    data['PASSWORD'] = this.pASSWORD;
    return data;
  }
}