class Streetlight {
  String? id;
  bool? working;
  bool? flickering;
  DateTime? last_service;

  Streetlight();

  Map<String, dynamic> toJson() => {
        'id': id,
        'working': working,
        'flickering': flickering,
        'last_service': last_service,
      };

  Streetlight.fromSnapshot(snapshot)
      : id = snapshot.data()['id'],
        working = snapshot.data()['working'],
        flickering = snapshot.data()['flickering'],
        last_service = snapshot.data()['last_service'].toDate();
}
