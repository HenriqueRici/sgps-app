class Participante {
  String? nome;
  String? cpf;
  String? confirmacaoCpf;
  String? dataNascimento;
  String? dataIngresso;
  String? classe;
  String? nivel;
  String? senha;
  String? confirmacaoSenha;
  String? idProcessoSeletivo;

  Participante(
      {this.nome,
      this.cpf,
      this.confirmacaoCpf,
      this.dataNascimento,
      this.dataIngresso,
      this.classe,
      this.nivel,
      this.senha,
      this.confirmacaoSenha,
      this.idProcessoSeletivo});

  Participante.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    confirmacaoCpf = json['confirmacaoCpf'];
    dataNascimento = json['dataNascimento'];
    dataIngresso = json['dataIngresso'];
    classe = json['classe'];
    nivel = json['nivel'];
    senha = json['senha'];
    confirmacaoSenha = json['confirmacaoSenha'];
    idProcessoSeletivo = json['idProcessoSeletivo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['confirmacaoCpf'] = confirmacaoCpf;
    data['dataNascimento'] = dataNascimento;
    data['dataIngresso'] = dataIngresso;
    data['classe'] = classe;
    data['nivel'] = nivel;
    data['senha'] = senha;
    data['confirmacaoSenha'] = confirmacaoSenha;
    data['idProcessoSeletivo'] = idProcessoSeletivo;
    return data;
  }
}
