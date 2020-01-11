module.exports = {
  showMudas: (con, callback) => {
    con.query("SELECT * FROM muda", callback)
  },
  insertMuda: (muda, con, callback) => {
    con.query("insert into muda(nome, valor, tipo_unitario, estoque_minimo, estoque_atual) values ('" + muda.nome + "', " + muda.valor + ",'" + muda.tipoUnitario + "', " + muda.estoqueMinimo + ", " + muda.estoqueAtual + ");")
  }
}