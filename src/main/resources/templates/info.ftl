<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <#if article ?exists && article.title ?exists>${article.title}</#if>
    </title>
    <link rel='stylesheet' href='${context.contextPath}/css/common/style.css' type='text/css' media='all' />
    <link rel='stylesheet' href='${context.contextPath}/css/common/font-awesome.css' type='text/css' media='screen' />
    <link rel="stylesheet" href="${context.contextPath}/css/info-comments.css" type="text/css">
    <link rel="stylesheet" href="${context.contextPath}/css/home.css" type="text/css">
    <script type='text/javascript' src='${context.contextPath}/js/jquery.1.9.js'></script>
    <script type='text/javascript' src='${context.contextPath}/js/bootstrap.min.js'></script>
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${context.contextPath}/js/ueditor/ueditor.all.js"></script>
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        //页面初始化： 初始化评论区
        $(document).ready(function () {
            commentInit(${article.id ?c},1);
        })
    </script>
</head>
<body class="post-template-default single single-post postid-340 single-format-standard group-blog">
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
                            <#--<li><a href="${context.contextPath}/bbs/user/update/${user.id?c}" ><img src="${context.contextPath}/images/user/<#if user.pictureUrl?exists>${user.pictureUrl}<#else>default-1.jpg</#if>" width="32px" height="32px">&nbsp;&nbsp;&nbsp;${user.nickname}</a></li>-->
                            <#--<li><a href="javascript:void(0)" onclick="logout();">注销</a></li>-->
                        <#--</ul>-->
                        <#--<ul class="nav navbar-nav">-->
                            <#--&lt;#&ndash;<li><a style="float: right;width: 100px;height: 38px;line-height: 24px;margin: 9px 15px 0;border-radius: 4px;font-size: 15px;color: #fff;background-color: #00a0e9;"&ndash;&gt;-->
                                   <#--&lt;#&ndash;href="${context.contextPath}/bbs/write">写文章</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</li>&ndash;&gt;-->
                            <#--<#if article?exists && user?exists && article.userId == user.id>-->
                            <#--<li style="text-align:right;padding-top: 10px;padding-right: 10px">-->
                                <#--<a class="btn btn-primary " href="${context.contextPath}/bbs/edit/<#if article?exists>${article.id?c}</#if>" role="button">修改</a>-->
                            <#--</li>-->
                            <#--</#if>-->
                            <#--<li style="text-align:right;padding-top: 10px;padding-right: 10px;">-->
                                <#--<a class="btn btn-primary " href="${context.contextPath}/bbs/write">写文章</a>-->
                            <#--</li>-->
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
            <#if article?exists && user?exists && article.userId == user.id>
            <a class="btn btn-primary " href="${context.contextPath}/bbs/edit/<#if article?exists>${article.id?c}</#if>" role="button">修改</a>
            </#if>
            <a class="btn btn-primary " href="${context.contextPath}/bbs/write" role="button">写文章</a>
            <span><a href="${context.contextPath}/bbs/user/update/${user.id?c}">${user.nickname}</a></span>&nbsp&nbsp
            <a href="javascript:void(0)" onclick="logout();">注销</a>
        </div>

    </div>
</nav>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
    <#if article?exists>
        <article id="post" class="post post type-post status-publish format-standard has-post-thumbnail hentry category">
            <div class="article-content">
                <header class="article-header">
                    <h1 class="article-title">${article.title}</h1>
                    <div class="article-meta"><span class="posted-on"><time class="entry-date published" datetime="">发表时间：${(article.createTime?string("yyyy年MM月dd日 HH:mm:ss"))!''}</time></span></div>
                </header>
                <p class="p1" style="text-align: center;"><strong><span class="s1">| 作者：<#if author?exists>${author.nickname}</#if> |</span></strong></p>
                <#--<p class="p1" style="text-align: center;"><span id="more"></span></p>-->
                <hr />
                <#if article.content ?exists>
                    ${article.content}
                <#else>
                    <div><img src="${context.contextPath}/images/no-content.jpg" width="640" height="379" align="center"></div>
                    <br/>
                    <p class="p1" style="text-align: center;"><span class="s1">这家伙很懒，没有留下帖子的内容。。。</span></p>
                </#if>

                <div class="article-footer">
                    <div class="article-comment">
                        <div id="comment_editor" class="comment_editor">
                            <script id="container" name="content" type="text/plain">
                            </script>
                            <#--<p style="text-align:right;padding-top: 10px;padding-right: 10px"><button type="button" class="btn btn-info" id="comment-submit" onclick="submit(${article.id?c}, ${user.id?c})">提交评论</button></p>-->
                            <p style="text-align:right;padding-top: 10px;padding-right: 10px" id="comment-submit"><a href="javascript:void (0)" type="button" class="btn btn-primary" onclick="submit(${article.id?c}, ${user.id?c});">提交评论</a></p>
                            <p style="text-align:right;padding-top: 10px;padding-right: 10px; display: none" id="comment-submiting"><a type="button" class="btn btn-primary">提交...</a></p>
                        </div><hr>
                    </div>

                    <!-- 底部评论区 -->
                        <div class="mod-head">
                            <ul class="nav nav-tabs aw-nav-tabs active">
                                <h2 class="hidden-xs">${article.commentNum} 个评论</h2>
                            </ul>
                        </div>
                        <div class="mod-body aw-feed-list">
                            <div id="comment-content"></div>
                        </div>
                        <div id="comment-page" align="right"></div>
                    <!-- end 底部评论区 -->
                </div>
        </article>
    </#if>
    </main>
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

<footer class="site-footer hack-webkit-render">
    <div class="copyright">
        <div class="container max1010">
            <div class="text">
                <div style="text-align: center;">Copyright © 2017 栖霞区公安分局</div>
            </div>
        </div>
    </div>
</footer>
</body>
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

    function commentInit(id, page) {

        var commentlist = '';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求评论信息
        $.ajax({
            url: "${context.contextPath}/comment/list?id=" + id + "&page=" + page,
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
                        commentlist = '<div style="text-align:center"><Strong>智慧如你，不想发表一点想法咩~~~</Strong></div>';
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
            html = '<nav aria-label="Page navigation" ><ul class="pagination"><li><a href="javascript:void(0)" onclick="commentInit(<#if article?exists>${article.id ?c}</#if>,' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
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
            var time = new Date(comment.createTime);
            if (picture == null){
                picture = 'default-1.jpg';
            }
            html = '<div class="aw-item" id="answer_list"><div class="mod-head"><a class="anchor"></a>'
                    + '<a class="aw-user-img aw-border-radius-5 pull-right"><img src="${context.contextPath}/images/user/'
                    + picture + '"/></a><div class="title"><p><a class="aw-user-name">' + comment.nickname
                    + '</a></p></div></div><div class="mod-body clearfix"><div class="markitup-box">' + comment.content
                    + '</div></div><div class="mod-footer"><div class="meta clearfix"><span class="text-color-999 pull-right">'
                    + time.toLocaleString() + '</span></div></div></div>';
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
        $("#comment-submit").hide();
        $("#comment-submiting").show();
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
                    $('#myModal').modal({
                        keyboard: true
                    });
                    ue.setContent('');
                }else {
                    $("#submit").text("提交评论失败，请重试！")
                    $('#myModal').modal({
                        keyboard: true
                    });
                }
                $("#comment-submit").show();
                $("#comment-submiting").hide();
            },
            error:function(){
                $("#submit").text("提交评论失败，请重试！");
                $('#myModal').modal({
                    keyboard: true
                });
                $("#comment-submit").show();
                $("#comment-submiting").hide();
            }
        });
    }
</script>
</html>
