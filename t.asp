<% @language="vbscript" codepage = "65001" %>
<%  Response.CharSet = "utf-8" %>
<%
Dim str : str = request("str")

	If str <> "" Then asc_f_text = Server.UrlEncode(str)
	response.write "aaa:" & asc_f_text & "<br>bbb:" & URLDecode(asc_f_text)

response.redirect "t1.asp?str=" & Server.UrlEncode(str)
Function URLDecode(Expression)

 Dim strSource, strTemp, strResult, strchr
  Dim lngPos, AddNum, IFKor

 strSource = Replace(Expression, "+", " ")
  For lngPos = 1 To Len(strSource)
      AddNum = 2
      strTemp = Mid(strSource, lngPos, 1)
      If strTemp = "%" Then
          If lngPos + AddNum < Len(strSource) + 1 Then
              strchr = CInt("&H" & Mid(strSource, lngPos + 1, AddNum))
              If strchr > 130 Then
                  AddNum = 5
                  IFKor = Mid(strSource, lngPos + 1, AddNum)
                  IFKor = Replace(IFKor, "%", "")
                  strchr = CInt("&H" & IFKor )
              End If
              strResult = strResult & Chr(strchr)
              lngPos = lngPos + AddNum
          End If
      Else
          strResult = strResult & strTemp
      End If
  Next
  
  URLDecode = strResult

End Function


%>
<script>
//var str="<%=asc_f_text%>";
//alert(decodeURIComponent(str));
</script>