import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/test/counter.dart';

void main(){
  test("test count increment", (){
    final counter =Counter();
    counter.increment();
    //验证 counter.value 的是是否为 1
    expect(counter.count, 1);
  });
  // 使用 group 合并多个测试。用来测试多个有关联的测试
  group("counter", (){
    test("test count increment", (){
      final counter =Counter();
      counter.increment();
      //验证 counter.value 的是是否为 1
      expect(counter.count, 1);
    });

    test("test count decrment", (){
      final counter =Counter();
      counter.descrement();
      expect(counter.count, -1);
    });

  });
}