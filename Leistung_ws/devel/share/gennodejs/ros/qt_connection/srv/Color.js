// Auto-generated. Do not edit!

// (in-package qt_connection.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ColorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color_req = null;
    }
    else {
      if (initObj.hasOwnProperty('color_req')) {
        this.color_req = initObj.color_req
      }
      else {
        this.color_req = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ColorRequest
    // Serialize message field [color_req]
    bufferOffset = _serializer.string(obj.color_req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColorRequest
    let len;
    let data = new ColorRequest(null);
    // Deserialize message field [color_req]
    data.color_req = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.color_req.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/ColorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd72079bb2595441aea2407dc5c59d06c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string color_req
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ColorRequest(null);
    if (msg.color_req !== undefined) {
      resolved.color_req = msg.color_req;
    }
    else {
      resolved.color_req = ''
    }

    return resolved;
    }
};

class ColorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finish = null;
    }
    else {
      if (initObj.hasOwnProperty('finish')) {
        this.finish = initObj.finish
      }
      else {
        this.finish = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ColorResponse
    // Serialize message field [finish]
    bufferOffset = _serializer.bool(obj.finish, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColorResponse
    let len;
    let data = new ColorResponse(null);
    // Deserialize message field [finish]
    data.finish = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/ColorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '474a58dbb494a45bb1ca99544cd64e45';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool finish
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ColorResponse(null);
    if (msg.finish !== undefined) {
      resolved.finish = msg.finish;
    }
    else {
      resolved.finish = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ColorRequest,
  Response: ColorResponse,
  md5sum() { return 'da328168331556f954624b109b527cef'; },
  datatype() { return 'qt_connection/Color'; }
};
