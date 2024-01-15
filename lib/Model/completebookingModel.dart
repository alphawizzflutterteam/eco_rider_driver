
class CompleteBookingModel {
  bool status;
  String message;
  List<CompleateDeliverList> data;

  CompleteBookingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompleteBookingModel.fromJson(Map<String, dynamic> json) => CompleteBookingModel(
    status: json["status"],
    message: json["message"],
    data: List<CompleateDeliverList>.from(json["data"].map((x) => CompleateDeliverList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CompleateDeliverList {
  String? id;
  String? title;
  String? message;
  String? driverId;
  String? userId;
  dynamic address;
  String? bookingId;
  String? readUnread;
  String? deleteStatus;
  DateTime? addedNotifyDate;
  String? notiId;
  String? assignedBy;
  String? amount;
  String? username;
  String? email;
  String? mobile;
  String? tranjection;
  DateTime? departureDate;
  DateTime? returnDate;
  String ?cityName;
  String ?area;

  CompleateDeliverList({
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
   this.amount,
   this.username,
   this.email,
   this.mobile,
   this.tranjection,
   this.departureDate,
   this.returnDate,
   this.cityName,
   this.area,
  });

  factory CompleateDeliverList.fromJson(Map<String, dynamic> json) => CompleateDeliverList(
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
    amount: json["amount"]??"",
    username: json["username"]??"",
    email: json["email"]??"",
    mobile: json["mobile"]??"",
    tranjection: json["transaction"]??"",
    departureDate: DateTime.parse(json["departure_date"]),
    returnDate: DateTime.parse(json["return_date"]),
    cityName: json["city_name"]??"",
    area: json["area"]??"",
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
    "amount": amount,
    "username": username,
    "email": email,
    "mobile": mobile,
    "transaction": tranjection,
    "departure_date":deleteStatus,
    "return_date": returnDate,
    "city_name": cityName,
    "area": area,
  };
}
