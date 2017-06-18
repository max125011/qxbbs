<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Writing By皇甫</title>
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
</head>

<body>
    <!--顶部logo-->
    <div style="width: 100%">
        <div style="display: inline;padding-left: 5px;">
            <a href=""><img style="width: 100%;height: 140px;" src="${context.contextPath}/images/logo/banner.jpg"/></a>
        </div>
    </div>
    <!--头部-->
    <div style="width: 100%;">
        <div>
            <div style="display: inline;padding-left: 5px;">
                <a style="margin: 0;width: 150px !important;height: 50px !important;" href=""><img src="${context.contextPath}/images/logo/qx-logo.png"/></a>
            </div>
            <div style="display: inline;padding-top:20px;padding-left:840px;">
                <a style="text-decoration:none;" href="" ><img src="${context.contextPath}/images/user/default-1.jpg" width="32px" height="32px">&nbsp;&nbsp;&nbsp;滴水沧海</a>
            </div>
        </div>
    </div>
    <!--写文章模块-->
    <div class="container" style="width: 1020px;padding-top: 50px;">
        <!--写文章的标题-->
        <div>
            <h1 style="text-align: center;">写文章 &#8211; Writing</h1>
            <div style="width: 100%">
                <form role="form" style="padding-top: 20px">
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
        <div style="width: 100%; background-color: #080808;height: 70px;position:static;">
            <div class="text" style="padding-top: 20px;">
                <div style="text-align: center;font-size: larger;color: white;">Copyright © 2017 栖霞区公安分局</div>
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
        var isPublic= 2;
        if ($("input[type='checkbox']").is(':checked')) {
            isPublic = 1;
        }else{
            isPublic = 2;
        }
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
            'isPublic': isPublic
        };

        var url = "${context.contextPath}/article/insert"
        $.ajax({
            url: url,
            type: "POST",
            data: param,
            success: function (data) {
                if (data == 1) {
//                    $('#myModal').modal({
//                        keyboard: true
//                    });
                    alert("恭喜你，文章提交成功！");
                    window.location.href = "${context.contextPath}/bbs/home";
                }else {
                    $("#submit").text("文章评论失败，请重试！")
                    $('#myModal').modal({
                        keyboard: true
                    });
                    $("#edit-submit").show();
                    $("#edit-submiting").hide();
                }
            },
            error:function(){
                $("#submit").text("文章提交失败，请重试！")
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

