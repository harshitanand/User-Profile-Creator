controller = require './user.controller'
user = (app)->

  app.get '/all', (req, res) ->
    controller.index req.params, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response

  app.get '/:userid', (req, res) ->
    controller.showuser req.params, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response

  app.get '/pic/:userid', (req, res) ->
    controller.showpic req.params, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.contentType response.img.contentType
      res.send response.img.data

  app.delete '/pic/:userid', (req, res)->
    controller.deletepic req.params, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response

  app.post '/', (req, res) ->
    controller.create req.body, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response

  app.delete '/', (req, res) ->
    controller.deleteall req.body, (response)->
      res.header "Access-Control-Allow-Origin", "*"
      res.send response

module.exports = user
