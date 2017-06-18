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
        function deleteComment(id){
            var url = "${context.contextPath}/admin/comment/delete/" + id;
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
        function checkComment(id){
            var url = "${context.contextPath}/admin/comment/check/" + id;
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
            <h1><a >管理员系统</a></h1>
        </div>
        <!-- End Logo + Top Nav -->

        <!-- Main Nav -->
        <div id="navigation">
            <ul>
                <li><a href="${context.contextPath}/admin/home"><span>帖子管理</span></a></li>
                <li><a class="active"><span>评论管理</span></a></li>
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
                        <h2 class="left">评论列表</h2>
                    </div>
                    <!-- End Box Head -->

                    <!-- Table -->
                    <div class="table">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th width="50">ID</th>
                                <th>评论内容</th>
                                <th>类型</th>
                                <th>文章ID</th>
                                <th>昵称</th>
                                <th>状态</th>
                                <th width="90">评论时间</th>
                                <th width="80">IP</th>
                                <th width="110" class="ac">操作</th>
                            </tr>
                        <#if comments?exists>
                            <#list comments as comment>
                                <#assign id = comment.id ?c>
                                <tr>
                                    <td>${id}</td>
                                    <td>${comment.content}</td>
                                    <td><#if comment.type == 1>评论<#else>回复</#if></td>
                                    <td><a href="${context.contextPath}/admin/article/${comment.articleId ?c}" target="_Blank">${comment.articleId ?c}</a></td>
                                    <td>${comment.nickname}</td>
                                    <td><#if comment.flag == 1>未审核<#else>已审核</#if></td>
                                    <td>${(comment.createTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
                                    <td><#if comment.ip?exists>${comment.ip}</#if></td>
                                    <td><a href="javascript:void(0)" class="ico del" onclick="deleteComment(${id});">删除</a>
                                        <#if comment.flag == 1>
                                            <a href="javascript:void(0)" class="ico edit" onclick="checkComment(${id});">审核通过</a>
                                        </#if></td>
                                </tr>
                            </#list>
                        </#if>
                        </table>

                        <!-- 分页 -->
                    <#if pageInfo ?exists>
                        <div class="pagging">
                            <div class="right">
                                <a <#if pageInfo.prePage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/admin-comment?page=${pageInfo.prePage}</#if>">上一页</a>
                                <span><strong>${pageInfo.pageCurrent}</strong>/${pageInfo.pages}</span>
                                <a <#if pageInfo.nextPage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/admin-comment?page=${pageInfo.nextPage}</#if>">下一页</a>
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