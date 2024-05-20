class Exercise {
  int id;
  int groupId;
  String nameRu;
  String nameEng;
  String descriptionRu;
  String descriptionEn;
  String link;
  String img;
  List<String> stage;
  List<String> equipment;
  List<String> musclegroups;
  String pocazatel1Name;
  String pocazatel1Type;
  String pocazatel1SPFlag;
  String pocazatel2Name;
  String pocazatel2Type;
  String pocazatel2SPFlag;
  String pocazatel3Name;
  String pocazatel3Type;
  String pocazatel3SPFlag;
  String pocazatel4Name;
  String pocazatel4Type;
  String pocazatel4SPFlag;
  String pocazatel5Name;
  String pocazatel5Type;
  String pocazatel5SPFlag;

  Exercise({
    this.id = 0,
    this.groupId = 0,
    this.nameRu = '',
    this.nameEng = '',
    this.descriptionRu = '',
    this.descriptionEn = '',
    this.link = '',
    this.img = '',
    this.stage = const [],
    this.equipment = const [],
    this.musclegroups = const [],
    this.pocazatel1Name = '',
    this.pocazatel1Type = '',
    this.pocazatel1SPFlag = '',
    this.pocazatel2Name = '',
    this.pocazatel2Type = '',
    this.pocazatel2SPFlag = '',
    this.pocazatel3Name = '',
    this.pocazatel3Type = '',
    this.pocazatel3SPFlag = '',
    this.pocazatel4Name = '',
    this.pocazatel4Type = '',
    this.pocazatel4SPFlag = '',
    this.pocazatel5Name = '',
    this.pocazatel5Type = '',
    this.pocazatel5SPFlag = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'groupId': groupId,
      'nameRu': nameRu,
      'nameEng': nameEng,
      'descriptionRu': descriptionRu,
      'descriptionEn': descriptionEn,
      'link': link,
      'img': img,
      'stage': stage,
      'equipment': equipment,
      'musclegroups': musclegroups,
      'pocazatel1Name': pocazatel1Name,
      'pocazatel1Type': pocazatel1Type,
      'pocazatel1SPFlag': pocazatel1SPFlag,
      'pocazatel2Name': pocazatel2Name,
      'pocazatel2Type': pocazatel2Type,
      'pocazatel2SPFlag': pocazatel2SPFlag,
      'pocazatel3Name': pocazatel3Name,
      'pocazatel3Type': pocazatel3Type,
      'pocazatel3SPFlag': pocazatel3SPFlag,
      'pocazatel4Name': pocazatel4Name,
      'pocazatel4Type': pocazatel4Type,
      'pocazatel4SPFlag': pocazatel4SPFlag,
      'pocazatel5Name': pocazatel5Name,
      'pocazatel5Type': pocazatel5Type,
      'pocazatel5SPFlag': pocazatel5SPFlag,
    };
  }
}
