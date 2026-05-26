import 'dart:convert';

class FileData {
  final String originalname;
  final String filename;
  final String location;

  FileData({
    required this.originalname,
    required this.filename,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'originalname': originalname,
      'filename': filename,
      'location': location,
    };
  }

  factory FileData.fromMap(Map<String, dynamic> map) {
    return FileData(
      originalname: map['originalname'] as String,
      filename: map['filename'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileData.fromJson(String source) =>
      FileData.fromMap(json.decode(source) as Map<String, dynamic>);
}
