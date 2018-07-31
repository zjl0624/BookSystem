<%@ Page Language="C#" Inherits="WebFormProject.Test" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发起加班流程</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        body{
            height:100%;
            width:100%;
            background:#EEE;
            font-size:2.5rem;
            /*overflow:hidden;*/
        }
        .wrap{
            height:100%;
            width:100%;
            background:#EEE;
        }
        .head{
            height:8rem;
            line-height:8rem;
            background:#F6F6F6;
            border-bottom:1px solid #BDBDBD;
            font-size:3rem;
        }
        .back{
            float:left;
            margin-top:0.5rem;
            margin-left:1.5rem;
        }
        .title{
            margin-left:40%;
        }
        ul{
            list-style:none;
        }
        .type,.person{
            height:4rem;
            line-height:4rem;
        }
        .type,.content,.time,.person{
            background:#FFF;
            margin-top:2.3rem;
            padding:2.3rem;
        }
        .left{
            float:left;
        }
        .right{
            float:right;
        }
        .color{
            color:#B3B3B3;
        }
        #choose,.arrowinto{
            position:absolute;
            right:2.2rem;
        }
        #choose{
            opacity:0;
            z-index:10;
        }
        .arrowinto{
            z-index:1;
        }
        .content{
            height:25rem;
        }
        #overtime{
            border:none;
            font-size:2.5rem;
        }
        .content1{
            height:4rem;
            line-height:4rem;
            width:100%;
            border-bottom:1px solid #EEEEEE;
        }
        .content1,.content2{
            /*padding-top:0.8rem;*/
            padding-bottom:1rem;
        }
        textarea{
            height:15rem;
            width:57rem;
        }
        .time{
            height:20rem;
        }
        .begintime{
            border-bottom:1px solid #EEEEEE;
            padding-top:1rem;
        }
        .begintime,.endtime{
            height:8rem;
            line-height:8rem;
        }
        .submit{
            background:#FF615D;
            color:white;
            height:8rem;
            line-height:8rem;
            text-align:center;
            margin-top:2.2rem;
            position:fixed;
            bottom:0;
            width:100%;
        }
        #chooseone{
            background:white;
            width:80%;
            height:100%;
            position:absolute;
            left:100%;
            top:0;
            display:none;
            /*-webkit-transform:translate3d(100%,0,0);*/
        }
        .padding{
            padding-left:2rem;
        }
        .list li{
            height:3.5rem;
            line-height:3.5rem;
            background:white;
            border-bottom:1px solid #F4F4F4;
            padding-left:1rem;
        }
        #choose:checked~#chooseone{
            float:right;
            display:block;
            -webkit-transform:translateX(80%);
            -webkit-transform:translateZ(100%);
            -webkit-transition:all 0.3s ease-in-out 0.1s;
            z-index:90;
            background:rgba(0,0,0,.5);
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="head">
        <div class="back"><img src="images/back-checked.png"/></div>
        <div class="title">发起流程</div>
    </div>
    <ul class="mainbody">
        <ul class="type">
            <li class="left">加班类型</li>
            <li class="right color">
                <input type="radio" name="choose" id="choose"/>
                <a href="#chooseone" class="arrowinto"><img src="images/arrow-into.png"/></a>
            </li>
        </ul>
        <ul class="content">
            <li class="content1"><input type="text" value="加班名称" id="overtime"></li>
            <li class="color content2">加班内容</li>
            <li><textarea name="加班内容"></textarea></li>
        </ul>
        <ul class="time">
            <li class="color">加班时间</li>
            <ul class="begintime">
                <li class="left">开始时间</li>
                <li class="right">2017-04-13 15:37</li>
            </ul>
            <ul class="endtime">
                <li class="left">结束时间</li>
                <li class="right">2017-04-13 15:37</li>
            </ul>
        </ul>
        <ul class="person">
            <li class="left">审批人</li>
            <li class="right color"> 创新设计中心 刘刚 <img src="images/arrow-into.png"/></li>
        </ul>
        <ul class="submit">
            <li>提交</li>
        </ul>
    </ul>
</div>
<div id="chooseone">
    <div class="head">
        <div class="left padding">取消</div>
        <div>加班类型</div>
    </div>
    <ul class="list">
        <li>工作日加班</li>
        <li>周末加班</li>
        <li>节假日加班</li>
    </ul>
</div>
</body>
</html>
