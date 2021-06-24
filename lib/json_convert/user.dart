/* todo 参考:https://flutter.cn/docs/development/data-and-backend/json#manual-encoding
 *通过引入一个简单的模型 User 类来解决上面提到的问题。在 User 类中，你会发现：
 * 一个 User.fromJson() 构造函数，用于从映射中构造一个新的 User 实例。
 * 一个 toJson() 方法，这个方法会将 User 实例转换为一个映射。
 * 通过这种方法，调用代码 可以拥有类型安全、 name 和 email 字段的自动完成以及编译时异常检测。
 * 如果你不小心写错了，或者把 String 类型的字段看成了 int 类型，应用将无法编译，而不是在运行时崩溃。
 */
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}