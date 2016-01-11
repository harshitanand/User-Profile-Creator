routes = (app) =>

  app.get '/', (req, res) =>
    console.log "/ entered"
    res.render "index"

module.exports = routes