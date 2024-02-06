
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
  String ?title;
  String ?message;
  String? driverId;
  String ? userId;
  dynamic address;
  String? bookingId;
  String? readUnread;
  String ?deleteStatus;
  String? addedNotifyDate;
  String? notiId;
  String?assignedBy;
  String ?amount;
  String? username;
  String ?email;
  String ?mobile;
  String? userImage;
  dynamic departureDate;
  dynamic returnDate;
  dynamic cityName;
  dynamic area;
  String? transaction;
  String ?pickupAddress;
  String ?dropAddress;
  String? inOutCity;
  String ?oneTowWay;
  String? acceptReject;
  String? bookingTimes;
  String ?bookingTypes;
  String? pickupDate;
  String ?pickupTime;
  String ?reportingTime;

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
    this.userImage,
    this.departureDate,
    this.returnDate,
    this.cityName,
    this.area,
    this.transaction,
    this.pickupAddress,
    this.dropAddress,
    this.inOutCity,
    this.oneTowWay,
    this.acceptReject,
    this.bookingTimes,
    this.bookingTypes,
    this.pickupDate,
    this.pickupTime,
    this.reportingTime,
  });

  factory CompleateDeliverList.fromJson(Map<String, dynamic> json) => CompleateDeliverList(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    driverId: json["driver_id"],
    userId: json["user_id"],
    address: json["address"],
    bookingId: json["booking_id"],
    readUnread: json["read_unread"],
    deleteStatus: json["delete_status"],
    addedNotifyDate: json["added_notify_date"],
    notiId: json["noti_id"],
    assignedBy: json["assigned_by"],
    amount: json["amount"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    userImage: json["user_image"],
    departureDate: json["departure_date"],
    returnDate: json["return_date"],
    cityName: json["city_name"],
    area: json["area"],
    transaction: json["transaction"],
    pickupAddress: json["pickup_address"],
    dropAddress: json["drop_address"],
    inOutCity: json["in_out_city"],
    oneTowWay: json["one_tow_way"],
    acceptReject: json["accept_reject"],
    bookingTimes: json["booking_times"],
    bookingTypes: json["booking_types"],
    pickupDate: json["pickup_date"],
    pickupTime: json["pickup_time"],
    reportingTime: json["reporting_time"],
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
    "user_image": userImage,
    "departure_date": departureDate,
    "return_date": returnDate,
    "city_name": cityName,
    "area": area,
    "transaction": transaction,
    "pickup_address": pickupAddress,
    "drop_address": dropAddress,
    "in_out_city": inOutCity,
    "one_tow_way": oneTowWay,
    "accept_reject": acceptReject,
    "booking_times": bookingTimes,
    "booking_types": bookingTypes,
    "pickup_date": pickupDate,
    "pickup_time": pickupTime,
    "reporting_time": reportingTime,
  };
}
