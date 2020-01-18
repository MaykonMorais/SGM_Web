module.exports = {
  showMudas: (con, callback) => {
    con.query("SELECT * FROM muda", callback)
  },
  insertMuda: (muda, con, callback) => {
    con.query("insert into muda(nome, valor, tipo_unitario, estoque_minimo, estoque_atual) values ('" + muda.nome + "', " + muda.valor + ",'" + muda.tipoUnitario + "', " + muda.estoqueMinimo + ", " + muda.estoqueAtual + ");")
  },
  searchMuda: (muda, con, callback) => {
    con.query("select * from muda where nome = '" + muda.nome + "'" + "LIMIT 1;", callback);
  }
}