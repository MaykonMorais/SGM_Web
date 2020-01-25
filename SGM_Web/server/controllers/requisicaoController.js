const requisicaoModel = require('../models/requisicaoModel')

module.exports = {
  insertRequest: function (req, res) {
    let qtd = req.body.selectedMuda.length;

    if (!Array.isArray(req.body.selectedMuda)) {
      qtd = 1;
    }
    else {
      for (var i = qtd - 1; i >= 0; i--) {
        if (req.body.requestsQtdMuda[i] === '') {
          req.body.requestsQtdMuda.splice(i, 1);
        }
      }
    }
    console.log(req.body)

    //console.log("tamanho do array: ", qtd);
    //console.log(req.body)
    for (let i = 0; i < qtd; i++) {
      const reqActual = {
        idAdmin: 1,
        idUsuario: 4,
        idMuda: qtd == 1 ? req.body.selectedMuda : req.body.selectedMuda[i], // vetor [ids]
        qtdMuda: req.body.requestsQtdMuda[i] // vetor
      }

      requisicaoModel.insertRequest(reqActual, req.con, function (err, result) {
        if (err) {
          console.log(err);
        }
      })
    }
    // redirect para uma pagina de sucesso
    res.redirect('requisicao')
  }
}