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

class EgoPosRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_req = null;
      this.y_req = null;
    }
    else {
      if (initObj.hasOwnProperty('x_req')) {
        this.x_req = initObj.x_req
      }
      else {
        this.x_req = 0.0;
      }
      if (initObj.hasOwnProperty('y_req')) {
        this.y_req = initObj.y_req
      }
      else {
        this.y_req = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EgoPosRequest
    // Serialize message field [x_req]
    bufferOffset = _serializer.float64(obj.x_req, buffer, bufferOffset);
    // Serialize message field [y_req]
    bufferOffset = _serializer.float64(obj.y_req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EgoPosRequest
    let len;
    let data = new EgoPosRequest(null);
    // Deserialize message field [x_req]
    data.x_req = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_req]
    data.y_req = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/EgoPosRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6c19bf3803c700f7e253d9b425e76cd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x_req
    float64 y_req
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EgoPosRequest(null);
    if (msg.x_req !== undefined) {
      resolved.x_req = msg.x_req;
    }
    else {
      resolved.x_req = 0.0
    }

    if (msg.y_req !== undefined) {
      resolved.y_req = msg.y_req;
    }
    else {
      resolved.y_req = 0.0
    }

    return resolved;
    }
};

class EgoPosResponse {
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
    // Serializes a message object of type EgoPosResponse
    // Serialize message field [finish]
    bufferOffset = _serializer.bool(obj.finish, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EgoPosResponse
    let len;
    let data = new EgoPosResponse(null);
    // Deserialize message field [finish]
    data.finish = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'qt_connection/EgoPosResponse';
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
    const resolved = new EgoPosResponse(null);
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
  Request: EgoPosRequest,
  Response: EgoPosResponse,
  md5sum() { return 'c0407d004a1efa7e56d28b80616e7c3e'; },
  datatype() { return 'qt_connection/EgoPos'; }
};
