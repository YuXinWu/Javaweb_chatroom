<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:useBean id="websocket" class="websocket.WebSocketTest" scope="session" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Javabean.ReturnUser" %>
<!DOCTYPE html>
<html>
<head>
    <title>With Me</title>
    <link href="chatstyle.css" rel="stylesheet" type="text/css">
</head>

<!--
welcome!<br/><br/>
发送至：<input id="to" type="text"/><br/><br/>
消息框：<input id="text" type="text"style="height:51px;width:449px"/><br/><br/>
<button onclick="send()">发送消息</button><br/><br/>
<button onclick="closeWebSocket()">关闭WebSocket连接</button><br/><br/>
<div id="message"></div>
-->

<body>
<div id="aboveALL">
    <div id="container">
        <div id="friendList">
            <ul id="friend">
                <li>
                    <input type="checkbox" name="checkbox" value="lidong"/>
                    李东
                </li>
                <li>
                    <input type="checkbox" name="checkbox" value="zrs"/>
                    张瑞森
                </li>
                <li>
                    <input type="checkbox" name="checkbox" value="sam"/>
                    吴宇鑫
                </li>
            </ul>
        </div>
        <div id="text">
            <div id="show_text"></div>
            <div id="toolbar">
                <input type="file" name="pic" id="file" accept="" />
            </div>
            <div id="text_input">
                <textarea id="textarea_input" ></textarea>
            </div>
            <div id="sendMessage">
                <button onclick="getSelectedCheckboxAndSend()">发送</button>
            </div>
        </div>
    </div>
    <div id="welcome">
        <p id="p1"></p> <br><br><br><br>
        <button id="download" onclick="download_file()">下载记录</button>
        <input type="file" id="upload" onchange="upload_file()">
    </div>

</div>

</body>

<script type="text/javascript" >
    var websocket = null;
    var userName = "<%=session.getAttribute("username")%>";
    var target = "ws://localhost:8080/Javaweb/Echo?username="+userName;
    var myDate = new Date();

    var obj=document.getElementById("p1");
    obj.innerHTML="欢迎"+userName;

    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket(target); /*?username=*/
    }
    else {
        alert(333333333);
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
        //alert("连接成功");
        setMessageInnerHTML("WebSocket连接成功");
        var fromName = '<%=session.getAttribute("username")%>';
        var msgContent = (fromName+",$"+",$").toString();
        websocket.send(msgContent);
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        //alert("收到消息");
        var receieveMessage=event.data.toString();
        var arr=receieveMessage.split(" ");
        var mytime=myDate.toLocaleTimeString();   //获取当前时间
        //alert(arr[0]);
        //用户上线
        if(arr[0]=="1"){
            //alert("i am here");
            //setTimeout(addElementLi("friendList",arr[1]),500);
            var message=arr[1]+"上线";
            //alert(message);
            setMessageInnerHTML(mytime+" "+message);
        }else{
            var msg=arr[1].split("?=");
            //alert(msg[0]);
            if(msg.length>1){ //说明有图片传过来
                setMessageInnerHTML(mytime+" "+msg[0]);
                setImageInnerHTML(msg[1]);
            }else{
                setMessageInnerHTML(mytime+" "+msg[0]);
            }
        }

    }

    //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('show_text').innerHTML += innerHTML + '<br/>';
    }

    function setImageInnerHTML(innerHTML) {
        var showline=document.getElementById("show_text");
        var image=document.createElement("img");
        image.width=30;
        image.height=30;
        image.src="../emoji/"+innerHTML;
        showline.appendChild(image);
        showline.innerHTML+='<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    function addElementLi(){
        //alert("执行addElementLi");
        var ul=document.getElementById("friend");
        var li=document.createElement("li");
        var checkbox=document.createElement("input");
        checkbox.setAttribute("type","checkbox");
        li.appendChild(checkbox);
        li.appendChild(document.createTextNode("123"));
        ul.appendChild(li);
    }

    function getSelectedCheckboxAndSend(){
        //构造消息头(from，to，message)
        var fromName = '<%=session.getAttribute("username")%>';
        var toName=document.getElementsByName("checkbox");
        var content = document.getElementById('textarea_input').value;
        document.getElementById('textarea_input').value=""; //清空textarea的值
        var a=document.getElementById("file").value; //获取图片信息

        //即没有选择文件，就是正常发送文本文件
        if(a==""){
            //选中checkbox的人发送
            for(var i = 0; i < toName.length; i++){
                if(toName[i].checked){
                    //alert(toName[i].value);
                    var msgContent = (fromName+","+toName[i].value+","+content).toString();
                    websocket.send(msgContent);
                }
            }
        }else{ //选中文件，需要发送URL地址过去
            var imageURL=a.split("\\")[2];
            //选中checkbox的人发送
            for(var j = 0; j < toName.length; j++){
                if(toName[j].checked){
                    //alert(toName[j].value+"111111");
                    var msgContentWithImage = (fromName+","+toName[j].value+","+content+"?="+imageURL).toString();
                    websocket.send(msgContentWithImage);
                    document.getElementById("file").value=""; //发送完一次后，清空file的值(地址)
                }
            }
        }

    }

    function download_file() {
        var content = "这是直接使用HTML5进行导出的";
        var blob = new Blob([content], {type: "text/plain;charset=utf-8"});
        saveAs(blob, "file.txt");//saveAs(blob,filename)
    }

    function upload_file(){
        if(typeof FileReader==='undefined'){
            input.setAttribute('disabled','disabled');
        }else{
            //alert(12233);
            read();
        }
    }

    function read(){
        //检验是否为图像文件
        var file = document.getElementById("file").value;
        alert(1231223);
        var reader = new FileReader();
        alert(321321);
        //将文件以Data URL形式读入页面
        reader.readAsText(file);
        //alert(321321);
        reader.onload=function(e){
            var result=document.getElementById("showtext");
            alert(result);
            //显示文件
            result.innerHTML='<img src="' + this.result +'" alt="" />';
        }
    }

</script>
</html>
