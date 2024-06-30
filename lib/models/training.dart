
import 'dart:convert';

Training trainingFromJson(String str) => Training.fromJson(json.decode(str));

String trainingToJson(Training data) => json.encode(data.toJson());

class Training {
    int? id;
    String? name;
    List<TrainingStage>? stages;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Training({
        this.id,
        this.name,
        this.stages,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    factory Training.fromJson(Map<String, dynamic> json) => Training(
        id: json["id"],
        name: json["name"],
        stages: json["stages"] == null ? [] : List<TrainingStage>.from(json["stages"]!.map((x) => TrainingStage.fromJson(x))),
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stages": stages == null ? [] : List<dynamic>.from(stages!.map((x) => x.toJson())),
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class TrainingStage {
    String? title;
    List<StageStage>? stages;

    TrainingStage({
        this.title,
        this.stages,
    });

    factory TrainingStage.fromJson(Map<String, dynamic> json) => TrainingStage(
        title: json["title"],
        stages: json["stages"] == null ? [] : List<StageStage>.from(json["stages"]!.map((x) => StageStage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "stages": stages == null ? [] : List<dynamic>.from(stages!.map((x) => x.toJson())),
    };
}

class StageStage {
    String? timeout;
    String? setCount;
    List<Exercise>? exercises;

    StageStage({
        this.timeout,
        this.setCount,
        this.exercises,
    });

    factory StageStage.fromJson(Map<String, dynamic> json) => StageStage(
        timeout: json["timeout"],
        setCount: json["setCount"],
        exercises: json["exercises"] == null ? [] : List<Exercise>.from(json["exercises"]!.map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "timeout": timeout,
        "setCount": setCount,
        "exercises": exercises == null ? [] : List<dynamic>.from(exercises!.map((x) => x.toJson())),
    };
}

class Exercise {
    int? id;
    dynamic img;
    String? link;
    List<Set>? sets;
    String? stage;
    String? video;
    String? nameRu;
    dynamic groupId;
    String? nameEng;
    DateTime? createdAt;
    String? equipment;
    DateTime? updatedAt;
    String? musclegroups;
    dynamic descriptionEn;
    dynamic descriptionRu;
    String? pocazatel1Name;
    String? pocazatel1Type;
    String? pocazatel2Name;
    String? pocazatel2Type;
    dynamic pocazatel3Name;
    String? pocazatel3Type;
    dynamic pocazatel4Name;
    String? pocazatel4Type;
    dynamic pocazatel5Name;
    String? pocazatel5Type;
    String? pocazatel1SpFlag;
    String? pocazatel2SpFlag;
    dynamic pocazatel3SpFlag;
    dynamic pocazatel4SpFlag;
    dynamic pocazatel5SpFlag;

    Exercise({
        this.id,
        this.img,
        this.link,
        this.sets,
        this.stage,
        this.video,
        this.nameRu,
        this.groupId,
        this.nameEng,
        this.createdAt,
        this.equipment,
        this.updatedAt,
        this.musclegroups,
        this.descriptionEn,
        this.descriptionRu,
        this.pocazatel1Name,
        this.pocazatel1Type,
        this.pocazatel2Name,
        this.pocazatel2Type,
        this.pocazatel3Name,
        this.pocazatel3Type,
        this.pocazatel4Name,
        this.pocazatel4Type,
        this.pocazatel5Name,
        this.pocazatel5Type,
        this.pocazatel1SpFlag,
        this.pocazatel2SpFlag,
        this.pocazatel3SpFlag,
        this.pocazatel4SpFlag,
        this.pocazatel5SpFlag,
    });

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        img: json["img"],
        link: json["link"],
        sets: json["sets"] == null ? [] : List<Set>.from(json["sets"]!.map((x) => Set.fromJson(x))),
        stage: json["stage"],
        video: json["video"],
        nameRu: json["nameRu"],
        groupId: json["groupId"],
        nameEng: json["nameEng"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        equipment: json["equipment"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        musclegroups: json["musclegroups"],
        descriptionEn: json["descriptionEn"],
        descriptionRu: json["descriptionRu"],
        pocazatel1Name: json["pocazatel1Name"],
        pocazatel1Type: json["pocazatel1Type"],
        pocazatel2Name: json["pocazatel2Name"],
        pocazatel2Type: json["pocazatel2Type"],
        pocazatel3Name: json["pocazatel3Name"],
        pocazatel3Type: json["pocazatel3Type"],
        pocazatel4Name: json["pocazatel4Name"],
        pocazatel4Type: json["pocazatel4Type"],
        pocazatel5Name: json["pocazatel5Name"],
        pocazatel5Type: json["pocazatel5Type"],
        pocazatel1SpFlag: json["pocazatel1SPFlag"],
        pocazatel2SpFlag: json["pocazatel2SPFlag"],
        pocazatel3SpFlag: json["pocazatel3SPFlag"],
        pocazatel4SpFlag: json["pocazatel4SPFlag"],
        pocazatel5SpFlag: json["pocazatel5SPFlag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "link": link,
        "sets": sets == null ? [] : List<dynamic>.from(sets!.map((x) => x.toJson())),
        "stage": stage,
        "video": video,
        "nameRu": nameRu,
        "groupId": groupId,
        "nameEng": nameEng,
        "createdAt": createdAt?.toIso8601String(),
        "equipment": equipment,
        "updatedAt": updatedAt?.toIso8601String(),
        "musclegroups": musclegroups,
        "descriptionEn": descriptionEn,
        "descriptionRu": descriptionRu,
        "pocazatel1Name": pocazatel1Name,
        "pocazatel1Type": pocazatel1Type,
        "pocazatel2Name": pocazatel2Name,
        "pocazatel2Type": pocazatel2Type,
        "pocazatel3Name": pocazatel3Name,
        "pocazatel3Type": pocazatel3Type,
        "pocazatel4Name": pocazatel4Name,
        "pocazatel4Type": pocazatel4Type,
        "pocazatel5Name": pocazatel5Name,
        "pocazatel5Type": pocazatel5Type,
        "pocazatel1SPFlag": pocazatel1SpFlag,
        "pocazatel2SPFlag": pocazatel2SpFlag,
        "pocazatel3SPFlag": pocazatel3SpFlag,
        "pocazatel4SPFlag": pocazatel4SpFlag,
        "pocazatel5SPFlag": pocazatel5SpFlag,
    };
}

class Set {
    int? setSet;
    int? diapazonDo1;
    int? diapazonDo2;
    int? diapazonOt1;
    int? diapazonOt2;

    Set({
        this.setSet,
        this.diapazonDo1,
        this.diapazonDo2,
        this.diapazonOt1,
        this.diapazonOt2,
    });

    factory Set.fromJson(Map<String, dynamic> json) => Set(
        setSet: json["set"],
        diapazonDo1: json["diapazonDo1"],
        diapazonDo2: json["diapazonDo2"],
        diapazonOt1: json["diapazonOt1"],
        diapazonOt2: json["diapazonOt2"],
    );

    Map<String, dynamic> toJson() => {
        "set": setSet,
        "diapazonDo1": diapazonDo1,
        "diapazonDo2": diapazonDo2,
        "diapazonOt1": diapazonOt1,
        "diapazonOt2": diapazonOt2,
    };
}
