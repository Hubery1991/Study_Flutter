class Ad {
  int adType;//广告类型
  String pic;//广告图片

  Ad({this.adType, this.pic});

  Ad.fromJson(Map<String, dynamic> json) {
    adType = json['adType'];
    pic = json['pic'];
  }
}