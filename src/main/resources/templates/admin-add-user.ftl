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
        function addUser(){
            var url = "${context.contextPath}/admin/user/insert";
            var policeId = $("#policeId").val();
            var nickname = $("#nickname").val();
            var name = $("#name").val();
            var password = $("#password").val();
            var groupName = $("#groupName").val();
            if (policeId == null || policeId == "" || nickname == null || nickname == ""){
                alert("警员ID和昵称不能为空！");
                return;
            }
            var param = {
                'policeId': policeId,
                'nickname': nickname,
                'name': name,
                'password': password,
                'groupName': groupName
            };
            $.ajax({
                url: url,
                type: "POST",
                data: param,
                success: function (data) {
                    if (data == 1) {
                        alert("添加成功！点击确定继续添加！");
                        window.location.reload();
                    } else {
                        alert("添加失败！请检查警员ID是否已经注册过！")
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
                <li><a href="${context.contextPath}/admin/admin-user"><span>用户管理</span></a></li>
                <li><a class="active"><span>添加用户</span></a></li>
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
                        <h2>添加用户</h2>
                    </div>
                    <!-- End Box Head -->
                    <form action="" method="post">

                        <!-- Form -->
                        <div class="form">
                            <p>
                                <label>警员ID<span style="color: red">(必填)</span></label>
                                <input type="text" class="field size1" id="policeId"/>
                            </p>
                            <p>
                                <label>昵称<span style="color: red">(必填)</span></label>
                                <input type="text" class="field size1" id="nickname"/>
                            </p>
                            <p>
                                <label>姓名<span style="color: blue">(选填：如果不填默认和昵称一样)</span></label>
                                <input type="text" class="field size1" id="name"/>
                            </p>
                            <p>
                                <label>密码<span style="color: blue">(选填：如果不填，默认密码为：111111)</span></label>
                                <input type="password" class="field size1" id="password"/>
                            </p>
                            <p>
                                <label>部门名称<span style="color: blue">(选填：如果不填，默认为：栖霞公安分局)</span></label>
                                <input type="text" class="field size1" id="groupName"/>
                            </p>
                        </div>
                        <!-- End Form -->
                        <!-- Form Buttons -->
                        <div class="buttons">
                            <input type="button" class="button" onclick="addUser();" value="提交" />
                        </div>
                        <!-- End Form Buttons -->
                    </form>
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