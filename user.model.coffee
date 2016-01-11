mongoose = require('mongoose')
Schema = mongoose.Schema

UserSchema = new Schema(
  name: String
  gender: String
  dob: {type: Date , default: new Date()}
  hobies: Array,
  comments: [{
    comment:String, 
    created_at:{type: Date, default: new Date()}
  }]
)

module.exports = mongoose.model('User', UserSchema)

