// Auto-generated. Do not edit!

// (in-package ecobot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ussensor_mngtRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sensor_id = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('sensor_id')) {
        this.sensor_id = initObj.sensor_id
      }
      else {
        this.sensor_id = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ussensor_mngtRequest
    // Serialize message field [sensor_id]
    bufferOffset = _serializer.int8(obj.sensor_id, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ussensor_mngtRequest
    let len;
    let data = new ussensor_mngtRequest(null);
    // Deserialize message field [sensor_id]
    data.sensor_id = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ecobot/ussensor_mngtRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e710790685e45ee98b3e6c415ff8fdb6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Mybot ultrasound sensors management message
    # 
    #  - message: should be either ACTIVATE, DEACTIVATE or STATUS
    #  - sensor_id: ID of the US sensor to activate or deactivate. 
    #  - response: a short message confirming the action of the service
    #  - deactivated_id: a list of US sensor IDS that have been deactivated
    
    int8 sensor_id
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ussensor_mngtRequest(null);
    if (msg.sensor_id !== undefined) {
      resolved.sensor_id = msg.sensor_id;
    }
    else {
      resolved.sensor_id = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

class ussensor_mngtResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
      this.deactivated_id = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = '';
      }
      if (initObj.hasOwnProperty('deactivated_id')) {
        this.deactivated_id = initObj.deactivated_id
      }
      else {
        this.deactivated_id = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ussensor_mngtResponse
    // Serialize message field [response]
    bufferOffset = _serializer.string(obj.response, buffer, bufferOffset);
    // Serialize message field [deactivated_id]
    bufferOffset = _arraySerializer.int8(obj.deactivated_id, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ussensor_mngtResponse
    let len;
    let data = new ussensor_mngtResponse(null);
    // Deserialize message field [response]
    data.response = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [deactivated_id]
    data.deactivated_id = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.response);
    length += object.deactivated_id.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ecobot/ussensor_mngtResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '05c06354f3bbf9f7662849c88e93e3f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string response
    int8[] deactivated_id
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ussensor_mngtResponse(null);
    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = ''
    }

    if (msg.deactivated_id !== undefined) {
      resolved.deactivated_id = msg.deactivated_id;
    }
    else {
      resolved.deactivated_id = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ussensor_mngtRequest,
  Response: ussensor_mngtResponse,
  md5sum() { return '4c3193c5a00d0932168fd4da30077568'; },
  datatype() { return 'ecobot/ussensor_mngt'; }
};
