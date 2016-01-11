User = require './user.model'
ProfilePic = require './user.picmodel'
fs = require 'fs'
crypto = require 'crypto'

class UserProfile
  create:(incoming, callback) ->
    incoming.userid = crypto.randomBytes(15).toString('hex')
    if incoming.imageurl?
      format = incoming.imageurl.split '.'
      pic = new ProfilePic
      pic.img.data = fs.readFileSync incoming.imageurl
      pic.img.contentType = 'image/'+format[1]
      pic.userid = incoming.userid
      delete incoming.imageurl
    
      pic.save (err,data)->
        if err?
          callback err

    User.create incoming, (err, user)->
      if err?
        callback JSON.stringify {status:"Failed", message:"Duplicate Entry"}
      else
        callback JSON.stringify {status:"Success", data:user}

  index:(incoming, callback)->
    User.find (err, users)->
      if err
        callback "No User Found"
      else
        callback JSON.stringify {status:"Success", data:users}

  deleteall:(incoming, callback)->
      ProfilePic.remove {}, (err, del)->
        if err
          callback err

      User.remove {}, (err, del)->
        if err?
          callback "Can't delete all users"
        else
          callback del

  showuser:(incoming, callback)->
    User.findOne incoming,(err, user)->
      if err
        callback "No User Found"
      else
        callback JSON.stringify {status:"Success", data:user}

  showpic:(incoming, callback)->
    ProfilePic.findOne incoming, (err, pic)->
      if err
        callback "No image Found"
      else
        callback pic

  deletepic: (incoming, callback)->
    ProfilePic.remove {userid:incoming.userid}, (err,del)->
      if err?
        callback JSON.stringify {status:"Failed", message:"Error ocuured in finding"}
      else
        callback JSON.stringify {status:"Failed", data:del}

module.exports = new UserProfile()
