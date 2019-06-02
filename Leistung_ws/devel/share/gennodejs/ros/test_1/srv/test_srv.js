// Auto-generated. Do not edit!

// (in-package test_1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class test_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_text = null;
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('input_text')) {
        this.input_text = initObj.input_text
      }
      else {
        this.input_text = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('input')) {
        this.input = initObj.input
      }
      else {
        this.input = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type test_srvRequest
    // Serialize message field [input_text]
    bufferOffset = std_msgs.msg.String.serialize(obj.input_text, buffer, bufferOffset);
    // Serialize message field [input]
    bufferOffset = _serializer.int64(obj.input, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type test_srvRequest
    let len;
    let data = new test_srvRequest(null);
    // Deserialize message field [input_text]
    data.input_text = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [input]
    data.input = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.input_text);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'test_1/test_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd038a94240ddf47bff3002f74ee7ec8b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String input_text
    int64       input
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new test_srvRequest(null);
    if (msg.input_text !== undefined) {
      resolved.input_text = std_msgs.msg.String.Resolve(msg.input_text)
    }
    else {
      resolved.input_text = new std_msgs.msg.String()
    }

    if (msg.input !== undefined) {
      resolved.input = msg.input;
    }
    else {
      resolved.input = 0
    }

    return resolved;
    }
};

class test_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_text = null;
      this.output = null;
    }
    else {
      if (initObj.hasOwnProperty('output_text')) {
        this.output_text = initObj.output_text
      }
      else {
        this.output_text = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('output')) {
        this.output = initObj.output
      }
      else {
        this.output = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type test_srvResponse
    // Serialize message field [output_text]
    bufferOffset = std_msgs.msg.String.serialize(obj.output_text, buffer, bufferOffset);
    // Serialize message field [output]
    bufferOffset = _serializer.int64(obj.output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type test_srvResponse
    let len;
    let data = new test_srvResponse(null);
    // Deserialize message field [output_text]
    data.output_text = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [output]
    data.output = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.output_text);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'test_1/test_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd3c622429dd44cd796ab2bce4ea56cf9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String output_text
    int64       output
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new test_srvResponse(null);
    if (msg.output_text !== undefined) {
      resolved.output_text = std_msgs.msg.String.Resolve(msg.output_text)
    }
    else {
      resolved.output_text = new std_msgs.msg.String()
    }

    if (msg.output !== undefined) {
      resolved.output = msg.output;
    }
    else {
      resolved.output = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: test_srvRequest,
  Response: test_srvResponse,
  md5sum() { return '53244230a18aeabb17bd81ddb3a8f9e8'; },
  datatype() { return 'test_1/test_srv'; }
};
