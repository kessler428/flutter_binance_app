class CriptosResponseModel {

  CriptosResponseModel({
    required this.symbol,
    required this.price,
  });

  String symbol;
  String price;

  factory CriptosResponseModel.fromJson(Map<String, dynamic> json) => CriptosResponseModel(
    symbol: json['symbol'],
    price: json['price'],
  );

}