// Auto-generated. Do not edit!

// (in-package pracs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class fuse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.roll = null;
      this.yaw = null;
      this.pitch = null;
      this.len = null;
      this.ranges = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = [];
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = [];
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = [];
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = [];
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = [];
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = [];
      }
      if (initObj.hasOwnProperty('len')) {
        this.len = initObj.len
      }
      else {
        this.len = 0;
      }
      if (initObj.hasOwnProperty('ranges')) {
        this.ranges = initObj.ranges
      }
      else {
        this.ranges = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type fuse
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _arraySerializer.float64(obj.x, buffer, bufferOffset, null);
    // Serialize message field [y]
    bufferOffset = _arraySerializer.float64(obj.y, buffer, bufferOffset, null);
    // Serialize message field [z]
    bufferOffset = _arraySerializer.float64(obj.z, buffer, bufferOffset, null);
    // Serialize message field [roll]
    bufferOffset = _arraySerializer.float64(obj.roll, buffer, bufferOffset, null);
    // Serialize message field [yaw]
    bufferOffset = _arraySerializer.float64(obj.yaw, buffer, bufferOffset, null);
    // Serialize message field [pitch]
    bufferOffset = _arraySerializer.float64(obj.pitch, buffer, bufferOffset, null);
    // Serialize message field [len]
    bufferOffset = _serializer.uint64(obj.len, buffer, bufferOffset);
    // Serialize message field [ranges]
    bufferOffset = _arraySerializer.float32(obj.ranges, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type fuse
    let len;
    let data = new fuse(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [y]
    data.y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [z]
    data.z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [roll]
    data.roll = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [yaw]
    data.yaw = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pitch]
    data.pitch = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [len]
    data.len = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [ranges]
    data.ranges = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.x.length;
    length += 8 * object.y.length;
    length += 8 * object.z.length;
    length += 8 * object.roll.length;
    length += 8 * object.yaw.length;
    length += 8 * object.pitch.length;
    length += 4 * object.ranges.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pracs/fuse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c7e2b56ed2ef8d6297b44c35edd8ada3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #class $(file_name):
    #          type file_name.attr1 = var_name1
    #		   type file_name.attr2 = var_name2
    
    
    #rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
    #rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
    #echo "field type variable" > msg/$(FILE.msg)       ##For Writing 
    
    #AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg
    #FIELD_TYPE VARIABLE Format
    
    Header header		#seq, time_stamp, id
    float64[] x
    float64[] y
    float64[] z
    
    
    float64[] roll
    float64[] yaw
    float64[] pitch
    uint64 len
    
    float32[] ranges
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new fuse(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = []
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = []
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = []
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = []
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = []
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = []
    }

    if (msg.len !== undefined) {
      resolved.len = msg.len;
    }
    else {
      resolved.len = 0
    }

    if (msg.ranges !== undefined) {
      resolved.ranges = msg.ranges;
    }
    else {
      resolved.ranges = []
    }

    return resolved;
    }
};

module.exports = fuse;
