class AddTaskModels {
  int? taskID;
  String? assignmentTitle;
  String? description;
  String? duedate;
  String? fileLink;
  String? status;

  AddTaskModels(
      {this.taskID,
      this.assignmentTitle,
      this.description,
      this.duedate,
      this.fileLink,
      this.status});

  AddTaskModels.fromJson(Map<String, dynamic> json) {
    taskID = json['Task_ID'];
    assignmentTitle = json['Assignment_Title'];
    description = json['Description'];
    duedate = json['Duedate'];
    fileLink = json['File_Link'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Task_ID'] = this.taskID;
    data['Assignment_Title'] = this.assignmentTitle;
    data['Description'] = this.description;
    data['Duedate'] = this.duedate;
    data['File_Link'] = this.fileLink;
    data['Status'] = this.status;
    return data;
  }
}
