<%@ LANGUAGE="VBSCRIPT" %>
<!-- #include virtual="./vb/includes/jwt.asp" -->
<%
    dt = dtmAdjusted_date()
    Response.Write dt & "<br/>"

    secs = SecsSinceEpoch()
    Response.Write secs & "<br/>"

    uuid = LCase(UniqueString())
    Response.Write uuid & "<br/>"

    '------------------------------------------------------------------------
    '// Generate a JWT
    '------------------------------------------------------------------------
    Dim jKey, dAttributes, jToken
    jKey = "Shared Secret"
    Set dAttributes=Server.CreateObject("Scripting.Dictionary")

    '// The UniqueString and SecsSinceEpoch functions are provided by this implementation
    dAttributes.Add "jti", UniqueString
    dAttributes.Add "iat", SecsSinceEpoch
    dAttributes.Add "name", "Roger"
    dAttributes.Add "email", "roger@example.com"

    jToken = JWTEncode(dAttributes, jKey)
    Set dAttributes = Nothing
    Response.Write "JWT : " & jToken & "<br/>"

%>