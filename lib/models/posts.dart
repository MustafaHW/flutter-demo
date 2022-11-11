class PostModel {
  int? id;
  String? title;
  String? content;
  String? authorId;
  String? authorFirstName;
  String? authorLastName;
  dynamic? createdAt;
  dynamic? updatedAt;
  PostModel(
      {this.id,
      this.title,
      this.content,
      this.authorId,
      this.authorFirstName,
      this.authorLastName,
      this.createdAt,
      this.updatedAt});
  PostModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    content = json["content"];
    authorId = json["authorId"];
    authorFirstName = json["authorFirstName"];
    authorLastName = json["authorLastName"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "authorId": authorId,
        "authorFirstName": authorFirstName,
        "authorLastName": authorLastName,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

// class Posts {
//   List<PostModel> posts;
//   Posts(this.posts);
// }
