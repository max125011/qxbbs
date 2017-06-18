<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editing By ${user.nickname}</title>
    <link href="${context.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${context.contextPath}/js/jquery.1.9.js"></script>
    <!-- 配置文件 -->
    <script type='text/javascript' src='${context.contextPath}/js/bootstrap.min.js'></script>
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.all.js"></script>
    <script type="text/javascript">
        var id = ${article.id?c};
        var title = '${article.title}';
        var titleColor = '<#if article.titleColor?exists>${article.titleColor}</#if>';
        var content = '<#if article.content?exists>${article.content}</#if>';
        var leadComment = '<#if article.leadComment?exists>${article.leadComment}</#if>';
        var author = '<#if article.author?exists>${article.author}</#if>';
        $(document).ready(function () {

            $("#title").val(title);
            $("#leadComment").val(leadComment);
            if (author != null && author != ""){
                $("#author").val(author);
            }
            if (titleColor != null && titleColor != ""){
                $("#titleColor").val(titleColor);
            }
            ue.ready(function() {//编辑器初始化完成再赋值  
                ue.setContent(content);  //赋值给UEditor  
            });
        })
    </script>
</head>

<body>
<!--顶部logo-->
<#--<div style="width: 100%">-->
    <#--<div style="display: inline;">-->
        <#--<a href=""><img style="width: 100%;height: 250px;" src="${context.contextPath}/images/logo/banner.jpg"/></a>-->
    <#--</div>-->
<#--</div>-->
<div style="width: 100%">
    <div style="display: inline; padding-left:120px">
        <a href=""><img src="${context.contextPath}/images/logo/banner.png"/></a>
    </div>
</div>
<!--头部-->
<div style="width: 100%;">
    <div>
    <#--<div style="display: inline;padding-left: 5px;">-->
    <#--<a style="margin: 0;width: 150px !important;height: 50px !important;" href=""><img src="${context.contextPath}/images/logo/qx-logo.png"/></a>-->
    <#--</div>-->
        <div style="padding-top:20px;padding-left:1030px;">
            <a style="text-decoration:none;" href="${context.contextPath}/bbs/user/update/${user.id?c}" ><img src="${context.contextPath}/images/user/${user.pictureUrl}" width="32px" height="32px">&nbsp;&nbsp;&nbsp;${user.nickname}</a>
        </div>
    </div>
</div>
<!--写文章模块-->
<div class="container" style="width: 1020px;">
    <!--写文章的标题-->
    <div>
        <h1 style="text-align: center;">编辑文章 &#8211; Editing</h1>
        <div style="width: 100%">
            <form role="form" style="padding-top: 20px">
                <div class="form-group">
                    <label for="title">标题：</label>
                    <input type="text" class="form-control site-description" name="title" id="title" placeholder="请输入文章的标题">
                </div>
                <br>
                <div class="form-group">
                    <label for="titleColor">标题颜色：</label>
                    <select class="form-control" name="titleColor" id="titleColor">
                        <option value="black">黑色（默认）</option>
                        <option value="grey">灰色</option>
                        <option value="red">红色</option>
                        <option value="blue">蓝色</option>
                        <option value="yellow">黄色</option>
                        <option value="green">绿色</option>
                        <option value="orange">橙色</option>
                        <option value="purple">紫色</option>
                        <option value="indigo">靛色</option>
                    </select>
                </div><br>
            <#if user?exists && user.policeId == "admin">
                <div class="form-group">
                    <label for="author">作者：</label>
                    <input type="text" class="form-control site-description" name="author" id="author" placeholder="请输入作者，如果不填默认为当前登录用户！">
                </div><br>
            </#if>
                <div class="form-group">
                    <!-- 加载编辑器的容器 -->
                    <script id="container" name="content" type="text/plain">
                    </script>
                </div>
                <!--领导批语-->
                <#if user?exists && user.policeId == "admin">
                <div class="form-group">
                    <label for="name">领导批示</label>
                    <textarea class="form-control" rows="3" id="leadComment"></textarea>
                </div>
                </#if>
            </form>
        </div>
        <br>

    </div>
    <!--提交文章按钮部分-->
    <div id="edit-submit" style="text-align: center;padding-bottom: 50px;">
        <a href="javascript:void (0)" type="button" class="btn btn-info" onclick="submit();">提交文章</a>
    </div>
    <div id="edit-submiting" style="display: none">
        <a class="alm-load-more-btn  btn load-more";">提交中...</a>
    </div>
</div>

<!--底部-->
<div>
    <div style="width: 100%; background-color: #eeeeee;height: 70px;position:static;">
        <div class="text" style="padding-top: 20px;">
            <div style="text-align: center;font-size: larger;">Copyright © 2017 栖霞公安分局</div>
        </div>
    </div>
</div>

<!-- 模态框（Modal）开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" >
        <div class="modal-content" style="background-color:#d0e4fe;">
            <div class="modal-body" style="text-align: center;">
                <h5 id="submit">提交成功，请等待管理员审核！</h5>
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
        var titleColor = $("#titleColor option:selected").val();
        var abstract;
        var leadComment = $("#leadComment").val();
        var author = $("#author").val();
        //获取摘要的内容
        if(txt.length>50){
            abstract=txt.substring(0,49);
        }else{
            abstract=txt;
        }

        var param = {
            'id': ${article.id?c},
            'title': title,
            'titleColor': titleColor,
            'summary': abstract,
            'content': content,
            'leadComment': leadComment,
            'author': author
        };

        var url = "${context.contextPath}/article/update"
        $.ajax({
            url: url,
            type: "POST",
            data: param,
            success: function (data) {
                if (data == 1) {
                    alert("恭喜你，文章修改成功！等待管理员审核!");
                    <#if user.policeId == "admin">
                        window.location.href = "${context.contextPath}/admin/home";
                    <#else>
                        window.location.href = "${context.contextPath}/bbs/home";
                    </#if>
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

</script>
</html>

