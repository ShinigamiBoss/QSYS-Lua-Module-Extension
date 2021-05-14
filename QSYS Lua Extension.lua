--[[
 * QSYS Lua Extension
 *
 * Copyright (c) Fabio Feliciosi
 * All rights reserved.
 *
 * MIT License
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation files (the "Software"), to deal in the Software
 * without restriction, including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
 * to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 
 ]]--

 --[[
     If you like my work feel free to contact me via email: fabio.freelance.boss@gmail.com
     Please consider donating for more work and projects: https://www.paypal.com/donate?hosted_button_id=7RTFJYWREF8PW&source=url
 ]]--

--Component object
Component = {}
--Component class functions
--Create a Named Component reference in your script.
function Component:New() end
--Create a Named Component reference in your script by name referecene
function Component:New(Name)
    Component = Name
end
--Returns a table of all controls in the specified Named Component.
function Component:GetControls() end

--Create a Control IO object
Controls =
{
    --Rappresent an input
    Inputs =
    {
        [1] = {
            --Floating point value of control. If you pass in a Boolean ( like Controls.Outputs[1].Value = true ) it is converted to either a 0 ( false ) or 1 ( true ).
            Value = 0,
            --Table of floating point values of controls. Only used when connected to controls that create tables of values such as the 2D panner, RTA - Band-Pass or Responsalyzer, Meters.
            Values = {},
            --floating point position which goes from 0.0 -> 1.0 
            Position = 0,
            --Control input string
            String = "",
            --returns true if the position of the control is >0.5
            Boolean = false,
            --index of control.
            Index = 1,
        }
    },
    --Rappresent an output
    Outputs =
    {
        [1] = {
            --floating point value of control 
            Value = 0,
            --floating point position which goes from 0.0 -> 1.0 
            Position = 0,
            --string representation of control value 
            String = "",
            --defaults to 0 seconds
            RampTime = 0,
            --index of control 
            Index = 1,
            --string representing the Legend of a button or a fader.
            Legend = ""
        }
    },

    IsInvisible = false,
    IsDisabled = false,
    IsIndeterminate = false,
    --Set the control color
    Color = "",
    --List of choices for a control 
    Choices = {},
    Legend = ""
}

--called when input value changes
function Controls.EventHandler() end
--Triggers the output
function Controls.Outputs.Trigger() end

--Channel group
--Used when a Control Script is located inside a Channel Group.  The .Index property is used to determine which Channel Group is currently selected.
ChannelGroup = 
{
    Index = 1
}

--Crypto object used to encode and decode ASCII text strings to and from Base64, as well as obtain CRC16, HMAC, and MD5 values for specified strings.
Crypto = {}

--Compute the Base64 of a specified string.
--
--value : The value, enclosed within quotes, to encode to Base64
--pad : (Optional) Replace with true | false. If true, output is padded with '=' signs. The default is true.
function Crypto.Base64Encode( value , pad ) end

--Convert the Base64 of a specified value to a string.
--
--value : The value, enclosed within quotes, to decode from Base64.
function Crypto.Base64Decode(value) end

--Compute the CRC16 of a specified value.
--
--value : The value, enclosed within quotes, used to generate the CRC16.
function Crypto.CRC16Compute(value) end

--Compute the message digest of specified data using a specified hashing algorithm.
--
--algorithm : Replace with md5 | sha1 | sha256 | sha512 , enclosed within quotes.
--data : The data for which to compute the message authentication code, enclosed within quotes.
function Crypto.Digest(algorithm, data) end

--Compute the message authentication code of specified data using a specified hashing algorithm and key.
--
--algorithm : Replace with md5 | sha1 | sha256 | sha512 , enclosed within quotes.
--key : The secret key to use for computing the message authentication code, enclosed within quotes.
--data : The data for which to compute the message authentication code, enclosed within quotes.
function Crypto.HMAC(algorithm, key, data) end

--Compute the MD5 hash of a specified value. 
--!PLEASE NOTE THAT FOR MODERN SYSTEM MD5 ENCRYPTION IS NO MORE SECURE!
--value : The value for which to compute the MD5 hash.
function Crypto.MD5Compute(value) end

--Use the Design functions to return design status and inventory information.
Design = {
    DesignName = "",
    Platform = "",
    IsRedundant = false,
    DesignCode = "",
    Inventory = {
        [1] = 
        {
            Type = "",
            Name = "",
            Location = "",
            Model = "",
            Status =
            {
                Message = "",
                Code = 1,
            }
        }
    }
}

--Return a status table containing design information.
function Design.GetStatus() end

--Return a table of design inventory information, and the details for each inventory item.
function Design.GetInventory() end

--Use the directory commands to list folders and files, create folders, and delete folders within the media/ or design/ locations on the file system. For security and stability reasons, these are the only locations accessible by the Lua libraries.
--The media/ folder is the location for all media files, while the design/ folder is the location where uncompressed design configuration files reside while a design is being emulated or running on a Q-SYS Core processor. (It is not intended for storage of user-created design files, and is not remotely accessible.)
dir = {}

--List directories and files in a media/ or design/ path.
--path : String. Must begin with /media or design/. Surround the path with quotes.
function dir.get(path) end

--Create a new folder within a media/ or design/ path.
--path : String. Must begin with /media or design/. Surround the path with quotes.
function dir.create(path) end

--Remove an empty folder within a media/ or design/ path.
--path : String. Must begin with /media or design/. Surround the path with quotes.
--Note: The folder you are removing must be empty. See the Example section for an iterative method to remove files before removing the folder.
function dir.remove() end


--Similar to the E-mailer component, the Email library allows creation of emails directly from a Lua script.
--Note: Messages can be a maximum of 16 KB in size.
Email = {}

EmailSendTable = {
    From = "",
    Subject = "",
    Body = "",
    To = {},
    CC = {},
    Server = "",
    Password = "",
}

--Send an email using specified parameters.
--table : A table containing the details of the email to be sent. Use the EmailSendTable object as helper
function Email.Send(table) end

--function to call with status, signature is:
--'function( table, error ),' 
--table : is the table passed into Send 
--error : is a string (if error occurred) or nil.
function EmailSendTable.EventHandler(table, error) end

--Use the methods to add URL references to your Lua script. 
--Transfer data over a secure HTTP connection, or encode and decode a URL, parameters, and string data into a valid ASCII format without spaces.
HttpClient = {}

HttpDataTable = {
    Url = "",
    Headers = {},
    User = "",
    Password = "",
    Timeout = "",
}

--EventHandler to call with status.
--Signature is function( table, code, data, error, headers ). 'code' is the http return code (200 is good).
--NOTE: signature is optional, the specified parameter can be used for retrieve information about the event
function HttpDataTable.EventHandler(table, code, data, error, headers) end

--A comma-separated list of parameters containing, at minimum, a URL name. Optionally specify a port, path, and query.
UrlTable = {
    Host = "",
    Port = 80,
    Path = "",
    Query = ""
}

--Specify a URL from which to download data.
--table : A comma-separated list of parameters, use the HttpDataTable  as helper for parameters
function HttpClient.Download(table) end

--Specify a URL to which to upload data.
--table : A comma-separated list of parameters, use the HttpDataTable  as helper for parameters
function HttpClient.Upload( table ) end

--Combine URL components into a complete encoded URL string.
--table : A comma-separated list of parameters containing, at minimum, a URL name. See UrlTable as helper
function HttpClient.CreateUrl() end


--Specify a comma-separated list of parameters to encode.
--The output are the encoded parameter in HTML, example: { ["name with space"] = "blue" } will return: 'name%20with%20space=blue'
function HttpClient.EncodeParams(table) end

--Specify a string to encode.
--string : The string to encode. Example: 'Hello World' will return Hello%20World
function HttpClient.EncodeString(string) end

--Specify an encoded string to decode.
--string : The encoded string to decode. Example: 'Hello%20World' will return 'Hello World'
function HttpClient.DecodeString(string) end

--Use the JSON module to encode and decode Lua tables to and from JSON strings.
--For faster performance, and to avoid raising execution count errors with large amounts of data, use RapidJSON instead.
--To use JSON module you need to add the following to your script:
--require("json")
json = {}

--Returns the Lua object JSON encoded into a string.
--lua_object: any lua object
--DON'T FORGET TO ADD require("json") IN THE SCRIPT
function json.encode(lua_object)
    
end

--Decodes the JSON encoded data structure, and returns a Lua object with the appropriate data.
--json_string : a JSON string
--DON'T FORGET TO ADD require("json") IN THE SCRIPT
function json.decode( json_string )
    
end

--Returns a unique value that will be encoded as a null in a JSON encoding.
--DON'T FORGET TO ADD require("json") IN THE SCRIPT
function json.null()
    
end

--The Log object is used to write messages to the Core's system log file.
Log = {
    Message = "",
    Error = ""
}

--Mixer objects allow access to Mixer components that have been named in the design. 
--To create a mixer object, call Mixer.New( mixerName ). 
--The mixer object uses a string specification to determine which inputs and outputs to apply changes to. 
--The syntax supports either space or comma separated numbers, ranges of numbers or all (*). 
--It supports negation of selection with the '!' operator.
Mixer = 
{
    mixerName = ""
}

--Create a new Mixer Object
function Mixer:New( mixerName ) end

--Sets specified cross point gains with optional ramp time.
--ins : list of input
--outs : list of output
--gains : Gain value to set
--ramp : optional ramp time to get get to the selected value  
function SetCrossPointGain(ins, outs, gain, ramp)
    
end

--Sets specified cross point mutes with boolean
--ins : list of input
--outs : list of output
--mute : boolean value for mute
function SetCrossPointMute(ins, outs, mute)
    
end

--Sets specified cross point solos with boolean
--ins : list of input
--outs : list of output
--mute : boolean value for mute
function SetCrossPointSolo(ins, outs, mute)
    
end

--Sets specified cross point delay with optional ramp time
--ins : list of input
--outs : list of output
--delay: the delay value in milliseconds
--ramp : optional ramp time to get get to the selected value  
function SetCrossPointDelay(ins, outs, delay, ramp)
    
end

--Sets specified input gain with optional ramp time
--ins : list of input
--gains : Gain value to set
--ramp : optional ramp time to get get to the selected value  
function SetInputGain(ins, gains, ramp)
    
end

--Sets specified input mutes
--ins : list of input
--mute : boolean value for mute
function SetInputMute(ins, mute)
    
end

--Sets specified input solos
--ins : list of input
--solo : boolean for solo
function SetInputSolo( ins, solo)
    
end

--Sets specified output gain with optional ramp time
--outs : list of output
--gain : Gain value to set
--ramp : optional ramp time to get get to the selected value  
function SetOutputGain(outs, gain, ramp)
    
end


--Sets specified output mutes
--outs : list of output
--mute : boolean value for mute
function SetOutputMute(outs, mute)
    
end

--Sets specified input cues enables
--ins : list of input
--cues : list of cue
--enable : boolean to enable/disable cue
function SetInputCueEnable(ins, cues, enable)
    
end

--Sets specified input AFL enables
--ins : list of input
--afls : list of AFL (After fader level)
function SetInputCueAfl(ins, afls, enable)
    
end

--Sets specified cue gains with optional ramp time
--cues : list of cue
--gain : Gain value to set
--ramp : optional ramp time to get to the selected value  
function SetCueGain(cues, gain, ramp)
    
end

--Sets specified cue mutes
--cues : list of cue
--mute : boolean value for mute
function SetCueMute(cues, mute)
    
end

--Gets specified cross point values
--ins : list of input
--outs : list of output
function GetMixerCrossPoints(ins, outs)
    
end

--The methods in NamedControl are used to read or set the values of Named Controls. 
NamedControl = {}

--Sets control with specified Control name to specified string value. If Control name does not exist an error is raised.
--control_name : the name of the control
--string : string value to set
function NamedControl.SetString(control_name, string)
    
end

--Returns string of control with specified Control name. If Control name does not exist an error is raised.
--control_name : the name of the control
function NamedControl.GetString(control_name)
    
end

--Sets control with specified Control name to specified position. The ramp time is optional, and is in seconds. If Control name does not exist an error is raised.
--
--control_name : the name of the control
--position : floating point position which goes from 0.0 -> 1.0 
--ramp : optional ramp time to get to the selected value
function NamedControl.SetPosition(control_name, position, ramp)
    
end

--Returns position of control with specified Control name. If Control name does not exist an error is raised.
--control_name : the name of the control
function NamedControl.GetPosition(control_name)
    
end

--Sets control with specified Control name to specified value. The ramp time is optional, and is in seconds. If Control name does not exist an error is raised.
--control_name : the name of the control
--value : string representation of control value 
--ramp : optional ramp time to get to the selected value
function  NamedControl.SetValue(control_name, value, ramp)
    
end

--Returns value of control with specified Control name. If Control name does not exist an error is raised.
--control_name : the name of the control
function NamedControl.GetValue(control_name)
    
end

--Triggers control with specified Control name. If Control name does not exist an error is raised.
--control_name : the name of the control
function NamedControl.Trigger(control_name)
    
end

--Use the Network commands to return the full host name and IP address of a specified host, or obtain a table of network interface names and their IP addresses.
Network = {
    name = "",
    addresses = {},
    interface = {
        [1] = {
            Interface = "",
            Address = "",
            MACAddress = "",
            BroadcastAddress = "",
            Gateway = "",
            Netmask = ""
        }
    }
}

--Return an object with the name (.name) and addresses (.addresses) of a specified host, where .addresses is a table of strings.
--host : The host name for which to obtain network information.
function Network.GetHostByName(host)
    
end

--Return a table of network interface names (.Interface) and the IP address (.Address), MAC address (.MACAddress), broadcast address (.BroadcastAddress), 
--gateway (.Gateway), and netmask (.Netmask) for each.
function Network.Interfaces()
    
end

--Use the following methods to subscribe to a notification, publish a notification with specified data, and unsubscribe from a notification. 
--This allows scripts running within the same Core to communicate with each other using control wiring or Component.
Notifications = {
    --noteid : The token to use when unsubscribing from a notification.
    noteid = ""
}


--Subscribe to a notification with a given name.
--Unsubscribe from a notification with the specified noteid.
--func : The callback to call when the named notification is triggered. The signature is function( name, data ).
function Notifications.Subscribe( name, func )
    
end

--Publish a named notification with given data. The data can be either a Lua table or a string.
--Note: You cannot call the Notifications.Publish() method inside a Notifications.Subscribe() callback. This will raise a Lua error.
--name : The name of the notification.
--data : the notification data
function Notifications.Publish(name, data)
    
end

--Unsubscribe from a notification with the specified noteid.
--name : The name of the notification.
function Notifications.Unsubscribe(noteid)
    
end

--Use the Ping library in Lua to check whether a device is reachable on the network.
--Note: The Lua Ping library requires that you run Q-SYS Designer as administrator ("Run as administrator" option in Windows) when emulating your design. 
--If you see a non-terminating "Socket failed to open" error message in the debug window, re-launch Designer as administrator.
--Ping object MUST be initialized with the .New function
Ping = {
    host = ""
}

--Rappresent a ping response object
PingResponses =
{
    HostName = "",
    ElapsedTime = 1
}

--Create a new ping object.
--target_host : The hostname to ping.
function Ping.New(target_host)
    
end

--Begin the ping session.
--single_shot : Bool. Set to true if you want only a single ping attempt.
function Ping:start(single_shot)
    
end

--Stop the ping session.
function Ping:stop()
    
end

--Set the timeout for waiting for a ping response.
--interval : The timeout duration, in seconds.
function Ping:setTimeoutInterval(interval)
    
end

--Set the interval for retrying after a ping request.
--interval : The timeout duration, in seconds.
function Ping:setPingInterval(interval)
    
end

--Assign a Lua callback for successful ping events.
--response : callback for responseobject
function Ping.EventHandler(response)
    
end

--Assign a Lua callback for unsuccessful ping events.
--response : callback for responseobject
function Ping.ErrorHandler(response)
    
end

--Rappresent a QRCode, NOT used normally, use only the functions/methods
QRCode = {
    url = "",
    mode = ""
}

--Generate a QR code SVG graphic.
--url : The URL string to encode.
--mode : Optional error correction mode string. Replace with low, medium, quartile, or high. Defaults to "medium" if not passed.
--low = Level L, up to 7% error correction.
--medium = Level M, up to 15% error correction.
--quartile = Level Q, up to 25% error correction.
--high = Level H, up to 30% error correction.
function QRCode.GenerateSVG(url, mode)
    
end

--Use the RapidJSON module to encode and decode large documents quickly. 
--It is similar to the standard JSON module, but can handle large amounts of data without risk of raising execution count errors.
--To use the RapidJSON module, add the following line to your script: rapidjson = require("rapidjson")
rapidjson = {
    _NAME = "rapidjson",
    _VERSION = "scm"
}

--Encode a Lua table to JSON string. JSON object keys are sorted by this function.
--value : When passed as a table: it is encoded as JSON array if: meta field __jsontype set to array. table contains length > 0. otherwise the table is encoded as JSON object and non string keys and its values are ignored.
--When passed with true, false, number and rapidjson.null, simply encode as a simple JSON value.
--option : A optional table contains the following field:
--pretty boolean: Set true to make output string to be pretty formated. Default is false.
--sort_keys boolean: Set true to make JSON object keys be sorted. Default is false.
--empty_table_as_array boolean: Set true to make empty table encode as JSON array. Default is false.
function rapidjson.encode(value, option) end

--Decode JSON to a Lua table.
--value : A JSON value string to be decoded.
function rapidjson.decode(value) end

--Load JSON file into Lua table.
--filename : The JSON file to be loaded.
function rapidjson.load(filename) end

--Dump a Lua value to a JSON file.
--value : Same as in rapidjson.encode().
--filename : The file path string where to save the rapidjson string.
--option : Same as in options in rapidjson.encode().
function rapidjson.dump(value, filename, option) end

--Placeholder for null values in rapidjson.
function rapidjson.null() end

--Create a new empty table that has the metatable field __jsontype set as 'object' so that the encode and dump function will encode it as a JSON object.
--table : Optional table to set the metatable with meta field __jsontype set as 'object'.
function rapidjson.object(table) end

--Same as rapidjson.object(), except the metatable field __jsontype is set as 'array'. The encode and dump function will encode it as JSON array.
function rapidjson.array() end

--Serial port communication is supported via the RS-232 ports on some Q-SYS devices. 
--You can use a scripting component, including Control Script and Block Controller, to create a serial port connection in Q-SYS.
SerialPorts = {
     [1] = {
        --Returns true if port is connected, is readonly
        IsOpen = false,
        --Number of bytes of data in buffer
        BufferLength = 1,
        --This table contains pre-defined END OF LINE values
        EOL = {
            Any = "",
            CrLf = "\r\n" or "\n",
            CrLfStrict = "\r\n",
            Lf = "\n",
            Null = '\x00',
            Custom = ""
        },
        Events = {
            "Connected",
            "Reconnect",
            "Data",
            "Closed",
            "Error",
            "Timeout"
        }
    }
}

--Function called on any serial event.
--port : the port where the event happen
--event : the event type
function SerialPorts.EventHandler(port, event) end

--Attempts to open the serial port with the specified baud rate (up to 230400 bits per second)
--baudRate : the baud rate of the port up to 230400 b/sec
--dataBits : dataBits - optional: 7, 8. Default = 8.
--parity : optional with dataBits: N (None), E (Even), O (Odd), M (Mark), S (Space)
function SerialPorts[1]:Open(baudRate, dataBits, parity) end

--Closes the serial port
function SerialPorts[1]:Close()end

--Writes specified data to the serial port. Raises error if port is not open.
--data : the data to write
function SerialPorts[1]:Write(data) end

--Attempts to read up the 'length' bytes from serial buffer. Data is removed from serial buffer.
--length : length value to read
function SerialPorts[1]:Read(length) end

--Attempts to read a 'line' from the serial buffer. 
--EOL : is defined as in the SerialPorts.EOL table. 
--custom : is an optional string only used by EOL.Custom.
function SerialPorts[1]:RealLine(EOL, Custom) end

--Searches the serial buffer for string 'str'
--string : the string to find in the buffer
--start_pos : optional start index where the search starts
function SerialPorts[1]:Search(string, start_pos) end

--Assign a function which is called upon connection to the serial port
function SerialPorts.Connected() end

--Assign a function which is called when socket is attempting to reconnect to the serial port
function SerialPorts.Reconnect() end

--Assign a function which is called when there is new data available in the serial buffer
function SerialPorts.Data() end

--Assign a function which is called when the serial port is closed
function SerialPorts.Closed() end

--Assign a function which is called when the serial port is closed due to error. 
--The error argument in the function will contain more information, which can be displayed if a variable was created to catch the error message.
function SerialPorts.Error() end

--Assign a function which is called when a read or write timeout is triggered and the serial port was closed.
function SerialPorts.Timeout() end

--Use the SNMP library in Lua to monitor OIDs obtained from an SNMP-enabled device's MIB file.
--Note: In the SNMP model, Q-SYS acts as the SNMP Manager, while the device you intend to monitor runs an SNMP Agent that allows for monitoring.
SNMP = {
    AuthType = {
        --No authorization type and no privacy type.
        NoAuth = "NoAuth",
        -- Authorization with no privacy.
        AuthNoPriv = "AuthNoPriv",
        --Both authorization and privacy.
        AuthPriv = "AuthPriv"
    },

    AuthProtocol ={
        --Disable the authorization protocol.
        NoAuth = "NoAuth",
        --Enable the MD5 authorization protocol.
        MD5 = "MD5",
        --Enable the SHA authorization protocol.
        SHA = "SHA"
    },

    PrivProtocol = {
        --Disable the privacy protocol.
        NoPriv = "NoPriv",
        --Enable the AES privacy protocol.
        AES = "AES",
        -- Enable the DES privacy protocol.
        DES = "DES"
    },

    SNMPDataType = {
        unknown = "unknown",
        integer32 = "integer32",
        unsigned32 = "unsigned32",
        unsigned_integer32 = "unsigned_integer32",
        timeticks = "timeticks",
        ip_address = "ip_address",
        object_id = "object_id",
        octet_string = "octet_string",
        hex = "hex",
        decimal = "decimal",
        bit_string = "bit_string",
        integer64 = "integer64",
        unsigned64 = "unsigned64",
        float32 = "float32",
        double64 = "double64"
    }
}

--Create a new SNMP session.
function SNMP.New()   
end

--Specify the host to which to connect.
--hostname : The target host name.
function SNMP:setHostName(hostname) end

--For SNMP v3 only, set the authorization type for the session.
--type : see the AuthType for details
function SNMP:setAuthType(type) end

--For SNMP v3 only, set the authorization protocol for the session.
--type : see the AuthProtocol for details
function SNMP:setAuthProt(type) end

--For SNMP v3 only, set the user name for the session.
--username : The user name for the session.
function SNMP:setUserName(username) end

--For SNMP v3 only, set the authorization pass phrase for the session.
--The pass phrase for the corresponding user name.
function SNMP:setPassPhrase(passphrase) end

--For SNMP v3 only, set the privacy pass phrase for the session.
--privpass : The privacy pass phrase for the session.
function SNMP:setPrivPassPhrase(privpass) end

--For SNMP v2 sessions only, set the community name for the session.
--community : The community name for the session.
function SNMP:setCommunity(community) end

--Initiate the connection to the corresponding session.
function SNMP:startSession() end

--Request an object ID (OID) and pass the response to a Lua callback.
--oid : object ID
--callback : The Lua callback to which to pass the response.
function SNMP:getRequest(oid, callback) end

--Set a new value for a specified OID.
--oid : object ID
--new_value : The new value to which to set the specified object ID.
--type : the data type, see SNMPDataType
--callback : The Lua callback to which to pass the response.
function SNMP:setRequest(oid, new_value, type, callback) end

--Assign the Lua callback for successful SNMP events.
function  SNMP.EventHandler() end

--Assign the Lua callback for unsuccessful SNMP events.
function SNMP.ErrorHandler() end

--Use the SNMPTrap library in Lua to receive trap notifications from an SNMP-enabled device.
--Note: In the SNMP model, Q-SYS acts as the SNMP Manager, while the device you intend to monitor runs an SNMP Agent that allows for monitoring.
SNMPTrap = {}

--Create a new SNMP trap listener.
--trap_name : The name of the trap listener session.
function SNMPTrap.New(trap_name) end

--Begin a trap listening session.
function SNMPTrap:startSession() end

--Assign a Lua callback for successful SNMP events.
function SNMPTrap.EventHandler() end

--Assign a Lua callback for unsuccessful SNMP events.
function SNMPTrap.ErrorHandler() end

--Use the System table to return Q-SYS environment information.
System =
{
    --Returns the build version number of Q-SYS environment.
    BuildVersion = "",
    --Returns the Q-SYS Core's Locking ID, which is used for Q-SYS feature license activation. For more information, see Licensing.
    LockingId = "",
    --Returns a Boolean indicating whether the design is emulating or running on a Core.
    IsEmulating = false,
    --Returns the major version number of Q-SYS environment.
    MajorVersion = "",
    --Returns the minor version number of Q-SYS environment.
    MinorVersion = "",
    --Returns the complete version number of Q-SYS environment.
    Version = ""
}

--The TcpSocket object allows Q-SYS cores to make client TCP/IP connections to devices on the network.
TcpSocket = {
    --Time, in seconds, to wait for data to be available on socket before raising an Error through the EventHandler.
    ReadTimeout = 0,
    --Time, in seconds, to wait for data write to complete before raising an Error through the EventHandler.
    WriteTimeout = 0,
    --Time in seconds to wait before attempting to reconnect. 0 disables automatic reconnect.
    ReconnectTimeout = 0,
    --Returns true if socket is connected 
    IsConnected = false,
    --Amount of data in buffer, in bytes
    BufferLength = 0,
    --The socket has connected to the remote host callback
    Connected = nil,
    --The socket is attempting to reconnect to the remote host callback
    Reconnect = nil,
    --There is new data available in the socket buffer callback
    Data = nil,
    --The socket was closed by the remote host callback
    Closed = nil,
    --The socket was closed due to error. 
    --The error argument to the EventHandler will have more information, which can be displayed if a variable was created to catch the error message.
    Error = nil,
    --A read or write timeout was triggered and the socket was closed.
    Timeout = nil,
    --END OF LINE Table values
    EOL = {
        Any = "",
        CrLf = "\r\n" or "\n",
        CrLfStrict = "\r\n",
        Lf = "\n",
        Null = "\x00",
        Custom = ""
    }
}

--Creates a new TcpSocket instance.
function TcpSocket:New() end

--Attempts to connect to the specified ip/host name and port, 'ipAddress/hostname' is string, 'port' is integer
--ip_address : the ip address or host name to connect to
--port : control port
function TcpSocket:Connect(ip_address, port) end

--Disconnects the socket.
function TcpSocket:Disconnect() end

--Writes specified data to the socket. Raises error if socket is not connected.
--data : the data to write to the socket
function TcpSocket:Write(data) end

--Attempts to read up to 'length' bytes from socket. These bytes are removed from the buffer, leaving any remaining bytes beyond the 'length' specified. 'length' is positive integer.
--length : number of bytes to read
function TcpSocket:Read(length) end

--Attempts to read a 'line' from the socket buffer. 'EOL' is defined in the table below. '<custom>' is an optional string only used by EOL.Custom.
--EOL : see associated table for values
--custom : if EOL.Custom is used this variable se the custom value
function TcpSocket:ReadLine(EOL, custom) end

--Searches the socket buffer for string 'str' (starting at integer 'start_pos') and returns the index of where 'str' is found. 'start_pos' defaults to 1.
--str : the string/pattern to find
--start_pos : optional index where to start to search, default value is 1
function TcpSocket:Search(str, start_pos) end

--The TcpServer object allows Q-SYS cores to accept client TCP/IP connections from devices on the network. 
TcpSocketServer = {}

--Creates a new TcpServer instance
function TcpSocketServer:New() end

--Open a port and listen for incoming connection
--port : port number for listen to incoming connection
function TcpSocketServer:Listen(port) end

--Close the listeing port and disconnect all the connected clients
function TcpSocketServer:Close() end

--Function called on any incoming socket event. 
function TcpSocketServer.EventHandler() end

--The Timer object is used to create delays or trigger events after a defined elapsed time.  It should be used instead of Lua's native delay and time functions. 
Timer = {}

--Creates a new timer object
function Timer.New() end

--Handle the timer event, is used when the time runs out
function Timer.EventHandler() end

--Starts the timer
--time : time interval in SECONDS, when the time expire the EventHandler is executed
function Timer:Start(time) end

--Stops the timer
function Timer:Stop() end

--Supply a named function to call after a given delay in milliseconds.
--function_pass : function to execute after time
--time : time interval in MILLISECONDS, when the time expire the function_pass is executed
function Timer.CallAfter(function_pass, time) end

Uci = {
    
}

--Table that store UCI elements
DialogTable = {
    Title = "",
    Message = "",
    --The button list is a table consisting of strings – one string per desired response button.
    Buttons = {},
    --The EventHandler Function receives an integer index of which button was pressed. 
    --The EventHandler argument is zero-based, so add 1 to the integer to match a Lua table entry.
    Handler = nil
}

--Display a dialog in a UCI that contains a title, message, and button selection list.
--UCI_Name : The name of the target UCI for which to display the dialog.
--DialogTable : table with the dialog elements, see DialogTable object for details
function Uci.ShowDialog(UCI_Name, DialogTable) end

--Set the screen status of a TSC touchscreen controller or UCI Viewer.
--TSC_Name : The name of the TSC touchscreen controller or UCI Viewer.
--State : "On" | "Off" | "Dim"
function Uci.SetScreen(TSC_Name, State) end

--Set which UCI to display on a TSC touchscreen controller or UCI Viewer.
--TSC_Name : The name of the TSC touchscreen controller or UCI Viewer.
--UCI_Name : String. The name of the UCI.
function Uci.SetUCI(TSC_Name, UCI_Name) end

--Set which UCI page to display on a TSC touchscreen controller or UCI Viewer.
--TSC_Name : The name of the TSC touchscreen controller or UCI Viewer.
--Page_in_UCI : The UCI page to show.
function Uci.SetPage(TSC_Name, Page_in_UCI) end

--Set whether and how a layer is made visible within a specified UCI name and page.
--UCI_Name : String. The name of the UCI.
--Page_Name : String. The name of the UCI page.
--Layer_Name : String. The name of the UCI layer.
--Visibility : true | false
--Transition_Type : "none" | "fade" | "left" | "right" | "bottom" | "top"
function Uci.SetLayerVisibility(UCI_Name, Page_Name, Layer_Name, Visibility, Transition_Type) end

--Set whether and how a shared layer is made visible within a specified UCI name and page.
--UCI_Name : String. The name of the UCI.
--Layer_Name : String. The name of the UCI layer.
--Visibility : true | false
--Transition_Type : "none" | "fade" | "left" | "right" | "bottom" | "top"
function Uci.SetSharedLayerVisibility(UCI_Name, Layer_Name, Visibility, Transition_Type) end

--Log off from a specified TSC touchscreen controller or UCI Viewer
--The name of the TSC touchscreen controller or UCI Viewer.
function Uci.LogOff(TSC_Name) end

--Send and receive data over a UDP Socket connection.
UdpSocket = {
    --Assign a function which is called when data is received 
    Data = nil
}

--Creates a UDP Socket instance.
function UdpSocket.New() end

--Opens the UDP 'listener.' Optionally bind to local IP and Port.
--ip_address : ip address where to listen to, ususally is a bind to the local address
--port : listening port
function UdpSocket:Open(ip_address, port) end

--Closes the UDP socket
function UdpSocket:Close() end

--Sends data to the specified ip address and port
--ip_address : destination IP Address/Host
--port : destination port
--data : data to send
function UdpSocket:Send(ip_address, port, data) end

--Joins a specific multicast 'address', optionally binding to a local 'ip'.
--address : multicast address to join
--ip : optional local ip binding
function UdpSocket:JoinMulticast(address, ip) end