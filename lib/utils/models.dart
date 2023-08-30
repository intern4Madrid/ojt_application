class CreateUserModel {
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? userLevel;

  CreateUserModel(
      {this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.password,
      this.confirmPassword,
      this.userLevel});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    email = json['Email'];
    phone = json['Phone'];
    password = json['Password'];
    confirmPassword = json['Confirm_Password'];
    userLevel = json['User_Level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Firstname'] = this.firstname;
    data['Lastname'] = this.lastname;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Password'] = this.password;
    data['Confirm_Password'] = this.confirmPassword;
    data['User_Level'] = this.userLevel;
    return data;
  }
}
