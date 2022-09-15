
class StudentLetureModel {
  String? code;
  String? message;
  List<StudentLectureData>? data;

  StudentLetureModel({this.code, this.message, this.data});

  StudentLetureModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StudentLectureData>[];
      json['data'].forEach((v) {
        data!.add(new StudentLectureData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentLectureData {
  int? id;
  String? lectureSubject;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;
  String? university;

  StudentLectureData(
      {this.id,
        this.lectureSubject,
        this.lectureDate,
        this.lectureStartTime,
        this.lectureEndTime,
        this.university});

  StudentLectureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lectureSubject'] = this.lectureSubject;
    data['lectureDate'] = this.lectureDate;
    data['lectureStartTime'] = this.lectureStartTime;
    data['lectureEndTime'] = this.lectureEndTime;
    data['university'] = this.university;
    return data;
  }
}