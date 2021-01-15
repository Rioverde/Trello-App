class Card {
  final int id;
  final String row;
  final int seq;
  final String text;

  Card({this.id, this.row, this.seq, this.text});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      row: json['row'],
      seq: json['seq_num'],
      text: json['text'],
    );
  }
}
