class FinalModel {
  String? code="";
  String? message="";
  List<DataFinal>data =[];

  FinalModel(this.code, this.message, this.data);

  FinalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataFinal>[];
      json['data'].forEach((v) { data!.add(new DataFinal.fromJson(v)); });
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

class DataFinal {
  int? id=0;
  String? examSubject="";
  String? examDate="";
  String? examStartTime="";
  String? examEndTime="";
  bool? finals=false;

  DataFinal({this.id, this.examSubject, this.examDate, this.examStartTime, this.examEndTime, this.finals});

  DataFinal.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  examSubject = json['examSubject'];
  examDate = json['examDate'];
  examStartTime = json['examStartTime'];
  examEndTime = json['examEndTime'];
  finals = json['final'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['examSubject'] = this.examSubject;
  data['examDate'] = this.examDate;
  data['examStartTime'] = this.examStartTime;
  data['examEndTime'] = this.examEndTime;
  data['final'] = this.finals;
  return data;
  }
}