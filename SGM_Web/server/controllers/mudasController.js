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
  }
}
