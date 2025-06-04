import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/models/feitico.dart';
part 'mago.g.dart';

@JsonSerializable()
class Mago {
  String? nome;
  int? idade;
  List<Feitico> feiticos;

  Mago(this.nome, this.idade, this.feiticos);

  factory Mago.fromJson(Map<String, dynamic> json) => _$MagoFromJson(json);

  Map<String, dynamic> toJson() => _$MagoToJson(this);

  @override
  String toString() {
    return 'Mago{nome: $nome, idade: $idade,}';
  }
}
