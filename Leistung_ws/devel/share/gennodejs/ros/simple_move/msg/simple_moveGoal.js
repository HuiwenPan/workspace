// Auto-generated. Do not edit!

// (in-package simple_move.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class simple_moveGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_pose')) {
        this.goal_pose = initObj.goal_pose
      }
      else {
        this.goal_pose = new geometry_msgs.msg.Pose2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type simple_moveGoal
    // Serialize message field [goal_pose]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.goal_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type simple_moveGoal
    let len;
    let data = new simple_moveGoal(null);
    // Deserialize message field [goal_pose]
    data.goal_pose = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simple_move/simple_moveGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9c696f8357da6184167237a9d05c73bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Define the goal
    geometry_msgs/Pose2D goal_pose  
    
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
    const resolved = new simple_moveGoal(null);
    if (msg.goal_pose !== undefined) {
      resolved.goal_pose = geometry_msgs.msg.Pose2D.Resolve(msg.goal_pose)
    }
    else {
      resolved.goal_pose = new geometry_msgs.msg.Pose2D()
    }

    return resolved;
    }
};

module.exports = simple_moveGoal;
