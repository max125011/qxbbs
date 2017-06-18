<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改个人信息</title>
    <link href="${context.contextPath}/css/bootstrap.css" rel="stylesheet">
    <script type='text/javascript' src='${context.contextPath}/js/jquery.1.9.js'></script>
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            padding-top: 50px;
            padding-bottom:0px;
            color: #5a5a5a;
        }

        .main {
            padding: 20px;
        }
        img{
            /*width: 90px;*/
            /*height: 90px;*/
        }
        .logo{
            width: 150px;
            height: 50px;
        }
    </style>

</head>

<body>
<!--下面是顶部导航栏的代码-->
<nav class="navbar-default  navbar-fixed-top" role="navigation" style="background-color: #ffffff;height: 80px;">
    <div class="container-fluid">
        <div style="display: inline; padding-left: 142px">
            <a href=""><img src="${context.contextPath}/images/logo/banner.png"/></a>
        </div>
        <#--<a style="margin: 0;width: 150px !important;height: 50px !important;" href="${context.contextPath}/bbs/user/update/${user.id?c}"><img class="logo" src="${context.contextPath}/images/logo/qx-logo.png"/></a>-->
        <div style="display: inline;float: right;padding-top: 30px;padding-right: 30px">
            <span>滴水藏海</span>&nbsp
            <a href="javascript:void(0)" onclick="logout();">注销</a>
        </div>

    </div>
</nav>

        <div style="width: 500px;height: 400px;padding-top:100px;padding-left:400px;float: left;display: inline">
            <form class="form-horizontal" role="form" style="width: 400px;">
                <!--修改头像-->
                <div class="form-group">
                    <label for="firstname" class="col-sm-4 control-label">头像&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                    <div class="col-sm-3">
                        <a><img id="image_choose" style="width: 70px;height: 70px;" src="${context.contextPath}/images/user/${user.pictureUrl}"/></a>
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstname" class="col-sm-4 control-label">修改头像&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>&nbsp&nbsp&nbsp
                    <select id="image-select">
                        <option value="0">请选择头像</option>
                        <#if pictures?exists>
                        <#list pictures as picture>
                        <option value="${picture}">${picture}</option>
                        </#list>
                        </#if>
                    </select>
                </div>

                <div class="form-group">
                    <label for="nickname" class="col-sm-4 control-label">昵称&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="nickname">
                    </div>
                </div>
                <div class="form-group">
                    <label for="newpassword" class="col-sm-4 control-label">输入新密码&nbsp&nbsp</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="newpassword">
                    </div>
                </div>
                <div class="form-group">
                    <label for="newpassword1" class="col-sm-4 control-label">再次输入新密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="newpassword1">
                    </div>
                </div>
            </form>
            <div class="form-group" style="padding-left: 200px;">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" onclick="submit();">提交</button>
                </div>
            </div>
        </div>








<!—页尾-->
<#--<div class="copyright" style="background-color: #111111; height:78px;float:inherit;">-->
    <#--<div class="container max1010">-->
        <#--<div style="padding-top: 25px;padding-bottom: 20px;font-size: larger;text-align: center">-->
            <#--<p style="font-size: 16px;">Copyright © 2017 南京栖霞区公安分局</p>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->


<#--<script src="js/jquery-1.11.1.min.js"></script>-->
<#--<script src="js/bootstrap.min.js"></script>-->
<script type="text/javascript">
    $(function(){
        $("select").change(function(){
            var v =$(this).val();
            $("#image_choose").attr("src","${context.contextPath}/images/user/" + v);
        });
    });
</script>
<script type="text/javascript">

    function logout() {
        var url = "${context.contextPath}/logout";
        $.ajax({
            url: url,
            type: "POST",
            success: function (data) {
                if (data != null && data == 1) {
                    window.location.href = "${context.contextPath}/login";
                }
            }
        });
    }
    function submit(){
        var pictureUrl = $("#image-select option:selected").val();
        var nickname = $("#nickname").val();
        var newpassword = $("#newpassword").val();
        var newpassword1 = $("#newpassword1").val();

        if (pictureUrl == 0){
            pictureUrl = null;
        }
        if(newpassword != null && newpassword != ""){
            if (newpassword != newpassword1){
                alert("两次输入的密码不一致，请重新输入！");
                return;
            }
        }

        var param = {
            'id': ${user.id?c},
            'nickname': nickname,
            'pictureUrl': pictureUrl,
            'password': newpassword,
        };


        var url = "${context.contextPath}/user/update"
        $.ajax({
            url: url,
            type: "POST",
            data: param,
            success: function (data) {
                if (data == 1) {
                    alert("修改成功，点击确定返回首页！");
                    window.location.href = "${context.contextPath}/bbs/home";
                }else {
                    alert("修改失败，请重试！");
                }
            },
            error:function(){
                alert("修改失败，请重试！");
            }
        });
    }
</script>
</body>
</html>



