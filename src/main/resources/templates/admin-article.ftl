<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>管理员系统</title>
    <link rel="stylesheet" href="${context.contextPath}/css/admin-style.css" type="text/css" media="all" />
    <script type="text/javascript" src="${context.contextPath}/js/jquery.1.9.js"></script>
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script language="JavaScript" type="text/javascript">
        function deleteArticle(id){
            var url = "${context.contextPath}/admin/article/delete/" + id;
            $.ajax({
                url: url,
                type: "POST",
                success: function (data) {
                    if (data == 1) {
                        $("#success").show(500);
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000)
                    } else {
                        $("#fail").show(500);
                        setTimeout(function () {
                            $("#fail").show(500);
                        }, 500)
                    }
                }
            });
        }
    </script>

    <script language="JavaScript" type="text/javascript">
        function betterArticle(id){
            var url = "${context.contextPath}/admin/article/better/" + id;
            $.ajax({
                url: url,
                type: "POST",
                success: function (data) {
                    if (data == 1) {
                        $("#success").show(500);
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000)
                    } else {
                        $("#fail").show(500);
                        setTimeout(function () {
                            $("#fail").show(500);
                        }, 500)
                    }
                }
            });
        }
    </script>

    <script language="JavaScript" type="text/javascript">
        function checkArticle(id){
            var url = "${context.contextPath}/admin/article/check/" + id;
            $.ajax({
                url: url,
                type: "POST",
                success: function (data) {
                    if (data == 1) {
                        $("#success").show(500);
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000)
                    } else {
                        $("#fail").show(500);
                        setTimeout(function () {
                            $("#fail").show(500);
                        }, 500)
                    }
                }
            });
        }
    </script>

    <script language="JavaScript" type="text/javascript">
        function setTop(id){
            var url = "${context.contextPath}/admin/article/top/" + id;
            $.ajax({
                url: url,
                type: "POST",
                success: function (data) {
                    if (data == 1) {
                        $("#success").show(500);
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000)
                    } else {
                        $("#fail").show(500);
                        setTimeout(function () {
                            $("#fail").show(500);
                        }, 500)
                    }
                }
            });
        }

        function cancelTop(id){
            var url = "${context.contextPath}/admin/article/cancelTop/" + id;
            $.ajax({
                url: url,
                type: "POST",
                success: function (data) {
                    if (data == 1) {
                        $("#success").show(500);
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000)
                    } else {
                        $("#fail").show(500);
                        setTimeout(function () {
                            $("#fail").show(500);
                        }, 500)
                    }
                }
            });
        }
    </script>
</head>
<body>
<!-- Header -->
<div id="header">
    <div class="shell">
        <!-- Logo + Top Nav -->
        <div id="top">
            <h1><a href="#">管理员系统</a></h1>
        </div>
        <!-- End Logo + Top Nav -->

        <!-- Main Nav -->
        <div id="navigation">
            <ul>
                <li><a class="active"><span>帖子管理</span></a></li>
                <li><a href="${context.contextPath}/admin/admin-comment"><span>评论管理</span></a></li>
                <li><a href="${context.contextPath}/admin/admin-user"><span>用户管理</span></a></li>
                <li><a href="${context.contextPath}/admin/add-user"><span>添加用户</span></a></li>
                <li><a href="${context.contextPath}/admin/write"><span>写文章</span></a></li>
            </ul>
        </div>
        <!-- End Main Nav -->
    </div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
    <div class="shell">

        <!-- Message OK -->
        <div class="msg msg-ok" id="success">
            <p><strong>操作成功！</strong></p>
        </div>
        <!-- End Message OK -->

        <!-- Message Error -->
        <div class="msg msg-error" id="fail">
            <p><strong>操作失败！请重试！</strong></p>
        </div>
        <!-- End Message Error -->
        <br />
        <!-- Main -->
        <div id="main">
            <div class="cl">&nbsp;</div>

            <!-- Content -->
            <div id="content">

                <!-- Box -->
                <div class="box">
                    <!-- Box Head -->
                    <div class="box-head">
                        <h2 class="left">帖子列表</h2>
                    </div>
                    <!-- End Box Head -->

                    <!-- Table -->
                    <div class="table">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th width="50">ID</th>
                                <th>标题</th>
                                <th width="40">评论数</th>
                                <th width="80">发帖人</th>
                                <#--<th>警员号</th>-->
                                <th width="40">精品</th>
                                <th width="50">状态</th>
                                <th width="90">创建时间</th>
                                <th width="90">IP</th>
                                <th width="110" class="ac">操作</th>
                            </tr>
                            <#if articles?exists>
                                <#list articles as article>
                                <#assign id = article.id ?c>
                                    <tr>
                                        <td>${id}</td>
                                        <td><h3><a href="${context.contextPath}/admin/article/${id}" target="_Blank"><span style="color: <#if article.titleColor?exists>${article.titleColor}<#else>black</#if>">${article.title}</span></a></h3></td>
                                        <td>${article.commentNum}</td>
                                        <td><#if article.author?exists && article.author != "">
                                        ${article.author} <#else> ${article.nickname}</#if></td>
                                        <#--<td>${article.policeId}</td>-->
                                        <td><#if article.better == 1>是<#else>不是</#if></td>
                                        <td><#if article.flag == 1>未审核<#else>已审核</#if></td>
                                        <td>${(article.createTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
                                        <td><#if article.ip?exists>${article.ip}</#if></td>
                                        <td><a href="javascript:void(0)" class="ico del" onclick="deleteArticle(${id});">删除</a>
                                            <#if article.flag == 1><a href="javascript:void(0)" class="ico edit" onclick="checkArticle(${id});">审核通过</a>
                                            <#else>
                                                <#if article.better == 0><a href="javascript:void(0)" class="ico edit" onclick="betterArticle(${id});">精品</a></#if>
                                                <#if article.top == 0><a href="javascript:void(0)" class="ico edit" onclick="setTop(${id});">置顶</a>
                                                <#else><a href="javascript:void(0)" class="ico edit" onclick="cancelTop(${id});">取消置顶</a></#if>
                                            </#if>
                                            <a href="${context.contextPath}/admin/edit/${id}" class="ico edit";">修改</a>
                                        </td>
                                    </tr>
                                </#list>
                            </#if>
                        </table>

                        <!-- 分页 -->
                        <#if pageInfo ?exists>
                            <div class="pagging">
                                <div class="right">
                                    <a <#if pageInfo.prePage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/home?page=${pageInfo.prePage}</#if>">上一页</a>
                                    <span><strong>${pageInfo.pageCurrent}</strong>/${pageInfo.pages}</span>
                                    <a <#if pageInfo.nextPage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/home?page=${pageInfo.nextPage}</#if>">下一页</a>
                                </div>
                            </div>
                        </#if>
                        <!-- End Pagging -->
                    </div>
                    <!-- Table -->
                </div>
                <!-- End Box -->
            </div>
            <!-- End Content -->
            <div class="cl">&nbsp;</div>
        </div>
        <!-- Main -->
    </div>
</div>
<!-- End Container -->

<!-- Footer -->
<div id="footer">
    <div class="shell">
        <span class="right">&copy; 2017 - 南京市栖霞区公安分局</a>
		</span>
    </div>
</div>
<!-- End Footer -->
</body>
</html>