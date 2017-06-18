<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>栖霞创客</title>
    <meta name="description" itemprop="description" content="栖霞创客平台主要用于栖霞区公安系统内部人员展示自己非凡的创意" />
    <meta name="keywords" itemprop="keywords" content="栖霞区、公安局、创客" />

    <link rel='stylesheet' id='style-css'  href='${context.contextPath}/css/common/style.css' type='text/css' media='all' />
    <link rel='stylesheet' id='font-awesome-css'  href='${context.contextPath}/css/common/font-awesome.css' type='text/css' media='screen' />
    <link rel="stylesheet" href="${context.contextPath}/css/home.css">
    <script type='text/javascript' src='${context.contextPath}/js/jquery.1.9.js'></script>
    <script type="text/javascript">
        //页面初始化： 初始化精品区和初始化普通区
        $(document).ready(function () {
            excellentInit(1);
            commonInit(1);
        })
    </script>
</head>
<body class="home blog group-blog">
<#--page header start-->
<div id="page" class="hfeed site">
    <header class="site-header">
        <div class="container">
            <nav class="navbar" role="navigation">
                <div class="navbar-header">
                <a style="margin: 0;width: 150px !important;height: 50px !important;" href=""><img src="${context.contextPath}/images/logo/qx-logo.png"/></a>
                </div>
                <div class="collapse navbar-collapse">
                    <div class="items-wrap">
                        <ul class="nav navbar-nav">
                            <li><a href="" ><img src="${context.contextPath}/images/user/<#if user.pictureUrl?exists>${user.pictureUrl}<#else>default-1.jpg</#if>" width="32px" height="32px">&nbsp;&nbsp;&nbsp;${user.nickname}</a></li>
                        </ul>
                        <ul class="nav navbar-nav">
                            <li><a style="float: right;width: 100px;height: 38px;line-height: 24px;margin: 9px 15px 0;border-radius: 4px;font-size: 15px;color: #fff;background-color: #00a0e9;"
                                   href="${context.contextPath}/bbs/write">写文章</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</div>
<#--page header end-->

<#--page content start-->
<div id="primary" class="content-area">
    <div id="main" class="site-main" role="main">

        <#--first part start-->
        <div class="site-branding excellent-cards">
            <h1 class="site-title"><a rel="home">精品推荐区</a></h1>
            <hr/>
        </div>
        <div id="first-part" class="cards">
            <#--content锚点-->
            <div id="first-part-content"></div>
            <#--分页-->
            <#--paging锚点-->
            <div id="first-part-page"></div>

        </div>
        <#--first part end-->

        <#--second part start-->
        <div class="site-branding all-cards">
            <h1 class="site-title"><a rel="home">自由讨论区</a></h1>
            <hr/>
        </div>
        <div id="second-part" class="cards">
            <#--content锚点-->
            <div id="second-part-content"></div>
            <#--分页-->
            <#--paging锚点-->
            <p><div id="second-part-page"></div></p>
        </div>
        <#--second part end-->
    </div>
</div>
<#--page content end-->

<#--page footer start-->
<footer class="site-footer hack-webkit-render">
    <div class="copyright">
        <div class="container max1010">
            <div class="copyandlang text">
                Copyright © 2017 南京栖霞区公安分局
            </div>
        </div>
    </div>
</footer>
<#--page footer end-->

</body>
<script type="text/javascript">
    function excellentInit(page) {
        var articlelist = '';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求精品帖子list
        $.ajax({
            url: "${context.contextPath}/article/better/list?page=" + page,
            type: "GET",
            success: function (data) {
                if (data != null) {
                    if (data.list != null){
                        for (var i = 0; i < data.list.length; i++){
                            var article = data.list[i];
                            articlelist = articlelist + appendArticleHTML(article);
                        }
                        paging = excellentPageing(data.pageInfo);
                    }
                    $("#first-part-content").html(articlelist);
                    $("#first-part-page").html(paging);
                }
            }
        });
    }
    function commonInit(page) {
        var articlelist = '';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求普通区域帖子list
        $.ajax({
            url: "${context.contextPath}/article/common/list?page=" + page,
            type: "GET",
            success: function (data) {
                if (data != null) {
                    if (data.list != null){
                        for (var i = 0; i < data.list.length; i++){
                            var article = data.list[i];
                            articlelist = articlelist + appendArticleHTML(article);
                        }
                        paging = commonPageing(data.pageInfo);
                    }
                    $("#second-part-content").html(articlelist);
                    $("#second-part-page").html(paging);
                }
            }
        });
        return
    }

    //精品分页
    function excellentPageing(pageInfo) {
        var html = '';
        var pre = pageInfo.prePage;
        var current = pageInfo.pageCurrent;
        var next = pageInfo.nextPage;
        var pages = pageInfo.pages;

        if (pageInfo != null){
            html = '<nav aria-label="Page navigation"><ul class="pagination"><li><a href="javascript:void(0)" onclick="excellentInit(' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
                    + '<li class="active"><a>' + current + '/' + pages + '</a></li>'
                    + '<li><a href="javascript:void(0)" onclick="excellentInit(' + next + ');" aria-label="Next"><span aria-hidden="true">下一页</span></a></li></ul></nav>	';
        }
        return html;
    }
    //普通区域分页
    function commonPageing(pageInfo) {
        var html = '';
        var pre = pageInfo.prePage;
        var current = pageInfo.pageCurrent;
        var next = pageInfo.nextPage;
        var pages = pageInfo.pages;
        if (pageInfo != null){
            html = '<nav aria-label="Page navigation"><ul class="pagination"><li><a href="javascript:void(0)" onclick="commonInit(' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
                    + '<li class="active"><a>' + current + '/' + pages + '</a></li>'
                    + '<li><a href="javascript:void(0)" onclick="commonInit(' + next + ');" aria-label="Next"><span aria-hidden="true">下一页</span></a></li></ul></nav>';
        }
        return html;
    }

    //拼装article信息（HTML）
    function appendArticleHTML(article) {
        var html = '';
        if (article != null){
            var summary = article.summary;
            var picture = article.pictureUrl;
            var time = new Date(article.createTime);
            if (summary == null)
                summary = '这家伙很懒，没有留下任何内容。。。';
            if (picture == null)
                picture = 'default-1.jpg';
            html =  '<article id="post" class="post post type-post status-publish format-standard has-post-thumbnail hentry category">'
                    + '<a class="link-wrap" href="${context.contextPath}/bbs/info/' + article.id + '" target="_blank"><div class="img-box"><img width="100" height="100" src=" ' + '${context.contextPath}/images/user/'
                    + picture + '"/></div><div class="height-limiter"><div class="entry-header"><h2 class="entry-title">'
                    + article.title + '</h2></div><div class="entry-content">'
                    + summary + '</div></div><div class="entry-meta"><span class="posted-on"><time class="entry-date publised">'
                    + time.toLocaleString() + '</time></span></div></a></article>';
        }
        return html;
    }
</script>
</html>

