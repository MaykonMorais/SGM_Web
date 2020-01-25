module.exports = {
  insertRequest: (requisicao, con, callback) => {
    con.query("insert into requisicao_muda(data, admin_idadmin,muda_idmuda, qtd_requisitada , usuario_idusuario, status) values (CURRENT_DATE(), " + requisicao.idAdmin + ", " + requisicao.idMuda + ", " + requisicao.qtdMuda + "," + requisicao.idUsuario + ", 'N'" + ");", callback);
  }
}