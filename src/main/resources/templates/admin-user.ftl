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
        function deleteUser(id){
            var url = "${context.contextPath}/admin/user/delete/" + id;
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
        function checkUser(id){
            var url = "${context.contextPath}/admin/user/check/" + id;
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
                <li><a href="${context.contextPath}/admin/admin-comment"><span>评论管理</span></a></li>
                <li><a class="active"><span>用户管理</span></a></li>
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
                        <h2 class="left">用户列表</h2>
                    </div>
                    <!-- End Box Head -->

                    <!-- Table -->
                    <div class="table">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th width="50">ID</th>
                                <th>昵称</th>
                                <th>姓名</th>
                                <th>年龄</th>
                                <th>性别</th>
                                <th>电话</th>
                                <th>组织名</th>
                                <th>状态</th>
                                <th width="90">注册时间</th>
                                <th width="90">修改时间</th>
                                <th width="110" class="ac">操作</th>
                            </tr>
                        <#if users?exists>
                            <#list users as user>
                                <#assign id = user.id ?c>
                                <tr>
                                    <td>${id}</td>
                                    <td>${user.nickname}</td>
                                    <td><#if user.name ? exists>${user.name}</#if></td>
                                    <td><#if user.age ? exists>${user.age}</#if></td>
                                    <td><#if user.sex ? exists>${user.sex}</#if></td>
                                    <td><#if user.phone ? exists>${user.phone}</#if></td>
                                    <td><#if user.groupName ? exists>${user.groupName}</#if></td>
                                    <td><#if user.flag == 1>未审核<#else>已审核</#if></td>
                                    <td>${(user.createTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
                                    <td>${(user.updateTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
                                    <td><a href="javascript:void(0)" class="ico del" onclick="deleteUser(${id});">删除</a>
                                        <#if user.flag == 1>
                                            <a href="javascript:void(0)" class="ico edit" onclick="checkUser(${id});">审核通过</a>
                                        </#if></td>
                                </tr>
                            </#list>
                        </#if>
                        </table>

                        <!-- 分页 -->
                    <#if pageInfo ?exists>
                        <div class="pagging">
                        <#--<div class="left">显示 ${pageInfo.pageCurrent}/${pageInfo.pages}</div>-->
                            <div class="right">
                                <a <#if pageInfo.prePage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/admin-user?page=${pageInfo.prePage}</#if>">上一页</a>
                                <span><strong>${pageInfo.pageCurrent}</strong>/${pageInfo.pages}</span>
                                <a <#if pageInfo.nextPage == pageInfo.pageCurrent><#else>href="${context.contextPath}/admin/admin-user?page=${pageInfo.nextPage}</#if>">下一页</a>
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