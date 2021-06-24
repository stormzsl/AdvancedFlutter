import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

/*
 * todo 运行代码生成工具:https://flutter.cn/docs/development/data-and-backend/json#manual-encoding
 *  1.在项目根目录运行 flutter pub run build_runner build，
 * 你可以在任何需要的时候为你的模型生成 JSON 序列化数据代码。这会触发一次构建，遍历源文件，选择相关的文件，然后为它们生成必须的序列化数据代码。
 * 虽然这样很方便，但是如果你不需要在每次修改了你的模型类后都要手动构建那将会很棒。
 * 2.持续生成代码
 * 监听器 让我们的源代码生成过程更加方便。它会监听我们项目中的文件变化，
 * 并且会在需要的时候自动构建必要的文件。
 * 你可以在项目根目录运行 flutter pub run build_runner watch 启动监听。
 *
 */
@JsonSerializable()
class Address {

  String street;
  String city;

  Address(this.street, this.city);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
