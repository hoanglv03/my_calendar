class Assignment {
  int id;
  String name, createAt;
  String? completedAt;
  String? description;
  bool isFinish;
  Assignment(this.name, this.isFinish, this.id, this.completedAt,
      this.description, this.createAt);
}
