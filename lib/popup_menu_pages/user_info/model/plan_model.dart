class PlanModel {
  late String userId;
  late String userName;
  late String level;
  late String monthInterval;
  late double price;
  late bool isApproved;
  late bool isPaid;
  late bool isCancelled;
  late DateTime startDate;
  late DateTime endDate;
  late DateTime approveDate;
  late DateTime paidDate;
  late DateTime writeDate;

  PlanModel(
      this.userId,
      this.userName,
      this.level,
      this.monthInterval,
      this.price,
      this.isApproved,
      this.isPaid,
      this.isCancelled,
      this.startDate,
      this.endDate,
      this.approveDate,
      this.paidDate,
      this.writeDate);
  factory PlanModel.fromRTDB(Map<String, dynamic> data) {
    // print("datakey");
    // print((data as DataSnapshot).key);
    return PlanModel(
        data['userId'],
        data['userName'],
        data['level'],
        data['monthInterval'],
        data['price'],
        data['isApproved'],
        data['isPaid'],
        data['isCancelled'],
        DateTime.fromMicrosecondsSinceEpoch(data['startDate']),
        DateTime.fromMicrosecondsSinceEpoch(data['endDate']),
        DateTime.fromMicrosecondsSinceEpoch(data['approveDate']),
        DateTime.fromMicrosecondsSinceEpoch(data['paidDate']),
        DateTime.fromMicrosecondsSinceEpoch(data['writeDate']));
  }
}
