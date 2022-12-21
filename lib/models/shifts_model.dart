class ShiftsOfferts {
  List<Data>? data;

  ShiftsOfferts({this.data});

  ShiftsOfferts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? status;
  String? startAt;
  String? endAt;
  String? postName;
  int? postId;
  bool? startSoon;
  Recurring? recurring;
  String? company;
  String? buyPrice;
  int? bonus;
  double? latitude;
  double? longitude;

  Data(
      {this.id,
      this.status,
      this.startAt,
      this.endAt,
      this.postName,
      this.postId,
      this.startSoon,
      this.recurring,
      this.company,
      this.buyPrice,
      this.bonus,
      this.latitude,
      this.longitude});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    postName = json['post_name'];
    postId = json['post_id'];
    startSoon = json['start_soon'];
    recurring = json['recurring'] != null
        ? Recurring.fromJson(json['recurring'])
        : null;
    company = json['company'];
    buyPrice = json['buy_price'];
    bonus = json['bonus'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Recurring {
  int? id;
  String? startAt;
  String? endAt;
  bool? isAvailable;

  Recurring({this.id, this.startAt, this.endAt, this.isAvailable});

  Recurring.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    isAvailable = json['is_available'];
  }
}
