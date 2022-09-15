class SectionModel {
  String? code = "";
  String? message = "";
  List<DataSection>  data = [];

  SectionModel(this.code, this.message, this.data);

  SectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSection>[];
      json['data'].forEach((v) {
        data.add(new DataSection.fromJson(v));
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

class DataSection {
  int? id = 0;
  String? sectionSubject = "";
  String? sectionDate = "";
  String? sectionStartTime = "";
  String? sectionEndTime = "";

  DataSection(
      {this.id,
        this.sectionSubject,
        this.sectionDate,
        this.sectionStartTime,
        this.sectionEndTime});

  DataSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionSubject'] = this.sectionSubject;
    data['sectionDate'] = this.sectionDate;
    data['sectionStartTime'] = this.sectionStartTime;
    data['sectionEndTime'] = this.sectionEndTime;
    return data;
  }
}