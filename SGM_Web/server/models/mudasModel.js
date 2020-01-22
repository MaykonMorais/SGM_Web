module.exports = {
  showMudas: (con, callback) => {
    con.query("SELECT * FROM muda", callback)
  },
  insertMuda: (muda, con, callback) => {
    con.query("insert into muda(nome, valor, tipo_unitario, estoque_minimo, estoque_atual) values ('" + muda.nome + "', " + muda.valor + ",'" + muda.tipoUnitario + "', " + muda.estoqueMinimo + ", " + muda.estoqueAtual + ");")
  },
  searchMuda: (muda, con, callback) => {
    con.query("select * from muda where nome = '" + muda.nome + "'" + "LIMIT 1;", callback);
  },
  updateMuda: (muda, con, callback) => { // falta adicionar tipo_unitario "tipo_unitario=muda.tipo_unitario"
    con.query("update muda set nome='" + muda.nome + "', valor = " + muda.valor + ", estoque_minimo = " + muda.estoqueMinimo + ", estoque_atual=" + muda.estoqueAtual + " where idmuda = " + muda.idMuda)
  },
  removeMuda: (muda, con, callback) => {
    con.query("delete from muda where idmuda='" + muda.idMuda + "';")
  }
}