// ignore_for_file: public_member_api_docs, sort_constructors_first

class ApiErrorModel {
  ApiErrorModel({
     this.message,
     this.code,
     
  });

  final String? message;
  final int ? code;
  

 

  factory ApiErrorModel.fromJson(Map<String, dynamic> map) {
    return ApiErrorModel(
      code: map['code'] != null ? map['code'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
     );
  }


}
