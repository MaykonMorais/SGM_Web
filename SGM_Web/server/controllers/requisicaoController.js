const requisicaoModel = require('../models/requisicaoModel')

module.exports = {
  insertRequest: function (req, res) {
    // parametros que devem está no headers para requisitar
    req.body.idAdmin = 1;
    req.body.idUsuario = 4;

    requisicaoModel.insertRequest(req.body, req.con, function (err, result) {
      res.json(res.body);
    })
  }
}