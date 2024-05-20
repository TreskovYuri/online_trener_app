class ExerciseGroup {
  ExerciseGroup({required this.id,required this.name,required this.trenerId,});
  int id;
  int trenerId;
  String name;

  Map<String,dynamic> getGroup() => {
    'id':this.id,
    'trenerId':this.trenerId,
    'name':this.name

  };
}