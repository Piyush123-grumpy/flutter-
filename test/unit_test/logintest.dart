import 'package:batch_student_objbox_api/app/constants.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/student_data_source.dart';
import 'package:batch_student_objbox_api/model/student.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('User should be able to login',()async{
    bool expectedResult=true;
    String username="messi";
    String password ="1234";
    bool actualResult=await StudentRemoteDataSource().loginStudent(username, password);
    expect(actualResult, expectedResult);
  });

  test('User should be able to get students by course',()async{
    String courseId="63c10207bb4712455b91a594";
    Constant.token="Bearer ";
    List <Student>? actualResult= await StudentRemoteDataSource().getStudentsByCourse(courseId);

    expect(actualResult, isNotNull)

  });
}