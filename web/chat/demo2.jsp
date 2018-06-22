<%--
  Created by IntelliJ IDEA.
  User: 15173
  Date: 2018/6/21
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>123123</title>
    <link href="chatstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="container">
        <div id="friendList">
            <ul id="friend">
                <li>
                    <input type="checkbox" value="lidong"/>
                    李东
                </li>
                <li>
                    <input type="checkbox" value="zrs"/>
                    张瑞森
                </li>
                <li>
                    <input type="checkbox" value="sam"/>
                    吴宇鑫
                </li>
            </ul>
        </div>
        <div id="text">
            <div id="show_text"></div>
            <div id="text_input"></div>
            <div id="sendMessage">
                <button onclick="setImageInnerHTML()">发送</button>
            </div>
        </div>
    </div>
</body>
</html>

<script type="text/javascript" >
    function setImageInnerHTML() {
        var showline=document.getElementById("show_text");
        // var image=document.createElement("img");
        // image.width=40;
        // image.height=40;
        // image.src="../emoji/701.png";
        // showline.appendChild(image);
        // showline.innerHTML+='<br/>';
        showline.innerHTML+='<img src="../emoji/701.png" width="40" height="40">'+'<br/>';
    }

    //function addElementLi(){
        //alert("执行addElementLi");
        var ul=document.getElementById("friend");
        var li=document.createElement("li");
        var checkbox=document.createElement("input");
        checkbox.setAttribute("type","checkbox");
        li.appendChild(checkbox);
        li.appendChild(document.createTextNode("123"));
        ul.appendChild(li);
    //}
</script>