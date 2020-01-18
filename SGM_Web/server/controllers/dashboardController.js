module.exports = {
  renderDashboard: (req, res) => {
    console.log('entrei na rota')
    res.render('dashboard')
  }
}