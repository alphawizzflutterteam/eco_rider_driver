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
        data: List<CompleateDeliver>.from(
            json["data"].map((x) => CompleateDeliver.fromJson(x))),
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
  String? message;
  String? driverId;
  String? userId;
  dynamic address;
  String? bookingId;
  String? readUnread;
  String? deleteStatus;
  String? addedNotifyDate;
  String? notiId;
  String? assignedBy;
  dynamic area;
  String? amount;
  String? userImage;
  dynamic departureDate;
  dynamic returnDate;
  String? userEmail;
  String? mobile;
  String? userLat;
  String? userLang;
  String? username;
  String? pickupDate;
  String? pickupTime;
  String? pickupAddress;
  String? dropAddress;
  String? inOutCity;
  String? oneTowWay;
  String? bookingTimes;
  String? bookingTypes;
  String? reportingTime;

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
    this.amount,
    this.userImage,
    this.departureDate,
    this.returnDate,
    this.userEmail,
    this.mobile,
    this.userLat,
    this.userLang,
    this.username,
    this.pickupDate,
    this.pickupTime,
    this.pickupAddress,
    this.dropAddress,
    this.inOutCity,
    this.oneTowWay,
    this.bookingTimes,
    this.bookingTypes,
    this.reportingTime,
  });

  factory CompleateDeliver.fromJson(Map<String, dynamic> json) =>
      CompleateDeliver(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        message: json["message"] ?? "",
        driverId: json["driver_id"] ?? "",
        userId: json["user_id"] ?? "",
        address: json["address"] ?? "",
        bookingId: json["booking_id"] ?? "",
        readUnread: json["read_unread"] ?? "",
        deleteStatus: json["delete_status"] ?? "",
        addedNotifyDate: json["added_notify_date"] ?? "",
        notiId: json["noti_id"] ?? "",
        assignedBy: json["assigned_by"] ?? "",
        area: json["area"] ?? "",
        amount: json["amount"] ?? "",
        userImage: json["user_image"] ?? "",
        departureDate: json["departure_date"] ?? "",
        returnDate: json["return_date"] ?? "",
        userEmail: json["user_email"] ?? "",
        mobile: json["mobile"] ?? "",
        userLat: json["latitude"] ?? "",
        userLang: json["longitude"] ?? "",
        username: json["username"] ?? "",
        pickupDate: json["pickup_date"] ?? "",
        pickupTime: json["pickup_time"] ?? "",
        pickupAddress: json["pickup_address"] ?? "",
        dropAddress: json["drop_address"] ?? "",
        inOutCity: json["in_out_city"] ?? "",
        oneTowWay: json["one_tow_way"] ?? "",
        bookingTimes: json["booking_times"] ?? "",
        bookingTypes: json["booking_types"] ?? "",
        reportingTime: json["reporting_time"] ?? "",
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
        "amount": amount,
        "user_image": userImage,
        "departure_date": departureDate,
        "return_date": returnDate,
        "user_email": userEmail,
        "mobile": mobile,
        "latitude": userLat,
        "longitude": userLang,
        "username": username,
        "pickup_date": pickupDate,
        "pickup_time": pickupTime,
        "pickup_address": pickupAddress,
        "drop_address": dropAddress,
        "in_out_city": inOutCity,
        "one_tow_way": oneTowWay,
        "booking_times": bookingTimes,
        "booking_types": bookingTypes,
        "reporting_time": reportingTime,
      };
}
