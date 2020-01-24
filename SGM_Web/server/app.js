var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var bodyParser = require("body-parser");
const session = require('express-session')
//var logger = require("morgan");
const route_login = require("./routes/route-login");
const route_register = require("./routes/route-register");
const route_dashboard = require("./routes/route-dashboard");
const route_charts = require("./routes/route-charts");
const route_requisicao = require("./routes/route-requisicao");
const route_register_seedling = require("./routes/route-register-seedling");
const route_allow_register = require("./routes/route-allow-register");
const root_router = require('./routes/route-root');
const route_update_muda = require('./routes/update-muda-route')
const route_delete_muda = require('./routes/delete-muda-route')
const passport = require('passport')
require('./config/auth')(passport)
const flash = require('connect-flash');

const connection = require('./config/database')

var app = express();

//  connection with database
app.use((req, res, next) => {
  req.con = connection;
  //console.log("Conexao estabelecida com sucesso")
  next()
})

// criar session
app.use(session({
  secret: 'session-auth',
  resave: true,
  saveUninitialized: true
}))

app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()) // usando flash

// Configuração das views
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");
//app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

//routes
app.use(route_login);
app.use(route_register);
app.use(route_dashboard);
app.use(route_update_muda)
app.use(route_charts);
app.use(route_requisicao);
app.use(route_register_seedling);
app.use(route_allow_register);
app.use(root_router);
app.use(route_delete_muda)


// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app, passport;
