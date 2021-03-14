class TableInfo {
  String member;
  String name;
  String mobile;
  DateTime date;
  String time;
  int guests;
  int table;
  String notes;
  bool activated;

  TableInfo({
    this.member,
    this.name,
    this.mobile,
    this.date,
    this.time,
    this.guests,
    this.table,
    this.notes,
    this.activated,
  });

  factory TableInfo.fromMap(Map<String, dynamic> data) {
    return TableInfo(
      member: data['member'],
      name: data['name'],
      mobile: data['mobile'],
      date: data['date'],
      time: data['time'],
      guests: data['guests'],
      table: data['table'],
      notes: data['notes'],
      activated: data['activated'],
    );
  }
}
