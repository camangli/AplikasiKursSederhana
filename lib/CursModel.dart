class CursModel {
  Rates rates;

  CursModel({this.rates });

  CursModel.fromJson(Map<String, dynamic> json){
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    return data;
  }
}
  class Rates{
    double idr;
    double usd;
    double jpy;
    double sgd;
    double eur;
    double aud;

    Rates({this.idr, this.usd, this.jpy, this.sgd, this.eur, this.aud});

    Rates.fromJson(Map<String, dynamic> json){
      idr = json['IDR'];
      usd = json['USD'];
      jpy = json['JPY'];
      sgd = json['SGD'];
      eur = json['EUR'];
      aud = json['AUD'];
    }

    Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
      data['IDR'] = this.idr;
      data['USD'] = this.usd;
      data['JPY'] = this.jpy;
      data['SGD'] = this.sgd;
      data['EUR'] = this.eur;
      data['AUD'] = this.aud;
      return data;
  }
}