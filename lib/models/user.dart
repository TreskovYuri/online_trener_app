class User {
    int id;
    String email;
    String number;
    String name;
    String post;
    dynamic amplua;
    String team;
    dynamic height;
    dynamic weight;
    DateTime date;
    String img;
    String secret;
    String password;
    String activationCode;
    int? trenerId;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.email,
        required this.number,
        required this.name,
        required this.post,
        required this.amplua,
        required this.team,
        required this.height,
        required this.weight,
        required this.date,
        required this.img,
        required this.secret,
        required this.password,
        required this.activationCode,
        required this.trenerId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        number: json["number"],
        name: json["name"],
        post: json["post"],
        amplua: json["amplua"],
        team: json["team"],
        height: json["height"],
        weight: json["weight"],
        date: DateTime.parse(json["date"]),
        img: json["img"],
        secret: json["secret"],
        password: json["password"],
        activationCode: json["activationCode"],
        trenerId: json["trenerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "number": number,
        "name": name,
        "post": post,
        "amplua": amplua,
        "team": team,
        "height": height,
        "weight": weight,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "img": img,
        "secret": secret,
        "password": password,
        "activationCode": activationCode,
        "trenerId": trenerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}