class EmailLoginModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  int? plan;
  String? image;

  EmailLoginModel(
      {this.id, this.name, this.email, this.mobile, this.plan, this.image});

  EmailLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    plan = json['plan'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['plan'] = this.plan;
    data['image'] = this.image;
    return data;
  }
}
