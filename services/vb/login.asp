<%@ LANGUAGE="VBSCRIPT" %>
<!-- #include virtual="./config/keys.asp" -->
<!-- #include virtual="./vb/includes/jwt.asp" -->

<%
    '------------------------------------------------------------------------
    '// Receive the JSON data using BinaryRead and convert to (JSON) string
    '------------------------------------------------------------------------
    Dim vntPostedData, lngCount, bString 
    lngCount = Request.TotalBytes 
    vntPostedData = Request.BinaryRead(lngCount)         
    bString = binaryToString(vntPostedData)

    '------------------------------------------------------------------------
    '// Load string to JSON object
    '------------------------------------------------------------------------
    Set oJSON = new aspJSON
    oJSON.loadJSON(bString)

    '------------------------------------------------------------------------
    '// Check whether password or claim token supplied (e.g. Facebook)
    '------------------------------------------------------------------------
    email = oJSON.data("email") & ""

    '// TODO: Verify User exists, and return User

    name = "John Doe"
    userId = "12345678"

    '------------------------------------------------------------------------
    '// Create JWT Token and set user as Logged In
    '------------------------------------------------------------------------
    Dim jKey, dAttributes, jToken
    jKey = JWTkey
    timestamp = SecsSinceEpoch()
    expireAt = timestamp + 3600
    Set dAttributes=Server.CreateObject("Scripting.Dictionary")

    '------------------------------------------------------------------------
    '// The UniqueString and SecsSinceEpoch functions are provided by this implementation
    '------------------------------------------------------------------------
    dAttributes.Add "jti", UniqueString
    dAttributes.Add "iat", timestamp
    dAttributes.Add "exp", expireAt
    dAttributes.Add "userId", userId
    dAttributes.Add "email", email
    dAttributes.Add "name", name

    jToken = JWTEncode(dAttributes, jKey)
    Set dAttributes = Nothing    

    '------------------------------------------------------------------------
    '// Create JSON object for response
    '------------------------------------------------------------------------
    Set rJSON = new aspJSON
    With rJSON.data
        .Add "loggedIn", true
        .Add "token", jToken & ""
        .Add "payload", rJSON.Collection()
        With rJSON.data("payload")
            .Add "email", email
            .Add "name", name & ""
            .Add "userId", userId & ""
        End With
        .Add "iat", timestamp
        .Add "exp", expireAt
    End With

    '------------------------------------------------------------------------
    '// Send Response as JSON
    '------------------------------------------------------------------------
    Response.ContentType = "application/json"
    Response.Write rJSON.JSONoutput()

    Set rJSON = Nothing
    Set oJSON = Nothing


    '------------------------------------------------------------------------
    '// Functions
    '------------------------------------------------------------------------
    Function binaryToString(Binary) 
        Dim I, S 
        For I = 1 To LenB(Binary) 
            S = S & Chr(AscB(MidB(Binary, I, 1))) 
        Next 
        BinaryToString = S 
    End Function 
%>
