mongoose = require 'mongoose'
Schema = mongoose.Schema
uniqueValidator = require 'mongoose-unique-validator'

PicSchema = new Schema(
  userid: {type: String, unique: true}
  img: {data: Buffer, contentType: String}
)
PicSchema.plugin uniqueValidator
module.exports = mongoose.model('profilepicture', PicSchema)
