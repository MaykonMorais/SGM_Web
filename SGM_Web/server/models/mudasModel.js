module.exports = {
  showMudas: (con, callback) => {
    con.query("SELECT * FROM muda", callback)
  }
}