// Auto-generated. Do not edit!

// (in-package turtle_vis.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class send_desired_poseRequest {
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
    // Serializes a message object of type send_desired_poseRequest
    // Serialize message field [x_d]
    bufferOffset = _serializer.float64(obj.x_d, buffer, bufferOffset);
    // Serialize message field [y_d]
    bufferOffset = _serializer.float64(obj.y_d, buffer, bufferOffset);
    // Serialize message field [theta_d]
    bufferOffset = _serializer.float64(obj.theta_d, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type send_desired_poseRequest
    let len;
    let data = new send_desired_poseRequest(null);
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
    return 'turtle_vis/send_desired_poseRequest';
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
    const resolved = new send_desired_poseRequest(null);
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

class send_desired_poseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type send_desired_poseResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.int64(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type send_desired_poseResponse
    let len;
    let data = new send_desired_poseResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_vis/send_desired_poseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '60413af40da7a072a76f2e1c4dc15e92';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 reply
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new send_desired_poseResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: send_desired_poseRequest,
  Response: send_desired_poseResponse,
  md5sum() { return 'b8f8ee9846ae8a247d46d7c174e53baa'; },
  datatype() { return 'turtle_vis/send_desired_pose'; }
};
