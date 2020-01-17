const mudasModel = require('../models/mudasModel')

module.exports = {
  showMudas: function (req, res) {
    mudasModel.showMudas(req.con, function (err, rows) {
      res.render("requests", { mudas: rows })
    })
  },
  showRequest: function (req, res) {
    mudasModel.showMudas(req.con, function (err, rows) {
      res.json(req.body);
    })
  },
  addMuda: function (req, res) {
    const state = {
      nome: req.body.nome,
      tipoUnitario: req.body.tipo_unitario,
      valor: req.body.valor_unitario,
      estoqueMinimo: req.body.estoque_minimo,
      estoqueAtual: req.body.estoque_atual,
    }

    mudasModel.insertMuda(state, req.con, (err, rows) => {
      if (err) {
        alert("Algum erro ocorreu!")
      }
    })
    res.redirect('registerSeedling');
  },
  renderAddMudaPage: function (req, res) {
    res.render('registerSeedling')
  },
  updateMuda: (req, res) => {
    res.render('updateMuda')
  }
}
