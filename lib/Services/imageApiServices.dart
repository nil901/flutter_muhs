class ImageModel {
  int? bANNERID;
  String? bANNERIMAGE;
  String? sTATUS;
  String? rEGDATE;

  ImageModel({this.bANNERID, this.bANNERIMAGE, this.sTATUS, this.rEGDATE});

  ImageModel.fromJson(Map<String, dynamic> json) {
    bANNERID = json['BANNER_ID'];
    bANNERIMAGE = json['BANNER_IMAGE'];
    sTATUS = json['STATUS'];
    rEGDATE = json['REG_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BANNER_ID'] = this.bANNERID;
    data['BANNER_IMAGE'] = this.bANNERIMAGE;
    data['STATUS'] = this.sTATUS;
    data['REG_DATE'] = this.rEGDATE;
    return data;
  }
}
