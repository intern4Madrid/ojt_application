class SaveAssignmentModel {
  String? taskID;
  String? assignmentTitle;
  String? description;
  String? duedate;
  String? link;
  String? uploadFile;
  String? status;

  SaveAssignmentModel(
      {this.taskID,
      this.assignmentTitle,
      this.description,
      this.duedate,
      this.status,
      this.link,
      this.uploadFile});

  SaveAssignmentModel.fromJson(Map<String, dynamic> json) {
    taskID = json['Task_ID'];
    assignmentTitle = json['Assignment_Title'];
    description = json['Description'];
    duedate = json['Duedate'];
    link = json['Link'];
    uploadFile = json['UploadFile'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Task_ID'] = this.taskID;
    data['Assignment_Title'] = this.assignmentTitle;
    data['Description'] = this.description;
    data['Duedate'] = this.duedate;
    data['Link'] = this.link;
    data['UploadFile'] = this.uploadFile;
    data['Status'] = this.status;
    return data;
  }
}
