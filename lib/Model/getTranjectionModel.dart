class GetTranjectionHistory {
  bool? status;
  String? message;
  String? wallet;
  List<TranjectionModelList>? data;

  GetTranjectionHistory({this.status, this.message, this.wallet, this.data});

  GetTranjectionHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    wallet = json['wallet'];
    if (json['data'] != null) {
      data = <TranjectionModelList>[];
      json['data'].forEach((v) {
        data!.add(new TranjectionModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['wallet'] = this.wallet;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TranjectionModelList {
  String? walletId;
  String? driverId;
  String? userId;
  String? bookingId;
  String? crDr;
  String? note;
  String? balance;
  String? mid;
  String? txnId;
  String? txnAmount;
  String? paymentMode;
  String? currency;
  String? txnDate;
  String? status;
  String? respcode;
  String? respmsg;
  String? gatewayName;
  String? bankTxnId;
  String? bankName;
  String? checksumhash;
  String? totalBalance;
  String? dateAdded;
  String? dateModified;
  String? incentiveStatus;
  String? numberTrips;
  String? fromDate;
  String? toDate;
  String? refferalStatus;
  String? incentiveId;
  String? incentiveBounusStatus;
  String? bookingTrip;
  String? adminPay;
  String? time;
  String? refferaId;
  String? sign;
  String? id;
  String? name;
  String? userName;
  String? password;
  String? phone;
  String? address;
  String? region;
  String? state;
  String? city;
  String? pinCode;
  String? email;
  String? licenseNo;
  String? drivingExp;
  String? carTypeId;
  String? carType;
  String? carNo;
  String? gender;
  String? dob;
  String? bankChaque;
  String? walletAmount;
  String? activeId;
  String? userStatus;
  String? type;
  String? driverBalance;
  String? rating;
  String? latitude;
  String? longitude;
  String? timetype;
  String? prefferedLocation;
  String? deviceId;
  String? insuranceNo;
  String? isVerified;
  String? isActive;
  String? isBlock;
  String? drivingLicenceNo;
  String? panCard;
  String? aadharCard;
  String? aadharCardF;
  String? aadharCardB;
  String? vehicalImege;
  String? carModel;
  String? otp;
  String? accountNumber;
  String? ifscCode;
  String? upiId;
  String? userImage;
  String? drivingLicencePhoto;
  String? referralCode;
  String? friendsCode;
  String? onlineOfline;
  String? panCardStatus1;
  String? vehicalImegeStatus;
  String? aadharCardStatus;
  String? userImageStatus;
  String? panCardStatus;
  String? createdAt;
  String? profileStatus;
  String? dateOfBirth;
  String? incentiveDate;
  String? homeAddress;
  String? profileStatusRead;
  String? profileReadStatus;
  String? bounusEndDate;
  String? bounusAmount;
  String? joiningIncBounus;
  String? insurance;
  String? newDriver;
  String? userGcmCode;
  String? driverConsoleAlcohal;
  String? reject;

  TranjectionModelList(
      {this.walletId,
        this.driverId,
        this.userId,
        this.bookingId,
        this.crDr,
        this.note,
        this.balance,
        this.mid,
        this.txnId,
        this.txnAmount,
        this.paymentMode,
        this.currency,
        this.txnDate,
        this.status,
        this.respcode,
        this.respmsg,
        this.gatewayName,
        this.bankTxnId,
        this.bankName,
        this.checksumhash,
        this.totalBalance,
        this.dateAdded,
        this.dateModified,
        this.incentiveStatus,
        this.numberTrips,
        this.fromDate,
        this.toDate,
        this.refferalStatus,
        this.incentiveId,
        this.incentiveBounusStatus,
        this.bookingTrip,
        this.adminPay,
        this.time,
        this.refferaId,
        this.sign,
        this.id,
        this.name,
        this.userName,
        this.password,
        this.phone,
        this.address,
        this.region,
        this.state,
        this.city,
        this.pinCode,
        this.email,
        this.licenseNo,
        this.drivingExp,
        this.carTypeId,
        this.carType,
        this.carNo,
        this.gender,
        this.dob,
        this.bankChaque,
        this.walletAmount,
        this.activeId,
        this.userStatus,
        this.type,
        this.driverBalance,
        this.rating,
        this.latitude,
        this.longitude,
        this.timetype,
        this.prefferedLocation,
        this.deviceId,
        this.insuranceNo,
        this.isVerified,
        this.isActive,
        this.isBlock,
        this.drivingLicenceNo,
        this.panCard,
        this.aadharCard,
        this.aadharCardF,
        this.aadharCardB,
        this.vehicalImege,
        this.carModel,
        this.otp,
        this.accountNumber,
        this.ifscCode,
        this.upiId,
        this.userImage,
        this.drivingLicencePhoto,
        this.referralCode,
        this.friendsCode,
        this.onlineOfline,
        this.panCardStatus1,
        this.vehicalImegeStatus,
        this.aadharCardStatus,
        this.userImageStatus,
        this.panCardStatus,
        this.createdAt,
        this.profileStatus,
        this.dateOfBirth,
        this.incentiveDate,
        this.homeAddress,
        this.profileStatusRead,
        this.profileReadStatus,
        this.bounusEndDate,
        this.bounusAmount,
        this.joiningIncBounus,
        this.insurance,
        this.newDriver,
        this.userGcmCode,
        this.driverConsoleAlcohal,
        this.reject});

  TranjectionModelList.fromJson(Map<String, dynamic> json) {
    walletId = json['wallet_id'];
    driverId = json['driver_id'];
    userId = json['user_id'];
    bookingId = json['booking_id'];
    crDr = json['cr_dr'];
    note = json['Note'];
    balance = json['balance'];
    mid = json['mid'];
    txnId = json['txn_id'];
    txnAmount = json['txn_amount'];
    paymentMode = json['payment_mode'];
    currency = json['currency'];
    txnDate = json['txn_date'];
    status = json['status'];
    respcode = json['respcode'];
    respmsg = json['respmsg'];
    gatewayName = json['gateway_name'];
    bankTxnId = json['bank_txn_id'];
    bankName = json['bank_name'];
    checksumhash = json['checksumhash'];
    totalBalance = json['total_balance'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    incentiveStatus = json['incentive_status'];
    numberTrips = json['number_trips'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    refferalStatus = json['refferal_status'];
    incentiveId = json['incentive_id'];
    incentiveBounusStatus = json['incentive_bounus_status'];
    bookingTrip = json['booking_trip'];
    adminPay = json['admin_pay'];
    time = json['time'];
    refferaId = json['reffera_id'];
    sign = json['sign'];
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    region = json['region'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pin_code'];
    email = json['email'];
    licenseNo = json['license_no'];
    drivingExp = json['driving_exp'];
    carTypeId = json['car_type_id'];
    carType = json['car_type'];
    carNo = json['car_no'];
    gender = json['gender'];
    dob = json['dob'];
    bankChaque = json['bank_chaque'];
    walletAmount = json['wallet_amount'];
    activeId = json['active_id'];
    userStatus = json['user_status'];
    type = json['type'];
    driverBalance = json['driver_balance'];
    rating = json['rating'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timetype = json['timetype'];
    prefferedLocation = json['preffered_location'];
    deviceId = json['device_id'];
    insuranceNo = json['insurance_no'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isBlock = json['is_block'];
    drivingLicenceNo = json['driving_licence_no'];
    panCard = json['pan_card'];
    aadharCard = json['aadhar_card'];
    aadharCardF = json['aadhar_card_f'];
    aadharCardB = json['aadhar_card_b'];
    vehicalImege = json['vehical_imege'];
    carModel = json['car_model'];
    otp = json['otp'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    upiId = json['upi_id'];
    userImage = json['user_image'];
    drivingLicencePhoto = json['driving_licence_photo'];
    referralCode = json['referral_code'];
    friendsCode = json['friends_code'];
    onlineOfline = json['online_ofline'];
    panCardStatus1 = json['pan_card_status1'];
    vehicalImegeStatus = json['vehical_imege_status'];
    aadharCardStatus = json['aadhar_card_status'];
    userImageStatus = json['user_image_status'];
    panCardStatus = json['pan_card_status'];
    createdAt = json['created_at'];
    profileStatus = json['profile_status'];
    dateOfBirth = json['date_of_birth'];
    incentiveDate = json['incentive_date'];
    homeAddress = json['home_address'];
    profileStatusRead = json['profile_status_read'];
    profileReadStatus = json['profile_read_status'];
    bounusEndDate = json['bounus_end_date'];
    bounusAmount = json['bounus_amount'];
    joiningIncBounus = json['joining_inc_bounus'];
    insurance = json['insurance'];
    newDriver = json['new_driver'];
    userGcmCode = json['user_gcm_code'];
    driverConsoleAlcohal = json['driver_console_alcohal'];
    reject = json['reject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_id'] = this.walletId;
    data['driver_id'] = this.driverId;
    data['user_id'] = this.userId;
    data['booking_id'] = this.bookingId;
    data['cr_dr'] = this.crDr;
    data['Note'] = this.note;
    data['balance'] = this.balance;
    data['mid'] = this.mid;
    data['txn_id'] = this.txnId;
    data['txn_amount'] = this.txnAmount;
    data['payment_mode'] = this.paymentMode;
    data['currency'] = this.currency;
    data['txn_date'] = this.txnDate;
    data['status'] = this.status;
    data['respcode'] = this.respcode;
    data['respmsg'] = this.respmsg;
    data['gateway_name'] = this.gatewayName;
    data['bank_txn_id'] = this.bankTxnId;
    data['bank_name'] = this.bankName;
    data['checksumhash'] = this.checksumhash;
    data['total_balance'] = this.totalBalance;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['incentive_status'] = this.incentiveStatus;
    data['number_trips'] = this.numberTrips;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['refferal_status'] = this.refferalStatus;
    data['incentive_id'] = this.incentiveId;
    data['incentive_bounus_status'] = this.incentiveBounusStatus;
    data['booking_trip'] = this.bookingTrip;
    data['admin_pay'] = this.adminPay;
    data['time'] = this.time;
    data['reffera_id'] = this.refferaId;
    data['sign'] = this.sign;
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['region'] = this.region;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pin_code'] = this.pinCode;
    data['email'] = this.email;
    data['license_no'] = this.licenseNo;
    data['driving_exp'] = this.drivingExp;
    data['car_type_id'] = this.carTypeId;
    data['car_type'] = this.carType;
    data['car_no'] = this.carNo;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['bank_chaque'] = this.bankChaque;
    data['wallet_amount'] = this.walletAmount;
    data['active_id'] = this.activeId;
    data['user_status'] = this.userStatus;
    data['type'] = this.type;
    data['driver_balance'] = this.driverBalance;
    data['rating'] = this.rating;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timetype'] = this.timetype;
    data['preffered_location'] = this.prefferedLocation;
    data['device_id'] = this.deviceId;
    data['insurance_no'] = this.insuranceNo;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['is_block'] = this.isBlock;
    data['driving_licence_no'] = this.drivingLicenceNo;
    data['pan_card'] = this.panCard;
    data['aadhar_card'] = this.aadharCard;
    data['aadhar_card_f'] = this.aadharCardF;
    data['aadhar_card_b'] = this.aadharCardB;
    data['vehical_imege'] = this.vehicalImege;
    data['car_model'] = this.carModel;
    data['otp'] = this.otp;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['upi_id'] = this.upiId;
    data['user_image'] = this.userImage;
    data['driving_licence_photo'] = this.drivingLicencePhoto;
    data['referral_code'] = this.referralCode;
    data['friends_code'] = this.friendsCode;
    data['online_ofline'] = this.onlineOfline;
    data['pan_card_status1'] = this.panCardStatus1;
    data['vehical_imege_status'] = this.vehicalImegeStatus;
    data['aadhar_card_status'] = this.aadharCardStatus;
    data['user_image_status'] = this.userImageStatus;
    data['pan_card_status'] = this.panCardStatus;
    data['created_at'] = this.createdAt;
    data['profile_status'] = this.profileStatus;
    data['date_of_birth'] = this.dateOfBirth;
    data['incentive_date'] = this.incentiveDate;
    data['home_address'] = this.homeAddress;
    data['profile_status_read'] = this.profileStatusRead;
    data['profile_read_status'] = this.profileReadStatus;
    data['bounus_end_date'] = this.bounusEndDate;
    data['bounus_amount'] = this.bounusAmount;
    data['joining_inc_bounus'] = this.joiningIncBounus;
    data['insurance'] = this.insurance;
    data['new_driver'] = this.newDriver;
    data['user_gcm_code'] = this.userGcmCode;
    data['driver_console_alcohal'] = this.driverConsoleAlcohal;
    data['reject'] = this.reject;
    return data;
  }
}