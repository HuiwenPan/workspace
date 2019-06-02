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

class AbRatioRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ratio_req = null;
    }
    else {
      if (initObj.hasOwnProperty('ratio_req')) {
        this.ratio_req = initObj.ratio_req
      }
      else {
        this.ratio_req = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AbRatioRequest
    // Serialize message field [ratio_req]
    bufferOffset = _serializer.float64(obj.ratio_req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AbRatioRequest
    let len;
    let data = new AbRatioRequest(null);
    // Deserialize message field [ratio_req]
    data.ratio_req = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/AbRatioRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6371066b87b865d209aa230ed733dffc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 ratio_req
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AbRatioRequest(null);
    if (msg.ratio_req !== undefined) {
      resolved.ratio_req = msg.ratio_req;
    }
    else {
      resolved.ratio_req = 0.0
    }

    return resolved;
    }
};

class AbRatioResponse {
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
    // Serializes a message object of type AbRatioResponse
    // Serialize message field [finish]
    bufferOffset = _serializer.bool(obj.finish, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AbRatioResponse
    let len;
    let data = new AbRatioResponse(null);
    // Deserialize message field [finish]
    data.finish = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/AbRatioResponse';
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
    const resolved = new AbRatioResponse(null);
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
  Request: AbRatioRequest,
  Response: AbRatioResponse,
  md5sum() { return '61c5d5487d6721936edcd8f3bcc6605b'; },
  datatype() { return 'qt_connection/AbRatio'; }
};
