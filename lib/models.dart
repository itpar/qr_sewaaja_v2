class Mobildata {
  final int id;
  final String noPolisi;
  final String noRangka;
  final String noMesin;
  final String keterangan;
  final String status;
  final String refNumberQrCode;

  Mobildata(
      {this.id,
      this.noPolisi,
      this.noRangka,
      this.noMesin,
      this.keterangan,
      this.status,
      this.refNumberQrCode});

  factory Mobildata.fromJson(Map<String, dynamic> json) {
    return Mobildata(
        id: json['id'],
        noPolisi: json['noPolisi'],
        noRangka: json['noRangka'],
        noMesin: json['noMesin'],
        keterangan: json['keterangan'],
        status: json['status'],
        refNumberQrCode: json['refNumberQrCode']);
  }
}
