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
    console.log(req.body);
    /*mudasModel.insertMuda(muda, req.con, (err, rows) => {
      res.redirect('registerSeedling')
    })*/
  },
  renderAddMudaPage: function (req, res) {
    res.render('registerSeedling')
  }
}
