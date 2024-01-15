
class BookingModel {
  bool status;
  String message;
  List<CompleateDeliver> data;

  BookingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    status: json["status"],
    message: json["message"],
    data: List<CompleateDeliver>.from(json["data"].map((x) => CompleateDeliver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CompleateDeliver {
  String? id;
  String? title;
  String ?message;
  String ?driverId;
  String  ?userId;
  dynamic ? address;
  String ? bookingId;
  String  ?readUnread;
  String ? deleteStatus;
  DateTime ? addedNotifyDate;
  String ? notiId;
  String  ?assignedBy;
  String ? area;
  String  ?cityName;
  String ? amount;
  DateTime ? departureDate;
  DateTime ? returnDate;
  String  ?userEmail;
  String ? username;

  CompleateDeliver({
    this.id,
    this.title,
    this.message,
    this.driverId,
    this.userId,
    this.address,
    this.bookingId,
    this.readUnread,
    this.deleteStatus,
    this.addedNotifyDate,
    this.notiId,
    this.assignedBy,
    this.area,
    this.cityName,
    this.amount,
    this.departureDate,
    this.returnDate,
    this.userEmail,
    this.username,
  });

  factory CompleateDeliver.fromJson(Map<String, dynamic> json) => CompleateDeliver(
    id: json["id"]??"",
    title: json["title"]??"",
    message: json["message"]??"",
    driverId: json["driver_id"]??"",
    userId: json["user_id"]??"",
    address: json["address"]??"",
    bookingId: json["booking_id"]??"",
    readUnread: json["read_unread"]??"",
    deleteStatus: json["delete_status"]??"",
    addedNotifyDate: DateTime.parse(json["added_notify_date"]),
    notiId: json["noti_id"]??"",
    assignedBy: json["assigned_by"]??"",
    area: json["area"],
    cityName: json["city_name"]??"",
    amount: json["amount"]??"",
    departureDate: DateTime.parse(json["departure_date"]),
    returnDate: DateTime.parse(json["return_date"]),
    userEmail: json["user_email"]??"",
    username: json["username"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "driver_id": driverId,
    "user_id": userId,
    "address": address,
    "booking_id": bookingId,
    "read_unread": readUnread,
    "delete_status": deleteStatus,
    "added_notify_date": addedNotifyDate,
    "noti_id": notiId,
    "assigned_by": assignedBy,
    "area": area,
    "city_name": cityName,
    "amount": amount,
    "departure_date": departureDate,
    "return_date":returnDate,
    "user_email": userEmail,
    "username": username,
  };
}
