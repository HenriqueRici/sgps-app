class ProcessoSeletivo {
  int? id;
  String? edital;
  String? cargo;
  int? anoReferencia;
  String? dataInicioInscricoes;
  String? dataFimInscricoes;
  String? dataInicioRetificacao;
  String? dataFimRetificacao;

  ProcessoSeletivo(
      {this.id,
      this.edital,
      this.cargo,
      this.anoReferencia,
      this.dataInicioInscricoes,
      this.dataFimInscricoes,
      this.dataInicioRetificacao,
      this.dataFimRetificacao});

  ProcessoSeletivo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    edital = json['edital'];
    cargo = json['cargo'];
    anoReferencia = json['anoReferencia'];
    dataInicioInscricoes = json['dataInicioInscricoes'];
    dataFimInscricoes = json['dataFimInscricoes'];
    dataInicioRetificacao = json['dataInicioRetificacao'];
    dataFimRetificacao = json['dataFimRetificacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['edital'] = edital;
    data['cargo'] = cargo;
    data['anoReferencia'] = anoReferencia;
    data['dataInicioInscricoes'] = dataInicioInscricoes;
    data['dataFimInscricoes'] = dataFimInscricoes;
    data['dataInicioRetificacao'] = dataInicioRetificacao;
    data['dataFimRetificacao'] = dataFimRetificacao;
    return data;
  }
}
