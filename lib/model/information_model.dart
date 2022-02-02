class Information{
  String? fish;
  String? job;
  String? birth;
  String? phnumber;
  String? email;
  String? id;

  Information({this.id, this.fish, this.job, this.birth, this.phnumber, this.email});

  Information.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        fish = json["fish"],
        job = json["job"],
        birth = json["birth"],
        phnumber = json["phnumber"],
        email = json["email"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "fish" : fish,
    "job" : job,
    "birth" : birth,
    "phnumber" : phnumber,
    "email" : email,
  };

}