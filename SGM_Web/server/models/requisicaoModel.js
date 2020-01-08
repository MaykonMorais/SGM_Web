module.exports = {
  insertRequest: (requisicao, con, callback) => {
    con.query("insert into requisicao_muda(data, admin_idadmin,muda_idmuda, usuario_idusuario) values (CURRENT_DATE, " + requisicao.idmuda + ", " + requisicao.idAdmin + "," + requisicao.idUsuario + ");", callback);
  }
}