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
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="post-template-default single single-post postid-340 single-format-standard group-blog">
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
                            <li><a href="" ><img src="${context.contextPath}/images/user/admin.jpg" width="32px" height="32px">&nbsp;&nbsp;&nbsp;admin</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</div>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
    <#if article?exists>
        <article id="post-340" class="post-340 post type-post status-publish format-standard has-post-thumbnail hentry category-_bbc34a">
            <div class="article-content">
                <header class="article-header">
                    <h1 class="article-title">${article.title}</h1>
                    <div class="article-meta"><span class="posted-on"><time class="entry-date published" datetime="">发表时间：${(article.createTime?string("yyyy年MM月dd日 HH:mm:ss"))!''}<br/>修改时间：${(article.updateTime?string("yyyy年MM月dd日 HH:mm:ss"))!''}</time></span></div>
                    <#--<div class="article-meta"><span class="posted-on"><time class="entry-date published" datetime="">修改时间：${(article.updateTime?string("yyyy年MM月dd日 HH:mm:ss"))!''}  </time></span></div>-->
                </header>
                <p class="p1" style="text-align: center;"><strong><span class="s1">| 作者：<#if article.userNickname ?exists>${article.userNickname}</#if> |</span></strong></p>
                <p class="p1" style="text-align: center;"><span id="more-340"></span></p>
                <hr />
                <#if article.content ?exists>
                    ${article.content}
                <#else>
                    <div><img src="${context.contextPath}/images/no-content.jpg" width="640" height="379" align="center"></div>
                    <br/>
                    <p class="p1" style="text-align: center;"><span class="s1">这家伙很懒，没有留下帖子的内容。。。</span></p>
                </#if>
            </div>
        </article>
    </#if>
    </main>
</div>


<footer class="site-footer hack-webkit-render">
    <div class="copyright">
        <div class="container max1010">
            <div class="copyandlang text">
                <div style="text-align: center;">Copyright © 2017 栖霞区公安分局</div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
