// Auto-generated. Do not edit!

// (in-package pracs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class mysrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mysrvRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mysrvRequest
    let len;
    let data = new mysrvRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pracs/mysrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1f3d28f1b044c871e6eff2e9fc3c667';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #rossrv show     $(PACKAGE)/$(FILE.srv)				##For Reading
    #rossrv show -r  $(PACKAGE)/$(FILE.srv)				##For Reading Raw
    #echo "field type variable" > srv/$(FILE.srv)       ##For Writing 
    
    #AFTER EDITING, cd ~/catkin_ws; catkin_make #compile srv
    
    #FIELD_TYPE VARIABLE Format
    
    #REQUEST
    #-------------
    #RESPONSE
    
    
    string name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mysrvRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    return resolved;
    }
};

class mysrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.age = null;
      this.weight = null;
    }
    else {
      if (initObj.hasOwnProperty('age')) {
        this.age = initObj.age
      }
      else {
        this.age = 0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mysrvResponse
    // Serialize message field [age]
    bufferOffset = _serializer.int64(obj.age, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float32(obj.weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mysrvResponse
    let len;
    let data = new mysrvResponse(null);
    // Deserialize message field [age]
    data.age = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pracs/mysrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b79a26fc44475a6d048da6b804d5f69';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 	age
    float32 weight
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mysrvResponse(null);
    if (msg.age !== undefined) {
      resolved.age = msg.age;
    }
    else {
      resolved.age = 0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: mysrvRequest,
  Response: mysrvResponse,
  md5sum() { return '043c37660891c202c07ae9cb667631f0'; },
  datatype() { return 'pracs/mysrv'; }
};
