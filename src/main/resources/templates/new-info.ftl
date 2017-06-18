<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
    <#if article ?exists && article.title ?exists>${article.title}</#if>
    </title>
    <title>info页</title>
    <link href="${context.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script type='text/javascript' src='${context.contextPath}/js/jquery.1.9.js'></script>
    <script type='text/javascript' src='${context.contextPath}/js/bootstrap.min.js'></script>
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${context.contextPath}/js/html5media/html5media.min.js"></script>
    <script type="text/javascript">
        //页面初始化： 初始化评论区
        $(document).ready(function () {
            commentInit(${article.id ?c},1);
        })
    </script>
</head>
<body style="">
    <div style="width: 100%">
        <div style="display: inline; padding-left:120px">
            <a href="${context.contextPath}/bbs/home"><img src="${context.contextPath}/images/logo/banner.png"/></a>
        </div>
    </div>
    <!--头部-->
    <nav class="" role="navigation" style="height: 60px;">
        <div class="container-fluid">
            <div style="display: inline;float: right;padding-top: 15px;padding-right: 40px">
            <#if article?exists && user?exists && article.userId == user.id>
                <a class="btn btn-primary " href="${context.contextPath}/bbs/edit/<#if article?exists>${article.id?c}</#if>" role="button">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </#if>
                <a class="btn btn-primary " href="${context.contextPath}/bbs/write" role="button">发帖子</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <#if user?exists>
                    <a style="text-decoration:none;" href="${context.contextPath}/bbs/user/update/${user.id?c}" ><img src="${context.contextPath}/images/user/${user.pictureUrl}" width="32px" height="32px">&nbsp;${user.nickname}</a>&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="logout();">注销</a></div>
                <#else>
                    <a>游客</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${context.contextPath}/login">登录</a></div>
                </#if>

        </div>
    </nav>


    <div class="container" id="primary" class="content-area" style="padding-top:40px;margin: auto;width:800px;margin: 0 auto;">
        <#if article?exists>
            <div class="article-content">
                <div>
                    <div align="center">
                        <div style="font-family: SimSun; font-size: 28pt"><div style="color: <#if article.titleColor?exists>${article.titleColor}<#else>black</#if>">${article.title}</div></div>
                        <div style="padding-top:20px;color: #6e6e6e;">
                            <span class="s1">作者：
                                <#if article.author?exists && article.author != "">
                                    ${article.author}
                                <#else>
                                    ${author.nickname}
                            </#if></span>&nbsp;&nbsp;
                            <span class="posted-on"><time class="entry-date published" datetime="">发表时间：${(article.createTime?string("yyyy年MM月dd日 HH:mm:ss"))!''}</time></span>
                        </div>
                    </div>
                </div>
                <#--<p style="text-align: center;padding-top: 20px;"><strong><span class="s1">作者：${author.nickname}</span></strong></p>-->
                <hr/>

                <!--文章内容-->
                <div style="font-size: 14pt; font-family: SimSun; line-height: 250%">
                <#if article.content?exists>
                <div>
                    ${article.content}
                </div><hr/>
                <#else>
                <div style="text-align: center">
                    <img src="${context.contextPath}/images/no-content.jpg" width="640" height="379" align="center">
                </div>
                <br/>
                <p class="p1" style="text-align: center;"><span class="s1">这家伙很懒，没有留下帖子的内容。。。</span></p>
                <hr/>
                </#if>
                </div>
            </div>
        </#if>
            <!--领导批示区-->
            <#if article.better?exists && article.better == 1 && article.leadComment?exists>
            <div style="background-image: url(${context.contextPath}/images/lead_comment_background.jpg); min-height: 150px; background-size:100% 100%; background-repeat: no-repeat" >
                <div style="padding-top: 20px; padding-left: 70px; padding-bottom: 15px; padding-right: 25px">
                    <p style="font-size: 18pt; font-family: SimHei">${article.leadComment}</p>
                </div>
            </div><hr>
            </#if>
            <!--评论编辑区-->
            <div class="article-comment">
                <div id="comment_editor" class="comment_editor" style="padding-left: 10px;">
                    <script id="container" name="content" type="text/plain">
                    </script>
                    <p style="text-align:right;padding-top: 10px;padding-right: 10px"><button type="button" class="btn btn-info" id="comment-submit" onclick="submit(${article.id?c}, <#if user?exists>${user.id?c}<#else>1</#if>);">提交评论</button></p>
                </div>
            </div>
        <#--<hr>-->

            <!-- 底部评论区 -->
            <div class="comment_bottom" style="padding-left: 10px;">
                <h2>${article.commentNum} 个评论</h2>
            </div>
            <hr/>
            <!--评论内容-->
            <div id="comment-content" style="padding-left:10px;">
                <#if comments?exists>
                    <#list comments as comment>
                        <div id="comment-content"></div>
                    </#list>
                </#if>
            </div>
            <!--评论分页-->

            <div id="comment-page"></div>
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

        <!--底部-->
    <div class="copyright" style="background-color: #eeeeee; height:78px;float:inherit;">
        <div class="container max1010">
            <div style="padding-top: 25px;padding-bottom: 20px;font-size: larger;text-align: center">
                <p style="font-size: 16px;">Copyright © 2017 栖霞公安分局</p>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">

    function logout() {
        var url = "${context.contextPath}/logout";
        $.ajax({
            url: url,
            type: "POST",
            success: function (data) {
                if (data != null && data == 1) {
                    window.location.reload();
                }
            }
        });
    }
    function commentInit(id, page) {

        var commentlist = '';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求评论信息
        $.ajax({
            url: "${context.contextPath}/comment/list?id=" + id + "&page=" + page + "&timestamp=" + new Date().getTime(),
            type: "GET",
            success: function (data) {
                if (data != null) {
                    if (data.list != null && data.list.length > 0){
                        for (var i = 0; i < data.list.length; i++){
                            var comment = data.list[i];
                            commentlist = commentlist + appendCommentHTML(comment);
                        }
                        paging = commentPageing(data.pageInfo);
                        $("#comment-content").html(commentlist);
                        $("#comment-page").html(paging);
                    }else {
                        commentlist = '<div style="text-align:center"><Strong>智慧如你，不想发表一点想法咩~~~</Strong><br/><br/></div>';
                        $("#comment-content").html(commentlist);
                    }
                }
            }
        });
    }
    //分页
    function commentPageing(pageInfo) {
        var html = '';
        var pre = pageInfo.prePage;
        var current = pageInfo.pageCurrent;
        var next = pageInfo.nextPage;
        var pages = pageInfo.pages;

        if (pageInfo != null){
            html = '<nav aria-label="Page navigation" align="right"><ul class="pagination"><li><a href="javascript:void(0)" onclick="commentInit(<#if article?exists>${article.id ?c}</#if>,' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
                    + '<li><a>' + current + '/' + pages + '</a></li>'
                    + '<li><a href="javascript:void(0)" onclick="commentInit(<#if article?exists>${article.id ?c}</#if>,' + next + ');" aria-label="Next"><span aria-hidden="true">下一页</span></a></li></ul></nav>	';
        }
        return html;
    }

    //拼装comment信息（HTML）
    function appendCommentHTML(comment) {
        var html = '';
        if (comment != null){
            var picture = comment.pictureUrl;
            if (picture == null)
                picture = 'default-1.jpg';
            html = '<p><a style="text-decoration:none;"><img src="${context.contextPath}/images/user/' + comment.pictureUrl + '" width="32px" height="32px">&nbsp;&nbsp;&nbsp;' + comment.nickname + '</a></a><br/>'
                    + comment.content + '<hr/></p>';
        }
        return html;
    }
</script>

<#--评论框JS-->
<script type="text/javascript">
    //UEditor配置
    var ue = UE.getEditor( 'container', {
        autoHeightEnabled: true,
        autoFloatEnabled: true,
        initialFrameWidth: 750,
        initialFrameHeight:150,
        toolbars:[['emotion']]
    });

    function submit(articleId, userId){
//        $("#comment-submit").attr("disabled", "true");
        if(userId == 1 || userId == "1"){
            window.location.href = "${context.contextPath}/login";
            return;
        }
        var comment_content;//评论内容，经过编辑过的
        var commnet_txt;//评论内容，存文本
        ue.ready(function() {
            //设置编辑器的内容
            comment_content = ue.getContent();
            commnet_txt = ue.getContentTxt();
        });
        // url需要改成评论的url，后台提供
        //需要传给后台的参数有（评论内容,评论人Id,评论时间）
        var param = {
            'articleId': articleId,
            'userId': userId,
            'content': comment_content
        };

        var url = "${context.contextPath}/comment/insert"
        $.ajax({
            url: url,
            type: "POST",
            data: param,
            success: function (data) {
                if (data == 1) {
//                    $('#myModal').modal({
//                        keyboard: true
//                    });
//                    ue.setContent('');
                    alert("评论成功！请点击确定刷新页面！");
                    window.location.reload();
                }else {
                    $("#submit").text("提交评论失败，请重试！")
                    $('#myModal').modal({
                        keyboard: true
                    });
                }
                $("#comment-submit").attr("disabled", "false");
            },
            error:function(){
                $("#submit").text("提交评论失败，请重试！");
                $('#myModal').modal({
                    keyboard: true
                });
                $("#comment-submit").attr("disabled", "false");
            }
        });
        $("#comment-submit").attr("disabled", "true");
    }
</script>
</html>
