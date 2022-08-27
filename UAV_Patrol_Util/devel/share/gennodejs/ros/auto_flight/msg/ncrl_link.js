// Auto-generated. Do not edit!

// (in-package auto_flight.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ncrl_link {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
      this.aux_info = null;
      this.data1 = null;
      this.data2 = null;
      this.data3 = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
      if (initObj.hasOwnProperty('aux_info')) {
        this.aux_info = initObj.aux_info
      }
      else {
        this.aux_info = '';
      }
      if (initObj.hasOwnProperty('data1')) {
        this.data1 = initObj.data1
      }
      else {
        this.data1 = 0.0;
      }
      if (initObj.hasOwnProperty('data2')) {
        this.data2 = initObj.data2
      }
      else {
        this.data2 = 0.0;
      }
      if (initObj.hasOwnProperty('data3')) {
        this.data3 = initObj.data3
      }
      else {
        this.data3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ncrl_link
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    // Serialize message field [aux_info]
    bufferOffset = _serializer.string(obj.aux_info, buffer, bufferOffset);
    // Serialize message field [data1]
    bufferOffset = _serializer.float32(obj.data1, buffer, bufferOffset);
    // Serialize message field [data2]
    bufferOffset = _serializer.float32(obj.data2, buffer, bufferOffset);
    // Serialize message field [data3]
    bufferOffset = _serializer.float32(obj.data3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ncrl_link
    let len;
    let data = new ncrl_link(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [aux_info]
    data.aux_info = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [data1]
    data.data1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [data2]
    data.data2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [data3]
    data.data3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.mode.length;
    length += object.aux_info.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'auto_flight/ncrl_link';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '07c672e9218196d466a602767f407d91';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string mode
    string aux_info
    float32 data1
    float32 data2
    float32 data3
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ncrl_link(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    if (msg.aux_info !== undefined) {
      resolved.aux_info = msg.aux_info;
    }
    else {
      resolved.aux_info = ''
    }

    if (msg.data1 !== undefined) {
      resolved.data1 = msg.data1;
    }
    else {
      resolved.data1 = 0.0
    }

    if (msg.data2 !== undefined) {
      resolved.data2 = msg.data2;
    }
    else {
      resolved.data2 = 0.0
    }

    if (msg.data3 !== undefined) {
      resolved.data3 = msg.data3;
    }
    else {
      resolved.data3 = 0.0
    }

    return resolved;
    }
};

module.exports = ncrl_link;
