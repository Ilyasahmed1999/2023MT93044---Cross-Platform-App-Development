class Task {
  String? className;
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  bool? done;

  Task(
      {this.className,
      this.objectId,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.done});

  Task.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
    description = json['description'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['className'] = this.className;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['done'] = this.done;
    return data;
  }
}
