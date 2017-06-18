<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="${context.contextPath}/css/bootstrap.css">
    <link href="${context.contextPath}/css/signin.css" rel="stylesheet">
</head>

<body>

<div class="signin">
    <div class="signin-head"><img width="120px" height="120px" src="${context.contextPath}/images/logo-120.jpg" alt="" class="img-circle"></div>
    <form class="form-signin" role="form" method="post" action="/login">
        <input type="text" name="userName" class="form-control" placeholder="用户名" required autofocus />
        <input type="password" name="password" class="form-control" placeholder="密码" required />
        <button class="btn btn-lg btn-warning btn-block" type="submit">登录</button>
        <div style ="color:red ">
            <#if type == 2>该用户不存在！<#elseif type == 3>登录密码错误！</#if>
        </div>
    </form>
    <P style="padding-left:70px">登录账号为警号，初始密码为：<span style="color: red">111111</span>，请及时更改密码！</P>
</div>

</body>
</html>
