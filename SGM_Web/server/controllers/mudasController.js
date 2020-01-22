const mudasModel = require('../models/mudasModel')

module.exports = {
  showMudas: function (req, res) {
    mudasModel.showMudas(req.con, function (err, rows) {
      console.log(rows)
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

  renderUpdateMuda: (req, res) => {
    res.render('updateMuda', { muda: [] })
  },

  updateMuda: (req, res) => {
    const state = {
      idMuda: req.body.idmuda,
      nome: req.body.nome,
      tipoUnitario: req.body.tipo_unitario,
      valor: req.body.valor_unitario,
      estoqueMinimo: req.body.estoque_minimo,
      estoqueAtual: req.body.estoque_atual,
    }

    console.log('Estou passando para atualizar: ', req.body)
    mudasModel.updateMuda(state, req.con, (err, rows) => {
      if (err) {
        console.log(err)
      }
    })
    res.render('updateMuda', { muda: [] })
  },

  // analisar
  searchMuda: (req, res) => {
    const muda = { nome: req.query.nome }

    mudasModel.searchMuda(muda, req.con, (err, rows) => {
      const result = JSON.parse(JSON.stringify(rows));

      if (result[0] != undefined) {
        //console.log(result[0])
        res.render('updateMuda', { muda: result[0] })
      }

      else {
        mudaEncontrada = {
          idMuda: 0,
          nome: 'undefined',
          valor: 0,
          tipo_unitario: '',
          estoque_minimo: 0,
          estoque_atual: 0
        };
        res.render('updateMuda', { muda: mudaEncontrada })
      };
    })
  }
}
