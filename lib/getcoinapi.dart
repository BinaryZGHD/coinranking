// To parse this JSON data, do
//
//     final getCoinApi = getCoinApiFromJson(jsonString);

import 'dart:convert';

GetCoinApi getCoinApiFromJson(String str) => GetCoinApi.fromJson(json.decode(str));

String getCoinApiToJson(GetCoinApi data) => json.encode(data.toJson());

class GetCoinApi {
  GetCoinApi({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory GetCoinApi.fromJson(Map<String, dynamic> json) => GetCoinApi(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.stats,
    required  this.coins,
  });

  Stats stats;
  List<Coin> coins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stats: Stats.fromJson(json["stats"]),
    coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stats": stats.toJson(),
    "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
  };
}

class Coin {
  Coin({
    required this.uuid,
    required this.symbol,
    required  this.name,
    required this.color,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.listedAt,
    required this.tier,
    required this.change,
    required  this.rank,
    required this.sparkline,
    required this.lowVolume,
    required this.coinrankingUrl,
    required  this.the24HVolume,
    required this.btcPrice,
  });

  String uuid;
  String symbol;
  String name;
  String color;
  String iconUrl;
  String marketCap;
  String price;
  int listedAt;
  int tier;
  String change;
  int rank;
  List<String> sparkline;
  bool lowVolume;
  String coinrankingUrl;
  String the24HVolume;
  String btcPrice;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    uuid: json["uuid"],
    symbol: json["symbol"],
    name: json["name"],
    color: json["color"] == null ? null : json["color"],
    iconUrl: json["iconUrl"],
    marketCap: json["marketCap"],
    price: json["price"],
    listedAt: json["listedAt"],
    tier: json["tier"],
    change: json["change"],
    rank: json["rank"],
    sparkline: List<String>.from(json["sparkline"].map((x) => x)),
    lowVolume: json["lowVolume"],
    coinrankingUrl: json["coinrankingUrl"],
    the24HVolume: json["24hVolume"],
    btcPrice: json["btcPrice"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "symbol": symbol,
    "name": name,
    "color": color == null ? null : color,
    "iconUrl": iconUrl,
    "marketCap": marketCap,
    "price": price,
    "listedAt": listedAt,
    "tier": tier,
    "change": change,
    "rank": rank,
    "sparkline": List<dynamic>.from(sparkline.map((x) => x)),
    "lowVolume": lowVolume,
    "coinrankingUrl": coinrankingUrl,
    "24hVolume": the24HVolume,
    "btcPrice": btcPrice,
  };
}

class Stats {
  Stats({
    required this.total,
    required this.referenceCurrencyRate,
    required this.totalCoins,
    required this.totalMarkets,
    required this.totalExchanges,
    required this.totalMarketCap,
    required this.total24HVolume,
    required this.btcDominance,
    required this.bestCoins,
    required this.newestCoins,
  });

  int total;
  int referenceCurrencyRate;
  int totalCoins;
  int totalMarkets;
  int totalExchanges;
  String totalMarketCap;
  String total24HVolume;
  double btcDominance;
  List<EstCoin> bestCoins;
  List<EstCoin> newestCoins;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    total: json["total"],
    referenceCurrencyRate: json["referenceCurrencyRate"],
    totalCoins: json["totalCoins"],
    totalMarkets: json["totalMarkets"],
    totalExchanges: json["totalExchanges"],
    totalMarketCap: json["totalMarketCap"],
    total24HVolume: json["total24hVolume"],
    btcDominance: json["btcDominance"].toDouble(),
    bestCoins: List<EstCoin>.from(json["bestCoins"].map((x) => EstCoin.fromJson(x))),
    newestCoins: List<EstCoin>.from(json["newestCoins"].map((x) => EstCoin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "referenceCurrencyRate": referenceCurrencyRate,
    "totalCoins": totalCoins,
    "totalMarkets": totalMarkets,
    "totalExchanges": totalExchanges,
    "totalMarketCap": totalMarketCap,
    "total24hVolume": total24HVolume,
    "btcDominance": btcDominance,
    "bestCoins": List<dynamic>.from(bestCoins.map((x) => x.toJson())),
    "newestCoins": List<dynamic>.from(newestCoins.map((x) => x.toJson())),
  };
}

class EstCoin {
  EstCoin({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.coinrankingUrl,
  });

  String uuid;
  String symbol;
  String name;
  String iconUrl;
  String coinrankingUrl;

  factory EstCoin.fromJson(Map<String, dynamic> json) => EstCoin(
    uuid: json["uuid"],
    symbol: json["symbol"],
    name: json["name"],
    iconUrl: json["iconUrl"],
    coinrankingUrl: json["coinrankingUrl"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "symbol": symbol,
    "name": name,
    "iconUrl": iconUrl,
    "coinrankingUrl": coinrankingUrl,
  };
}
