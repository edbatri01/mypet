import 'dart:convert';

Caroulselmagee caroulselmageeFromJson(String str) => Caroulselmagee.fromJson(json.decode(str));

String caroulselmageeToJson(Caroulselmagee data) => json.encode(data.toJson());

class Caroulselmagee {
    Caroulselmagee({
        required this.code,
        required this.globalMessage,
        required this.dtoImageCarousels,
    });

    bool code;
    String globalMessage;
    List<DtoImageCarousel> dtoImageCarousels;

    factory Caroulselmagee.fromJson(Map<String, dynamic> json) => Caroulselmagee(
        code: json["code"],
        globalMessage: json["globalMessage"],
        dtoImageCarousels: List<DtoImageCarousel>.from(json["dtoImageCarousels"].map((x) => DtoImageCarousel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "globalMessage": globalMessage,
        "dtoImageCarousels": List<dynamic>.from(dtoImageCarousels.map((x) => x.toJson())),
    };
}

class DtoImageCarousel {
    DtoImageCarousel({
        required this.url,
        required this.accion,
        required this.nombre,
    });

    String url;
    String accion;
    String nombre;

    factory DtoImageCarousel.fromJson(Map<String, dynamic> json) => DtoImageCarousel(
        url: json["url"],
        accion: json["accion"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "accion": accion,
        "nombre": nombre,
    };
}