<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="/jsp/base.jsp" %>
    <title>宁夏保健学会学习平台-登录</title>

    <script type="text/javascript">
        $(function () {

            makeModal($("#alertModal"), "alertB", "1");

            function showAlertModal(message,type) {
                $('#alertModal').find('.modal-title').text('登录提示');
                $('#alertModal').attr("class","modal fade");
                $('#alertModal').children().attr("class","modal-dialog");
                $('#alertModal').find('.modal-body').text(message);
                if(type == 1){
                    $('#alertBSave').text("确定");
                    $('#alertBSave').show();
                    $('#alertBClose').hide();
                }else{
                    $('#alertBClose').show();
                    $('#alertBSave').hide();
                }

                $('#alertModal').modal('toggle');
            }

            function login() {
                $.ajax({
                    type: "POST",
                    cache: "false",
                    url: "framework/login.do?_method=PUT",
                    data: $('#userForm').serialize(),
                    dataType: "json",
                    error: function () {//请求失败时调用函数。
                        $("#authImage").attr("src", "<%=basePath%>authImage.do?time=" + new Date().getTime());
                        showAlertModal("程序异常，请联系管理员（电话：4006969296）处理，谢谢！",0);
                    },
                    success: function (result) {
                        if (result.status == 1) {
                            window.location.href = "<%=basePath%>xuexi/home.do";
                        } else {
                            $("#authImage").attr("src", "<%=basePath%>authImage.do?time=" + new Date().getTime());
                            showAlertModal(result.message,0);
                        }
                    }
                });
            };

            $("#login").click(function () {
                login();
            });

            $("#loginPanel").keypress(function (event) {
                if (event.keyCode == 13) {
                    login();
                }
            });

            $("#register").click(function () {
                window.open("<%=basePath%>framework/regist.do");
            });

            $("#forget").click(function () {
                window.open("<%=basePath%>jsp/forget.jsp");
            });

            $("#authImage").click(function () {
                $("#authImage").attr("src", "<%=basePath%>authImage.do?time=" + new Date().getTime());
            });
        });

    </script>

</head>

<body>

<div class="container-fluid">
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <p><br><br><br><br></p>
    </div>
</div><!-- /.col-->
</div><!-- /.row -->

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
            <div class="panel-heading">宁夏保健学会学习平台</div>
            <div class="panel-body">
                <div class="col-md-7">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            网站公告栏
                        </div>
                        <div class="panel-body">
                            <p>
                            <h3 class="text-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于系统更新，所有学员的登录名请使用身份证号码，密码还是和去年的一样，忘记密码请使用“找回密码”功能，登录后首先请完善个人信息，确认无误后再开始学习，遇到各种问题请咨询4006969296
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基于系统安全方面的原因，建议使用ie8以上或者谷歌浏览器，否则会出现页面显示不完整，无法完成注册等问题。
                                <br>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://42.81.54.48/softdl.360tpcdn.com/Chromestable/Chromestable_58.0.3029.110.exe">升级请点击</a> </h3></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-5" id="loginPanel">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">请登录，用户名是你注册的身份证号！</div>
                        <div class="panel-body">
                            <form role="form" id="userForm">
                                <fieldset>
                                    <div class="form-group">
                                        <label>用户名：</label>
                                        <input class="form-control" placeholder="请输入你的用户名" name="identity" type="text" autofocus>
                                        <label>密码：</label>
                                        <input class="form-control" placeholder="请输入你的密码" name="password" type="password" value="">
                                        <label>验证码：</label>
                                        <div class="row">
                                            <div class="col-md-8"><input class="form-control" maxlength="8" placeholder="看不清可点击图片刷新" name="authcode" type="text"></div>
                                            <div class="col-md-4"><img src="<%=basePath%>authImage.do" align="right" id="authImage" style="cursor:pointer;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row col-md-offset-0">
                                            <a id="login" class="btn btn-primary  col-md-3">登录</a>
                                            <a id="register" class="btn btn-primary col-md-3 col-md-offset-1">注册</a>
                                            <a id="forget" class="btn btn-primary col-md-3 col-md-offset-1">找回密码</a>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div><!-- /.col-->
                <div class="row">
                    <div class="col-md-8 col-md-offset-0">
                        <p>技术支持：甘肃七言志教育科技有限公司<br>客服电话：4006969296 0931-2111188 <br>QQ：2715528741<br>QQ群：68638150<br>备案信息：陇ICP备14000281号-1 <br></p>
                    </div>
                </div><!-- /.col-->
            </div>
        </div>
    </div><!--/.col-->


</div><!-- /.row -->

</div><!-- /.row -->

<div id="alertModal"></div><!-- Modal -->
</div>
</body>

</html>
