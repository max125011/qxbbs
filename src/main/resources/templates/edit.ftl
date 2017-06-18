<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editing By ${user.nickname}</title>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
    </style>
    <link rel='stylesheet' id='style-css'  href='${context.contextPath}/css/common/style.css' type='text/css' media='all' />
    <link rel='stylesheet' id='font-awesome-css'  href='${context.contextPath}/css/common/font-awesome.css' type='text/css' media='screen' />
    <script type="text/javascript" src="${context.contextPath}/js/jquery.1.9.js"></script>
    <!-- 配置文件 -->
    <script type='text/javascript' src='${context.contextPath}/js/bootstrap.min.js'></script>
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.all.js"></script>
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var id = ${article.id?c};
        var title = '${article.title}';
        var content = '<#if article.content?exists>${article.content}</#if>';
        $(document).ready(function () {

            $("#title").val(title);
            ue.ready(function() {//编辑器初始化完成再赋值  
                ue.setContent(content);  //赋值给UEditor  
            });
        })
    </script>
</head>

<body class="home blog group-blog">

<#--<div id="page" class="hfeed site">-->
    <#--<header class="site-header">-->
        <#--<div class="container">-->
            <#--<nav class="navbar" role="navigation">-->
                <#--<div class="navbar-header">-->
                    <#--<a style="margin: 0;width: 150px !important;height: 50px !important;" href=""><img src="${context.contextPath}/images/logo/qx-logo.png"/></a>-->
                <#--</div>-->
                <#--<div class="collapse navbar-collapse">-->
                    <#--<div class="items-wrap">-->
                        <#--<ul class="nav navbar-nav">-->
                            <#--<li><a href="" ><img src="${context.contextPath}/images/user/<#if user.pictureUrl?exists>${user.pictureUrl}<#else>default-1.jpg</#if>" width="32px" height="32px">&nbsp;&nbsp;&nbsp;${user.nickname}</a></li>-->
                        <#--</ul>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</nav>-->
        <#--</div>-->
    <#--</header>-->
<#--</div>-->

<nav class="navbar-default  navbar-fixed-top" role="navigation" style="background-color: #ffffff;height: 80px;">
    <div class="container-fluid">
        <a style="margin: 0;width: 150px !important;height: 50px !important;" href=""><img src="${context.contextPath}/images/logo/qx-logo.png"/></a>
        <div style="display: inline;float: right;padding-top: 30px;padding-right: 30px">
            <span><a href="${context.contextPath}/bbs/user/update/${user.id?c}">${user.nickname}</a></span>&nbsp&nbsp
            <a href="javascript:void(0)" onclick="logout();">注销</a>
        </div>
    </div>
</nav>



<div id="primary" class="content-area">
    <div id="main" class="site-main" role="main">
        <!--精品区标题开始-->
        <div class="site-branding">
            <h1 class="site-title">编辑文章 &#8211; Editing</h1>
            <form role="form">
                <div class="form-group">
                    <input type="text" class="form-control site-description" name="title" id="title" placeholder="请输入文章的标题">
                </div>
                <br><br>
                <div class="form-group">
                    <!-- 加载编辑器的容器 -->
                    <script id="container" name="content" type="text/plain">
                    </script>
                </div>
            </form>

            <div id="edit-submit">
                <a href="javascript:void (0)" class="alm-load-more-btn  btn load-more" onclick="submit();">确认修改</a>
            </div>
            <div id="edit-submiting" style="display: none">
                <a class="alm-load-more-btn  btn load-more";">提交中...</a>
            </div>
        </div>

    </div>
</div>
</div>

<footer class="site-footer hack-webkit-render">
    <div class="copyright">
        <div class="container max1010">
            <div class="text">
                <div style="text-align: center;">Copyright © 2017 栖霞区公安分局</div>
            </div>
        </div>

    </div>
</footer>

<!-- 模态框（Modal）开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" >
        <div class="modal-content" style="background-color:#d0e4fe;">
            <div class="modal-body" style="text-align: center;">
                <h5 id="submit">修改成功，请等待管理员审核！</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info btn-lg"
                        data-dismiss="modal">确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal）结束 -->

</body>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor( 'container', {
        autoHeightEnabled: true,
        autoFloatEnabled: true,
        initialFrameWidth: 990,
        initialFrameHeight:400
    });
    function submit(){
        $("#edit-submit").hide();
        $("#edit-submiting").show();
        var content;
        var txt;
        ue.ready(function() {

            content = ue.getContent();
            txt = ue.getContentTxt();
        });
        var title=$("#title").val();
        var abstract;
        //获取摘要的内容
        if(txt.length>50){
            abstract=txt.substring(0,49);
            //alert(abstract);
        }else{
            abstract=txt;
            //alert(abstract);
        }

        var param = {
            'title': title,
            'summary': abstract,
            'content': content,
            'id': id,
        };

        var url = "${context.contextPath}/article/update"
        $.ajax({
            url: url,
            type: "POST",
            data: param,
            success: function (data) {
                if (data == 1) {
                    alert("恭喜你，文章修改成功！等待管理员审核中");
                    window.location.href = "${context.contextPath}/bbs/home";
                }else {
                    $("#submit").text("文章修改失败，请重试！")
                    $('#myModal').modal({
                        keyboard: true
                    });
                    $("#edit-submit").show();
                    $("#edit-submiting").hide();
                }
            },
            error:function(){
                $("#submit").text("文章修改失败，请重试！")
                $('#myModal').modal({
                    keyboard: true
                });
                $("#edit-submit").show();
                $("#edit-submiting").hide();
            }
        });
    }

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

</script>
</html>

