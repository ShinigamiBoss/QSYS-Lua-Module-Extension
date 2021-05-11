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