import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String id = const Uuid().v1();
  String name;
  int colorNum;
  int iconNum;

  CategoryModel(this.name, this.colorNum, this.iconNum);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
