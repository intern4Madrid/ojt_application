class CalendarModels {
  String? taskId;
  String? title;
  String? description;

  CalendarModels({this.taskId, this.title, this.description});

  CalendarModels.fromJson(Map<String, dynamic> json) {
    taskId = json['TaskId'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TaskId'] = this.taskId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
