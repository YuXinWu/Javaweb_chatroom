<%--
  Created by IntelliJ IDEA.
  User: 15173
  Date: 2018/6/19
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>With Me</title>
    <!-- 引入JQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.5.5.4/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.5.5.4/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.5.5.4/locale/easyui-lang-zh_CN.js"></script>
    <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.5.5.4/themes/default/easyui.css" type="text/css"/>
    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.5.5.4/themes/icon.css" type="text/css"/>


</head>
<body class="easyui-layout">
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:200px;"></div>
    <!-- 好友列表 -->
    <div data-options="region:'west',title:'West',split:true" style="width:200px;">
        <ul id="friendList" class="easyui-datalist" title="好友列表" lines="true" style="width:100%;height:100%"></ul>
    </div>
    <!-- 中间核心部分 -->
    <div data-options="region:'center'">
        <div class="easyui-layout" data-options="fit:true">
            <!-- 显示部分 -->
            <div id="textShow" data-options="region:'center',title:'center title'" style="padding:5px;">
                <div>
                    <div id="showline">

                    </div>
                </div>
            </div>
            <!-- 发送部分 -->
            <div data-options="region:'south',title:'South Title',split:true" style="height:250px;">
                <!-- 图片 emoji -->
                <div id="tb" style="background-color: #d2e2ff">
                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="setImageInnerHTML">Image</a>
                    <a href="#" class="easyui-linkbutton" iconCls="icon-man" plain="true" onclick="$('#w').window('open')">Emoji</a>
                </div>
                <!-- 输入框部分 -->
                <div>
                    <textarea cols="80" rows="50" style="width: 100%;height: 150px;"></textarea>
                </div>
                <!-- 发送按钮 -->
                <div align="right">
                    <button>发送</button>
                </div>
            </div>
        </div>
    </div>
    <div id="w" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
        The window content.
    </div>
</body>

<script type="text/javascript" >
    function setImageInnerHTML() {
        // var showline=document.getElementById("showline");
        // var image=document.createElement("img");
        // image.src="../emoji/701.png";
        // showline.appendChild(image);
        // showline.style.display="block";
        // var html = "<img src='../emoji/701.png'>";
        // $("#showline").append(html);
        $('#friendList').datalist('add',{textField:123123});
    }
</script>
</html>
