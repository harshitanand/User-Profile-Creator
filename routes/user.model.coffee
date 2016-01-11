mongoose = require 'mongoose'
Schema = mongoose.Schema
uniqueValidator = require 'mongoose-unique-validator'

UserSchema = new Schema(
  userid: {type: String, unique: true}
  name: String
  gender: String
  dob: {type: Date , default: new Date()}
  hobies: Array
  comments: [{
    comment:String
    created_at:
      type: Date
      default: Date.now
  }]
)
UserSchema.plugin uniqueValidator
module.exports = mongoose.model('user', UserSchema)

