// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  List<Datum> data;
  Dictionaries dictionaries;
  Meta meta;

  Token({
    this.data,
    this.dictionaries,
    this.meta,
  });

  factory Token.fromJson(Map<String, dynamic> json) => new Token(
        data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dictionaries: Dictionaries.fromJson(json["dictionaries"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
        "dictionaries": dictionaries.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Type type;
  String id;
  List<OfferItem> offerItems;

  Datum({
    this.type,
    this.id,
    this.offerItems,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        type: typeValues.map[json["type"]],
        id: json["id"],
        offerItems: new List<OfferItem>.from(
            json["offerItems"].map((x) => OfferItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "id": id,
        "offerItems": new List<dynamic>.from(offerItems.map((x) => x.toJson())),
      };
}

class OfferItem {
  List<Service> services;
  Price price;
  Price pricePerAdult;

  OfferItem({
    this.services,
    this.price,
    this.pricePerAdult,
  });

  factory OfferItem.fromJson(Map<String, dynamic> json) => new OfferItem(
        services: new List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        price: Price.fromJson(json["price"]),
        pricePerAdult: Price.fromJson(json["pricePerAdult"]),
      );

  Map<String, dynamic> toJson() => {
        "services": new List<dynamic>.from(services.map((x) => x.toJson())),
        "price": price.toJson(),
        "pricePerAdult": pricePerAdult.toJson(),
      };
}

class Price {
  String total;
  String totalTaxes;

  Price({
    this.total,
    this.totalTaxes,
  });

  factory Price.fromJson(Map<String, dynamic> json) => new Price(
        total: json["total"],
        totalTaxes: json["totalTaxes"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalTaxes": totalTaxes,
      };
}

class Service {
  List<Segment> segments;

  Service({
    this.segments,
  });

  factory Service.fromJson(Map<String, dynamic> json) => new Service(
        segments: new List<Segment>.from(
            json["segments"].map((x) => Segment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "segments": new List<dynamic>.from(segments.map((x) => x.toJson())),
      };
}

class Segment {
  FlightSegment flightSegment;
  PricingDetailPerAdult pricingDetailPerAdult;

  Segment({
    this.flightSegment,
    this.pricingDetailPerAdult,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => new Segment(
        flightSegment: FlightSegment.fromJson(json["flightSegment"]),
        pricingDetailPerAdult:
            PricingDetailPerAdult.fromJson(json["pricingDetailPerAdult"]),
      );

  Map<String, dynamic> toJson() => {
        "flightSegment": flightSegment.toJson(),
        "pricingDetailPerAdult": pricingDetailPerAdult.toJson(),
      };
}

class FlightSegment {
  Arrival departure;
  Arrival arrival;
  String carrierCode;
  String number;
  Aircraft aircraft;
  Operating operating;
  String duration;

  FlightSegment({
    this.departure,
    this.arrival,
    this.carrierCode,
    this.number,
    this.aircraft,
    this.operating,
    this.duration,
  });

  factory FlightSegment.fromJson(Map<String, dynamic> json) =>
      new FlightSegment(
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        carrierCode: json["carrierCode"],
        number: json["number"],
        aircraft: Aircraft.fromJson(json["aircraft"]),
        operating: Operating.fromJson(json["operating"]),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "carrierCode": carrierCode,
        "number": number,
        "aircraft": aircraft.toJson(),
        "operating": operating.toJson(),
        "duration": duration,
      };
}

class Aircraft {
  String code;

  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => new Aircraft(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class Arrival {
  IataCode iataCode;
  String terminal;
  DateTime at;

  Arrival({
    this.iataCode,
    this.terminal,
    this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => new Arrival(
        iataCode: iataCodeValues.map[json["iataCode"]],
        terminal: json["terminal"],
        at: DateTime.parse(json["at"]),
      );

  Map<String, dynamic> toJson() => {
        "iataCode": iataCodeValues.reverse[iataCode],
        "terminal": terminal,
        "at": at.toIso8601String(),
      };
}

enum IataCode { MAD, JFK, EWR }

final iataCodeValues = new EnumValues(
    {"EWR": IataCode.EWR, "JFK": IataCode.JFK, "MAD": IataCode.MAD});

class Operating {
  String carrierCode;
  String number;

  Operating({
    this.carrierCode,
    this.number,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => new Operating(
        carrierCode: json["carrierCode"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "carrierCode": carrierCode,
        "number": number,
      };
}

class PricingDetailPerAdult {
  TravelClass travelClass;
  String fareClass;
  int availability;
  String fareBasis;

  PricingDetailPerAdult({
    this.travelClass,
    this.fareClass,
    this.availability,
    this.fareBasis,
  });

  factory PricingDetailPerAdult.fromJson(Map<String, dynamic> json) =>
      new PricingDetailPerAdult(
        travelClass: travelClassValues.map[json["travelClass"]],
        fareClass: json["fareClass"],
        availability: json["availability"],
        fareBasis: json["fareBasis"],
      );

  Map<String, dynamic> toJson() => {
        "travelClass": travelClassValues.reverse[travelClass],
        "fareClass": fareClass,
        "availability": availability,
        "fareBasis": fareBasis,
      };
}

enum TravelClass { ECONOMY }

final travelClassValues = new EnumValues({"ECONOMY": TravelClass.ECONOMY});

enum Type { FLIGHT_OFFER }

final typeValues = new EnumValues({"flight-offer": Type.FLIGHT_OFFER});

class Dictionaries {
  Carriers carriers;
  Currencies currencies;
  Map<String, String> aircraft;
  Map<String, Location> locations;

  Dictionaries({
    this.carriers,
    this.currencies,
    this.aircraft,
    this.locations,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => new Dictionaries(
        carriers: Carriers.fromJson(json["carriers"]),
        currencies: Currencies.fromJson(json["currencies"]),
        aircraft: new Map.from(json["aircraft"])
            .map((k, v) => new MapEntry<String, String>(k, v)),
        locations: new Map.from(json["locations"]).map(
            (k, v) => new MapEntry<String, Location>(k, Location.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "carriers": carriers.toJson(),
        "currencies": currencies.toJson(),
        "aircraft": new Map.from(aircraft)
            .map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "locations": new Map.from(locations)
            .map((k, v) => new MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Carriers {
  String aa;
  String kl;
  String ux;
  String af;
  String dy;
  String ay;
  String dl;
  String ib;
  String sn;
  String lh;
  String ua;
  String ba;

  Carriers({
    this.aa,
    this.kl,
    this.ux,
    this.af,
    this.dy,
    this.ay,
    this.dl,
    this.ib,
    this.sn,
    this.lh,
    this.ua,
    this.ba,
  });

  factory Carriers.fromJson(Map<String, dynamic> json) => new Carriers(
        aa: json["AA"],
        kl: json["KL"],
        ux: json["UX"],
        af: json["AF"],
        dy: json["DY"],
        ay: json["AY"],
        dl: json["DL"],
        ib: json["IB"],
        sn: json["SN"],
        lh: json["LH"],
        ua: json["UA"],
        ba: json["BA"],
      );

  Map<String, dynamic> toJson() => {
        "AA": aa,
        "KL": kl,
        "UX": ux,
        "AF": af,
        "DY": dy,
        "AY": ay,
        "DL": dl,
        "IB": ib,
        "SN": sn,
        "LH": lh,
        "UA": ua,
        "BA": ba,
      };
}

class Currencies {
  String ngn;

  Currencies({
    this.ngn,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => new Currencies(
        ngn: json["NGN"],
      );

  Map<String, dynamic> toJson() => {
        "NGN": ngn,
      };
}

class Location {
  String subType;
  String detailedName;

  Location({
    this.subType,
    this.detailedName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => new Location(
        subType: json["subType"],
        detailedName: json["detailedName"],
      );

  Map<String, dynamic> toJson() => {
        "subType": subType,
        "detailedName": detailedName,
      };
}

class Meta {
  Links links;
  String currency;

  Meta({
    this.links,
    this.currency,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => new Meta(
        links: Links.fromJson(json["links"]),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "currency": currency,
      };
}

class Links {
  String self;

  Links({
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => new Links(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
