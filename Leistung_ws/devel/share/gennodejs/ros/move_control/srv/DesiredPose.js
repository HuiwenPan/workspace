// Auto-generated. Do not edit!

// (in-package move_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class DesiredPoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_d = null;
      this.y_d = null;
      this.theta_d = null;
    }
    else {
      if (initObj.hasOwnProperty('x_d')) {
        this.x_d = initObj.x_d
      }
      else {
        this.x_d = 0.0;
      }
      if (initObj.hasOwnProperty('y_d')) {
        this.y_d = initObj.y_d
      }
      else {
        this.y_d = 0.0;
      }
      if (initObj.hasOwnProperty('theta_d')) {
        this.theta_d = initObj.theta_d
      }
      else {
        this.theta_d = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DesiredPoseRequest
    // Serialize message field [x_d]
    bufferOffset = _serializer.float64(obj.x_d, buffer, bufferOffset);
    // Serialize message field [y_d]
    bufferOffset = _serializer.float64(obj.y_d, buffer, bufferOffset);
    // Serialize message field [theta_d]
    bufferOffset = _serializer.float64(obj.theta_d, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DesiredPoseRequest
    let len;
    let data = new DesiredPoseRequest(null);
    // Deserialize message field [x_d]
    data.x_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_d]
    data.y_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_d]
    data.theta_d = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'move_control/DesiredPoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93023edf62509f0c837bd28a9edfe755';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x_d
    float64 y_d
    float64 theta_d
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DesiredPoseRequest(null);
    if (msg.x_d !== undefined) {
      resolved.x_d = msg.x_d;
    }
    else {
      resolved.x_d = 0.0
    }

    if (msg.y_d !== undefined) {
      resolved.y_d = msg.y_d;
    }
    else {
      resolved.y_d = 0.0
    }

    if (msg.theta_d !== undefined) {
      resolved.theta_d = msg.theta_d;
    }
    else {
      resolved.theta_d = 0.0
    }

    return resolved;
    }
};

class DesiredPoseResponse {
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
    // Serializes a message object of type DesiredPoseResponse
    // Serialize message field [finish]
    bufferOffset = _serializer.bool(obj.finish, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DesiredPoseResponse
    let len;
    let data = new DesiredPoseResponse(null);
    // Deserialize message field [finish]
    data.finish = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'move_control/DesiredPoseResponse';
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
    const resolved = new DesiredPoseResponse(null);
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
  Request: DesiredPoseRequest,
  Response: DesiredPoseResponse,
  md5sum() { return '0a875362d8b56b739c21258a4954ddeb'; },
  datatype() { return 'move_control/DesiredPose'; }
};
