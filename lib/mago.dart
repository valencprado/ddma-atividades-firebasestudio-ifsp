class Mago {
  String? nome;
  int? idade;
  int? nivelMagico;
  double? inteligencia;
  double? mana;
  int? afinidadeFogo;
  int? afinidadeAgua;
  int? afinidadeTerra;
  int? afinidadeAr;
  String? feitico1;
  String? feitico2;
  String? feitico3;

  Mago._({
    required this.nome,
    required this.idade,
    required this.nivelMagico,
    required this.inteligencia,
    required this.mana,
    required this.afinidadeFogo,
    required this.afinidadeAgua,
    required this.afinidadeTerra,
    required this.afinidadeAr,
    required this.feitico1,
    required this.feitico2,
    required this.feitico3,
  });

  factory Mago.fromJson(Map<String, dynamic> json) => Mago._(
    nome: json['nome'],
    idade: json['idade'],
    nivelMagico: json['nivelMagico'],
    inteligencia: (json['inteligencia'] as num?)?.toDouble(),
    mana: (json['mana'] as num?)?.toDouble(),
    afinidadeFogo: json['afinidadeFogo'],
    afinidadeAgua: json['afinidadeAgua'],
    afinidadeTerra: json['afinidadeTerra'],
    afinidadeAr: json['afinidadeAr'],
    feitico1: json['feitico1'],
    feitico2: json['feitico2'],
    feitico3: json['feitico3'],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "idade": idade,
    "nivelMagico": nivelMagico,
    "inteligencia": inteligencia,
    "mana": mana,
    "afinidadeFogo": afinidadeFogo,
    "afinidadeAgua": afinidadeAgua,
    "afinidadeTerra": afinidadeTerra,
    "afinidadeAr": afinidadeAr,
    "feitico1": feitico1,
    "feitico2": feitico2,
    "feitico3": feitico3,
  };

  String toString() =>
      "MAGO ${nome} de ${idade} (lvl ${nivelMagico} e mana ${mana}) anos que tem os feitiços ${feitico1}, ${feitico2}, ${feitico3}";
}
