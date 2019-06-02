// Auto-generated. Do not edit!

// (in-package simple_move.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class simple_move_serverRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Execute = null;
    }
    else {
      if (initObj.hasOwnProperty('Execute')) {
        this.Execute = initObj.Execute
      }
      else {
        this.Execute = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type simple_move_serverRequest
    // Serialize message field [Execute]
    bufferOffset = _serializer.bool(obj.Execute, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type simple_move_serverRequest
    let len;
    let data = new simple_move_serverRequest(null);
    // Deserialize message field [Execute]
    data.Execute = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'simple_move/simple_move_serverRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fa4d8c189352d1ea690d00f17f0a28b5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool  Execute
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new simple_move_serverRequest(null);
    if (msg.Execute !== undefined) {
      resolved.Execute = msg.Execute;
    }
    else {
      resolved.Execute = false
    }

    return resolved;
    }
};

class simple_move_serverResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.final_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('final_pose')) {
        this.final_pose = initObj.final_pose
      }
      else {
        this.final_pose = new geometry_msgs.msg.Pose2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type simple_move_serverResponse
    // Serialize message field [final_pose]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.final_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type simple_move_serverResponse
    let len;
    let data = new simple_move_serverResponse(null);
    // Deserialize message field [final_pose]
    data.final_pose = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'simple_move/simple_move_serverResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b03b05e2f5c62e96e4cec4715bf432f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose2D final_pose
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new simple_move_serverResponse(null);
    if (msg.final_pose !== undefined) {
      resolved.final_pose = geometry_msgs.msg.Pose2D.Resolve(msg.final_pose)
    }
    else {
      resolved.final_pose = new geometry_msgs.msg.Pose2D()
    }

    return resolved;
    }
};

module.exports = {
  Request: simple_move_serverRequest,
  Response: simple_move_serverResponse,
  md5sum() { return '05a3b190b2a3e8da10e3d0069fe74dbc'; },
  datatype() { return 'simple_move/simple_move_server'; }
};
