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
--ramp : ramp time to get get to the selected value  
function SetCrossPointGain(ins, outs, gain, ramp)
    
end
