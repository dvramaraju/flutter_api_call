class Post {
  int id;
  String title;
  String body;
  Post(this.id, this.title, this.body);
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}

class Comment {
  int postId;
  int id;
  String title;
  String email;
  String body;
  Comment({this.postId, this.id, this.title, this.email, this.body});
  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    title = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
