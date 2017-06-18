<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>栖霞创客</title>
    <link href="${context.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            padding-bottom:0px;
            color: #5a5a5a;
        }

        .main {
            padding: 20px;
        }

        /*.content-list {*/
            /*color: black;*/
        /*}*/

    </style>
    <script type='text/javascript' src='${context.contextPath}/js/jquery.1.9.js'></script>
    <script type="text/javascript">
        //页面初始化： 初始化精品区和初始化普通区
        $(document).ready(function () {
            excellentInit(1);
            commonInit(1);
        })
    </script>

</head>

<body style="background-color: #F5F5F5">
<div style="width: 100%">
    <div style="display: inline; padding-left: 142px">
        <a href="${context.contextPath}/bbs/home"><img src="${context.contextPath}/images/logo/banner.png"/></a>
    </div>
</div>

<!—精品推荐区-->
<div class="content" style="padding-top:0px;padding-left:130px;">
    <div class="container-fluid">
        <!—右侧管理控制台-->
        <div class="col-md-11 main">
            <div class="row">
                <div class="col-md-12">
                    <div style="padding-left:15px;background-color:#116abf;height:40px;width:100%;border-style:solid;border-width:1px;border-color:#116abf;">
                    <#--<div style="padding-left:15px;background-color:#116abf;height:40px;width:975px;">-->
                        <div style="display: inline;float: left;padding-top: 10px;">
                            <span style="color:white; font-size: larger">栖霞创客</span>
                        </div>
                    </div>

                    <div style="padding-left:15px;background-color: #eeeeee;height: 60px;width:100%;border-color:#116abf;border-width:thin;border-style:solid">

                        <div style="display: inline;float: left;padding-top: 20px;">今天是
                        ${time}<span>&nbsp;&nbsp;欢迎您: </span>&nbsp;<a <#if user?exists>
                                    href="${context.contextPath}/bbs/user/update/${user.id?c}">${user.nickname}
                                    <#else>
                                    > 游客
                        </#if></a>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div style="display: inline;float: right;padding-top: 15px;">
                            <#if user?exists>
                                <a href="javascript:void(0)" onclick="logout();">注销</a>&nbsp;&nbsp;
                            <#else>
                                <a href="${context.contextPath}/login">登录</a>&nbsp;&nbsp;
                            </#if>

                            <a class="btn btn-primary " href="${context.contextPath}/bbs/write" role="button">发帖子</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>

                 </div>
                <div class="col-md-12" style="padding-top: 20px">
                    <div class="panel-primary" style="background-color: #FFFFFF;border-style: solid;border-width:1px;">
                        <div  style="">
                            <p style="color:#00a0e9 ;padding-top:15px;padding-left:15px;font-size:18px;background-color: #EEEEEE;height: 50px;">
                                精品推荐区</p>
                        </div>
                        <div class="panel-body">
                                <div id="first-part-content" class="content-list"></div>
                            <!-- 精品推荐区分页-->
                            <div>
                                <div id="first-part-page" align="right"></div>
                            </div>

                        </div>
                        <div  style="">
                            <#--<p style="color:white;padding-top:5px;font-size:28px;background-color: #116abf;height: 50px;">-->
                                <#--自由讨论区</p>-->
                            <p style="color:#00a0e9 ;padding-top:15px;padding-left:15px;font-size:18px;background-color: #EEEEEE;height: 50px;">
                                自由讨论区</p>
                        </div>
                        <div class="panel-body">
                                <div id="second-part-content" class="content-list"></div>
                            <!--自由讨论区分页 -->
                            <div>
                                <div id="second-part-page" align="right"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!—页尾-->
<div class="copyright" style="background-color: #eeeeee; height:80px;float:inherit;">
    <div class="container max1010">
        <div style="padding-top: 15px;padding-bottom: 15px;font-size: larger">
            <p style="font-size: 14px;text-align: center"><a href="${context.contextPath}/admin-login">管理员登录</a></p>
            <p style="font-size: 16px;text-align: center">Copyright © 2017 栖霞公安分局</p>
        </div>
    </div>
</div>

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
    function excellentInit(page) {
        var articlelist = '<table class="table"><thead><tr><th width="550px">文章</th><th width="180px">作者</th><th width="50px">回复</th><th width="50px">查看</th><th width="100px">发表时间</th></tr></thead><tbody>';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求精品帖子list
        $.ajax({
            url: "${context.contextPath}/article/better/list?page=" + page + "&timestamp=" + new Date().getTime(),
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
                    articlelist = articlelist + '</tbody></table>';
                    $("#first-part-content").html(articlelist);
                    $("#first-part-page").html(paging);
                }
            }
        });
    }
    function commonInit(page) {
        var articlelist = '<table class="table"><thead><tr><th width="550px">文章</th><th width="180px">作者</th><th width="50px">回复</th><th width="50px">查看</th><th width="100px">发表时间</th></tr></thead><tbody>';
        var paging = '';
        if (page < 1){
            page = 1;
        }
        //请求普通区域帖子list
        $.ajax({
            url: "${context.contextPath}/article/common/list?page=" + page + "&timestamp=" + new Date().getTime(),
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
                    articlelist = articlelist + '</tbody></table>';
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
            html = '<nav aria-label="Page navigation" align="right"><ul class="pagination"><li><a href="javascript:void(0)" onclick="excellentInit(' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
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
            html = '<nav aria-label="Page navigation" align="right"><ul class="pagination"><li><a href="javascript:void(0)" onclick="commonInit(' + pre + ');" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>'
                    + '<li class="active"><a>' + current + '/' + pages + '</a></li>'
                    + '<li><a href="javascript:void(0)" onclick="commonInit(' + next + ');" aria-label="Next"><span aria-hidden="true">下一页</span></a></li></ul></nav>';
        }
        return html;
    }

    //拼装article信息（HTML）
    function appendArticleHTML(article) {
        var nickname = article.nickname;
        var titleColor = "black";
        if (article.titleColor != null && article.titleColor != ""){
            titleColor = article.titleColor;
        }
        if(article.author != null && article.author != ""){
            nickname = article.author;
        }
        var html = '';
        if (article != null){
            var time = new Date(article.createTime);
            if (article.top != null && article.top == 1){
                html = '<tr><td><a href="${context.contextPath}/bbs/info/' + article.id + '"><span style="color: ' + titleColor + '"><span style="color:red">【顶】</span>' + article.title + '</span></a></td><td>'
                        + nickname + '</td><td>' + article.commentNum + '</td><td>' + article.readTimes + '</td><td>' + time.Format("yyyy-MM-dd") +'</td></tr>';
            }else {
                html = '<tr><td><a href="${context.contextPath}/bbs/info/' + article.id + '"><span style="color: ' + titleColor + '">' + article.title + '</span></a></td><td>'
                        + nickname + '</td><td>' + article.commentNum + '</td><td>' + article.readTimes + '</td><td>' + time.Format("yyyy-MM-dd") +'</td></tr>';
                }
            }
        return html;
    }
</script>




<script type="text/javascript">
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</body>
</html>



