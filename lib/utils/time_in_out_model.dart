class TimeInOutModels {
  String? date;
  String? timeIn;
  String? timeOut;

  TimeInOutModels({this.date, this.timeIn, this.timeOut});

  TimeInOutModels.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    return data;
  }
}
