import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.code,
    required this.globalMessage,
    required this.getProducts,
  });

  bool code;
  String globalMessage;
  GetProducts getProducts;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        code: json["code"],
        globalMessage: json["globalMessage"],
        getProducts: GetProducts.fromJson(json["getProducts"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "globalMessage": globalMessage,
        "getProducts": getProducts.toJson(),
      };
}

class GetProducts {
  GetProducts({
    required this.responseHeader,
    required this.response,
    required this.priceMax,
  });

  ResponseHeader responseHeader;
  Response response;
  double priceMax;

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        responseHeader: ResponseHeader.fromJson(json["responseHeader"]),
        response: Response.fromJson(json["response"]),
        priceMax: json["priceMax"],
      );

  Map<String, dynamic> toJson() => {
        "responseHeader": responseHeader.toJson(),
        "response": response.toJson(),
        "priceMax": priceMax,
      };
}

class Response {
  Response({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  int numFound;
  int start;
  bool numFoundExact;
  List<Doc> docs;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
      };
}

class Doc {
  Doc({
    required this.idSeller,
    required this.productStatus,
    required this.quantity,
    required this.urlImage,
    required this.idProduct,
    required this.description,
    required this.price,
    required this.sku,
    required this.name,
  });

  int idSeller;
  int productStatus;
  int quantity;
  String urlImage;
  int idProduct;
  String description;
  double price;
  String sku;
  String name;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        idSeller: json["idSeller"],
        productStatus: json["productStatus"],
        quantity: json["quantity"],
        urlImage: json["urlImage"],
        idProduct: json["idProduct"],
        description: json["description"],
        price: json["price"].toDouble(),
        sku: json["sku"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "idSeller": idSeller,
        "productStatus": productStatus,
        "quantity": quantity,
        "urlImage": urlImage,
        "idProduct": idProduct,
        "description": description,
        "price": price,
        "sku": sku,
        "name": name,
      };
}

class ResponseHeader {
  ResponseHeader({
    required this.status,
    required this.qTime,
    required this.params,
  });

  int status;
  int qTime;
  Params params;

  factory ResponseHeader.fromJson(Map<String, dynamic> json) => ResponseHeader(
        status: json["status"],
        qTime: json["qTime"],
        params: Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "qTime": qTime,
        "params": params.toJson(),
      };
}

class Params {
  Params({
    required this.q,
  });

  String q;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        q: json["q"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
      };
}
