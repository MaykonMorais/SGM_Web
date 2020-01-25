
module.exports = {
  searchUsuario: (usuario, con, callback) => {
    con.query("select * from usuario where matricula = '" + usuario.matricula + "' and senha='" + usuario.senha + "'", callback);
  }
}