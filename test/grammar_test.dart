import 'package:flutter/cupertino.dart';
import 'package:myapp/test/grammar.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){

  group("test grammar", (){
    test("test with grammar", (){
      final man = Man();
      man.testWith();
    });
  });

  group("test future grammar", (){

    test("test future result",()  {
      debugPrint(">>>>> 0000");

      final futurePratice = FuturePratice();
     futurePratice.getResultFuture().then((value) => debugPrint(">>>> $value")).catchError((onError){
       debugPrint(">>>>> catchError:$onError");
     }).whenComplete(() => {
     debugPrint(">>>>> whenComplete:")
     });

      debugPrint(">>>>> 1111");

    });

     test("test future method1",  () async {
      final futurePratice = FuturePratice();
      await futurePratice.method1();
    });

     test("test future method2",  () async {
       final futurePratice = FuturePratice();
      final result= await futurePratice.method2();
     });

    test("test future method3",  () async {
      final futurePratice = FuturePratice();
      await futurePratice.method3();
    });

    test("test future method4",  () async {
      final futurePratice = FuturePratice();
      await futurePratice.method4();
    });

    test("test future method5",  () async {
      final futurePratice = FuturePratice();
      await futurePratice.method5();
    });

  });

  group("test Stream method group", (){
    test("test Stream method", () {
      final streamPratcie =StreamPratcie();
       streamPratcie.method();
    });

  });

  group("test singleton group", (){
    test("test singleton", (){
      var s1 = Singleton();
      var s2 = Singleton();
      debugPrint(">>>>> ${identical(s1, s2)}");
    });
  });
}