const usuarioModel = require('../models/usuarioModel')

module.exports = {
  renderLoginPage: (req, res) => {
    res.render('login', { message: '' })
  },
  login: (req, res) => {
    if ((req.body.matricula != '') || (req.body.password != '')) {
      console.log('entro aqui')
      const usuario = {
        matricula: req.body.matricula,
        senha: req.body.password
      }

      usuarioModel.searchUsuario(usuario, req.con, (err, rows) => {
        if (rows.length > 0) { // ele encontrou alguma coisa
          req.session.loggedin = true;
          req.session.username = rows.nome;
          res.redirect('/dashboard')
        }
        else if (rows.length == 0) { // o usuario nao digitou nada 
          req.flash('erro1', 'Usuário não encontrado')
          res.render('login', { message: req.flash('erro1') })
        }
      })
    }
    else {
      req.flash('error2', 'Preencha os campos corretamente!');
      res.render('login', { message: 'Preencha os campos corretamente' })
    }
  }
}