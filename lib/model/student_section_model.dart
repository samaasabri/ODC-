class StudentSectionModel {
  String? code;
  String? message;
  List<StudentSectionData>? data;

  StudentSectionModel({this.code, this.message, this.data});

  StudentSectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StudentSectionData>[];
      json['data'].forEach((v) {
        data!.add(new StudentSectionData.fromJson(v));
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

class StudentSectionData {
  int? id;
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;
  String? university;

  StudentSectionData(
      {this.id,
        this.sectionSubject,
        this.sectionDate,
        this.sectionStartTime,
        this.sectionEndTime,
        this.university});

  StudentSectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionSubject'] = this.sectionSubject;
    data['sectionDate'] = this.sectionDate;
    data['sectionStartTime'] = this.sectionStartTime;
    data['sectionEndTime'] = this.sectionEndTime;
    data['university'] = this.university;
    return data;
  }
}