const requisicaoModel = require('../models/requisicaoModel')

module.exports = {
  insertRequest: function (req, res) {
    let qtd = req.body.selectedMuda.length;

    if (!Array.isArray(req.body.selectedMuda)) {
      qtd = 1;
    }

    //console.log("tamanho do array: ", qtd);
    //console.log(req.body)
    for (let i = 0; i < qtd; i++) {
      const reqActual = {
        idAdmin: 1,
        idUsuario: 4,
        idMuda: qtd == 1 ? req.body.selectedMuda : req.body.selectedMuda[i], // vetor [ids]
        qtdMuda: req.body.requestsQtdMuda[i] // vetor
      }

      if (reqActual.qtdMuda == '') { // recebe o proximo
        reqActual.qtdMuda = req.body.requestsQtdMuda[i + 1];
      }

      console.log("adicionando; ", reqActual);

      requisicaoModel.insertRequest(reqActual, req.con, function (err, result) {
        if (err) {
          allert("Ops! Algo de errado aconteceu!");
        }
      })
    }
    // redirect para uma pagina de sucesso
    res.redirect('requisicao')
  }
}