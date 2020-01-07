var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var bodyParser = require("body-parser");
//var logger = require("morgan");
var route_login = require("./routes/route-login");
var route_register = require("./routes/route-register");
var route_dashboard = require("./routes/route-dashboard");
var route_charts = require("./routes/route-charts");
var route_requisicao = require("./routes/route-requisicao");
var route_register_seedling = require("./routes/route-register-seedling");
var route_allow_register = require("./routes/route-allow-register");
var root_router = require('./routes/route-root');

const connection = require('./config/database')

var app = express();

//  connection with database
app.use((req, res, next) => {
  req.con = connection;
  console.log("Conexao estabelecida com sucesso")
  next()
})


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

app.use(route_charts);
app.use(route_requisicao);
app.use("/registerseedling", route_register_seedling);
app.use(route_allow_register);
app.use(root_router);


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

module.exports = app;
