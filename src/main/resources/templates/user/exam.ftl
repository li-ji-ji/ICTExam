<!-- 配置页面路径  -->
<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
  	<script type="text/javascript" src="${base}/static/js/jquery-3.3.1.js"></script>
</head>
<script type="text/javascript">
	var userMsg=${userMsg}
</script>
<style>
    html,body{
        padding: 0;
        margin: 0 auto;
        width: 100%;
        height: 100%;
        display: flex;
    }
    /* 垂直装饰分割线 */
    .vertical-decorate-line{
        height: 32px;
        width: 2px;
        background-color: #0C4991;
        /* transform: rotate(15deg) */
    }
    .vertical-decorate-line-12px{
        height: 12px;
        width: 2px;
        background-color: #0C4991;
        margin: 0 5px;
        /* transform: rotate(15deg) */
    }
    /* 水平装饰分割线 */
    .horizontal-decorate-line{
        height: 2px;
        width: 90%;
        background-color: rgba(155, 155, 155, 0.29);
        margin: 10px auto;
    }
    /* 装饰分隔点 */
    .decorate-circle{
        height: 7px;
        width: 7px;
        background-color: #0C4991;
        border-radius: 50%;
    }
    .page-box{
        width: 100%;
        height: 100%;
    }
    /*顶部信息栏*/
    .top-msg-bar{
        width: 100%;
        height: 10%;
        min-height:72px;
        background-color: #fff;
        padding: 15px 80px;
        box-shadow: 0 2px 3px 0 rgba(155, 155, 155, 0.29);
        box-sizing: border-box;
        display: flex;
        justify-content: space-between;
    }
    .msg-title-box{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .msg-title-box img{
        width: 48px;
        height: 48px;
    }
    .msg-title-box span{
        padding: 4px;
        font-size: 24px;
        color: #0C4991;
        font-weight: 800;
    }
    .msg-user-box{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .msg-user-box img{
        width: 48px;
        height: 48px;
        border-radius: 50%;
    }
    .msg-user-box span{
        padding: 4px;
        font-size: 18px;
        color: #6c757d;
    }
    .main-content-box{
        width: 100%;
        height: 80%;
        display: flex;
        flex: 1;
        padding: 2px;
        box-sizing: border-box;
    }
    /* 左部信息栏 */
    .left-msg-box{
        display: flex;
        flex-wrap: wrap;
        align-content: flex-start;
        width: 15%;
        height: 100%;
        min-width: 150px;
        box-shadow: 2px 0 3px 0 rgba(155, 155, 155, 0.29);
    }
    /* 左部信息栏-题目列表 */
    .exercises-list-box{
        width: 100%;
        height: 30%;
        min-height:150px;
        display: flex;
        flex-direction:column;
        justify-content: flex-start;
        align-items: flex-start;
        padding: 10px 0 0 0;
        box-sizing: border-box;
        color: #212529;
    }
    .list-item{
        width: 60%;
        height: 30px;
        min-width: 150px;
        border-top-right-radius: 15px;
        border-bottom-right-radius: 15px;
        margin-bottom:5px; 
        display: flex;
        padding: 0 0 0 10%;
        align-items: center;
        box-sizing: border-box;
        position: relative;
    }
    /* .list-item:hover, */
    .listItemHover{
        width: 60%;
        height: 30px;
        min-width: 150px;
        position: relative;
        background-color: #1b75dc;
        border-top-right-radius: 15px;
        border-bottom-right-radius: 15px;
        margin-bottom:5px; 
        color: white;
        display: flex;
        padding: 0 0 0 10%;
        align-items: center;
        box-sizing: border-box;
        font-weight: 900;
    }
    .list-item:hover svg { 
        fill: #ffffff; 
    }
    .listItemOrder{
        width: 20px;
        height: 20px;
        border: 2px solid #fff;
        border-radius: 50%;
        position: absolute;
        right: 2%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 12px;
    }
    /* 左部信息栏-排名情况 */
    .esercises-rank{
    	overflow-y:auto;
        width: 100%;
        height: 65%;
        display: flex;
        flex-direction: column;
        padding:5px 20px;
        justify-content: flex-start;
        align-items: flex-start;
        box-sizing: border-box;
    }
    .esercises-rank-item{
    	width:90%;
    	position:relative;
        padding:5px;
        margin-top:5px;
        background-color:#f7f7f7;
        border-radius: 10px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-size: 16px;
        box-sizing: border-box;
    }
    .esercises-rank-item-order{
        width: 20px;
        height: 20px;
        border: 2px solid #1B75DC;
        border-radius: 50%;
        display: flex;
        margin:0 5px;
        justify-content: center;
        align-items: center;
        font-size: 12px;
    }
    /* 右部答题界面 */
    .right-exercises-box{
    	overflow-y:auto;
        display: flex;
        width:85%;
        height: 100%;
        flex: 1;
        flex-direction:column;
        padding: 10px 20px;
        
    }
    .exer-content{
    	width: 100%;
    	max-height:30%;
    	overflow:scroll;
    	overflow-x:hidden;
    	font-size: 18px;
        white-space:normal;
        word-break:break-all;
        padding:15px;
        background-color:#f7f7f7;
        box-sizing: border-box;
        border-radius:5px;
    }
    .exer-img-box{
    	display: flex;
        background-color:#f7f7f7;
        border-radius:5px;
        box-sizing: border-box;
    	padding: 5px 15px;
    	justify-content: flex-start;
    	align-content: center;
    	flex-wrap: wrap;
    }
    .exer-img-item{
    	width: 15%;
    	height: auto;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	padding: 5px;
    	box-sizing: border-box;
    	margin: 0 10px 10px 0;
    	border:1px solid #c5c5c5;
    	border-radius: 5px;
    }
    .exer-img{
    	width: 100%;
    	height: auto;
    }
    .exer-option-item{
    	font-size: 18px;
    	margin:10px 0 0 0 ;
    	padding:5px 15px;
    	box-sizing:border-box;
        background-color:#f7f7f7;
        border-radius:5px;
    }
    .answer-option-item{
    	display:inline-block;
    	margin:10px 5px 0 5px;
    	font-size: 18px;
    	padding:5px 15px;
    	box-sizing:border-box;
        background-color:#f7f7f7;
    	border-radius: 5px;
    }
    .answer-input{
    	width:70%;
    	height:30px;
    	padding:5px 15px;
    	box-sizing:border-box;
    	border-radius:5px;
    	margin:10px 0;
    	border:1px solid #8DB7FB;
        background-color:#f7f7f7;
    }
    .answer-input:focus{outline:none;}
    .submit-btn{
    	background-color: #8DB7FB;
    	border-radius: 15px;
    	width: 80px;
    }
    /* 底部遮罩栏 */
    .footer-decorate-bar{
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 10%;
    	min-height: 54px;
        background-color: #fff;
        box-shadow: 0 -2px 3px 0 rgba(155, 155, 155, 0.29);
    }
</style>
<body>
    <!-- 页面容器 -->
    <div class="page-box" id="page-box">
        <!-- 顶部信息栏 -->
        <div class="top-msg-bar">
            <div class="msg-title-box"><!--  style="display:none;" -->
                <img src="data:img/jpg;base64,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" alt="">
                <span>ICT测试平台</span>
                <div class="vertical-decorate-line"></div>
                <span>By</span>
                <div class="decorate-circle"></div>
                <span>IT实训部</span>
            </div>
            <div class="msg-user-box">
                <img src="data:img/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAIQAABtbnRyUkdC
IFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAA
AADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlk
ZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAA
AChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAA
AAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAA
AAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3Bh
cmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADT
LW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAw
ADEANv/bAEMABgQFBgUEBgYFBgcHBggKEAoKCQkKFA4PDBAXFBgYFxQWFhodJR8aGyMcFhYgLCAj
JicpKikZHy0wLSgwJSgpKP/bAEMBBwcHCggKEwoKEygaFhooKCgoKCgoKCgoKCgoKCgoKCgoKCgo
KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKP/AABEIBHEEOAMBIgACEQEDEQH/xAAcAAACAwEB
AQEAAAAAAAAAAAACAwABBAUGBwj/xAA5EAACAQQBBAEEAQMCBgICAgMAAQIDESExBAUSQWFRBhMi
cYEUMpEjoRVCUrHB0RYkBzPwFzRi4f/EABkBAQEBAQEBAAAAAAAAAAAAAAABAgMEBf/EAB8RAQEB
AAMBAQEBAQEAAAAAAAABEQIhMUESAxMEYf/aAAwDAQACEQMRAD8A+R2JYlyrgBUaSM7lkZUd7iPI
gMgu5aAtFNlSeAO72ENTCTFxYaCeC8AMjeCvAaTwCmWyBETDSyLjsdDRpItLBTDB9BpSQ2FrARCW
jIZ4F3z8hKQBYzQ1XgzSlsfN7M8zQVN5KTKlspGmPTqY+C9CKSNMEZ0zDKaDSsVEJEbglsOOwIjI
ma68fGmmsfwVUVkSm8Fz0GvKTs18WGjNBXfo6PGhaKMtTDor/ISwWoltYCfU8Gbkf26NPoCvH/Tw
xEcl7ZdPaKr4bC4sXKSFVspLBoiLhEYgq0y4XKQcEQh1JGykrJGSijZANfDYlvQK0Wn8hC5sUxlW
SinZmKddXauZDrXNXCg+79GKlO/s6vDWFg0sbKMLM2QjgRSWdGmAUcYjY4QMUH4OYCo8GCo8s2Vd
GKe2Q+qQquvxY+Jm5MrJgcyu8i4ZLrv8gIPJQ6KyMSFxGLR0Quojm8pYZ0qmjByfIZrz/KX5MzeT
Zyf7mZXsvjFiwotoVcZErLRF3sMihMXZB3x7Ki4R/wBRG6EcI59G7qI6tNYX6M1YuCLloZGJUlgn
oQUgpRsA73Q8KY1+LOPzcSZ11L8X+jlcyLcm/ZVjHFZNNHJlb7X+jRQkrBprXgOG0BDI2EcoK28d
3NMfBko4RrjohDL4JcC/sIzrZsNo30PBzoN3Xk3UJaNJ66VD9HS4+kcqgzqcZ4RzpGnwTwQojRMz
JyI7Ns0Z6kbxYHJrxvF4OVyIbO3Xhs5nIjso5NSnvBgr8dZdsHWqRwzJUeGaYsef5NDeDlVYWkzv
8zT8HErvLOnH1y5RktYkQmVb4N1zxdyJ6Ks/ktLJmehiY2DEhwZWmmDGrJngx6IyOIxaFxRd8BVT
8mWp5NMhM4hWawcCNFxCfTAWECwpcnZMU5DZLDENbDF9RsotLBfgHqAXDAsDwMs3F2G+gVECoDoq
4MUMjoMwPklg2gWg0Bl+CSKia+BkNEKhtEA61yNgvDAkzONBmxL2G2AIWqtoJRwReA+5JMamkyQP
bkuci4u5VXFB68FLYZAtslypoBsoK5ZAHogKOx8RFPY+JVFYshX/ALAtWKvYsXcIJyAcsEYE9MT0
VKd75FOVyl5KbNRFOJErBRd2GoXRr1jxVKN2a4QwBRjZmmKRmxqdqSsWX5LRm1uYkfA2AuKHR0Y3
XSQcMB9yAQLvf+RGsaqUFI2UlaK9GfjRskbYLCFMxL4Bcg2hbiVRJi60/wAWE8Iy8idlsk7qMfId
xnFdrGWo03sfx36KnbpQZHNXEueNgr8vJG2qMrjqbEQVkjRRREjRSjk0wWBdEcsGVW3ZCpysFNme
q8AZuTVtfJy51n3Yua+QnK5mhSbfkz6rZ0+q3NL5Z6jix/BHnumca80/CPT8eFoIo000h8EKpLRp
pomtQSRfguJYa9Z62jJLZsr/ANpie2RjE0jDy2bW7ReDm8qWWF7YKv8AcVTWQ55KprJqMnR0H4BS
CsVC6hzeW8P5OjW/tZyuV5NwtcbktqTM3d8mnl7ZhvnRXLdNbLi2BF3HQWsBPRq4yF2y4Ruh8IJF
Pq6MLNM19+BMUEkZ9NaFPAyOUIgmbKUfwyMGeVsipa2aK0d2MzMUWsqxl5EEk2aYLKFcz+0s7I4l
Zfl8BUn7KrbFwbuzTbp0ZWa8muDVkc/i5Subo+ArVSlk1Qd0jHTWEaqfgE9MRP4KRCNaZHwaqDM0
fBpomVdHjHU4su1I5PHZ0qD0ZpjoLKIVTeA2RewSESRotcVKIPWDkRVmcyvFZOxXjg5lWN2yjlVY
7MdSFjqVoZMVeOGWM15zqkbN2OJWi95PVcyh3xeMnE5NHtTxo3x6c+TjvyD4DqxtJino6OV6EpFq
QK0RMms9iTYcJiX5sD3MurrdTlnZpgzmUpu5tpSyjO06bFoplx0SeitF3KbRNlSiAqawykg5RBAI
Ej9FAC9MS1dsdJYFqOS/GbO0UMFSjgdFFVNMiWYzfsl7lv2VcM91TVykgvAQALeC0/kpgsNHd2gb
i0/YQFvJSRayWhrK4+CBRIXWnTeRUy+9AOVwoGA2ExbJSr7rAymLmwVe5AbyHBFRLRSGBrQtMvuw
PGkk7CwmUEUi45JYtIKuOA1IDPyRModFhf8AsXANFRb2wHoO2AGtgAipFvAEtAJva4qch01a5mlF
tlQyjK7NtKxhpqzNNN5SNeMe1sghkdAUVgPRi1rjEuGtC4u7DTsZrYw4C1kbDRG4NLAUI3miQV7G
ijTvIjetNOP4odBY/YMP0MdgovADwRP0VJhS6srI5vLqeDdW0civK9S3geBWZM28eOBNOKxg1044
AqVw6Owuy42lTMDRFfihlPFgYrQcVlGiNdBjnhCKSsOk1Yythc5CJ5GSYBkkJlTuSND4Q9a9jqMb
vIakM4EO22PJ2aa1gw8SP5I6kY6CG0kPj6ApRwMRF8FEJ6KiVJ4Ya+MtbzsQPq+RCQCqi2cnlu0n
k7FXCZ5/qcmm2gwDuuNhswUKl3k20s2NfA+OwtIGIb0VMKq6OXytM6lV/icrlaYZscfl+TB5NfMm
u5oxJ5Ns4bDA+noTCJopxwVnw6maIPBmgx8HjBU7NixkVnQulFjJfiD4asNWNlL+wwUpdzNcG+30
ZTUqGeovIyoxLkRQOVhXJd4BTkZuRU/BoeE6c2rvYFNZLqPJUHkrfTdx/Bvgr2Odx27o6VHQxNw6
l4NMNoRCJph4Fahi/RVi4l2MNLgaaP7Ewjb2Pp2NK2cfZ0KHg51HaN9F4Rzvo6VPXyN8CaGh9sEF
eBbyG0DYDNyFdM51SOzp1lZMw1I5fgK5teO8GKtHB06sdmKrEo5VWOGcbnQ2egrxwzjc6NrezpHP
lHmuRH8ni1jK/J1eZSy2cySz6Nxy5eBReCmwbhz8R6ZRGCGb6Ons10pfkjBk00ZPuQI7NHMUVPTF
0Kn4pByynkOhb0SJbWNk8BVSV0KasE5FWv5AF6AdxvbgBxCdlvQcf0RRQcUkFT/YpxumEXHAZrHV
ja4qPk11I91zPONgz+UAkyypIL4G5GyIp5uBSYVwUi/IBp4LTBvgu+ACjtEBUskA2lrRZSCqfgVM
bIRNlSgb2WilsZCOCC1stk0QLPVELsUkGhRLsUsF3KIiIKKCsrEAX+SlkqWyo7Kh1PQyIunobexY
iASaI5C5P2FDNi5SCkJbAkmAhgKVmRkUEOpRyhUDTS8HQjZTjaAuYTniyA2jF6WJEYgIjFs51uCp
rJogr2wKoxvo0wi1a41qS6bRp5yaYRUWvkCloZcOmGxCbwLT9BpXIqmDIJbyR6KEVdHMnT7ptnR5
MrK3yZYK/gSaBpUzVGNkrFQQyMQKjE0Uo2QMEOijC+LjsbD+4XGORsI7NB8NFNkWEDJmWulMDyRs
iJieVEauOjKtr9m3ixvYLrfw1k6dNaMXFhbwb6SI0fTWwlsqCsEjJUYuYb0BMozz8i1gOpsBhWfk
P8WcDnPubWzt8uX4s4tX+5hGWjT8m2krWFQwOpvJYwataIwkVI6BFX+05nMf4s6VZ2izj86eLGU6
cPmP8nkzwG8p5YmDybjHLG6l/aOghdBXiPjE0xoRtLYqasFRlkNR0aSwga2iUZEnn+CM2Jx9m2Gk
ZqUbGiJGcLqCZofIVNX8EaxjqO1zDyJXubeSvxdnk51RPNwlZpbCplSWxkI6KTppoK7R1aUbJGDi
Ryjp01dLBVHCw6DTZllLtYVKpd+zNb4t0fAyKF0soakcnS+DjpDIgJDImkaKXg30Xg59LwbaHgg6
3G/tRoMnGeEabkoqRRCP0AmrG6ZjqRwze47MlaOwrBOOzJVhvBvqIy1Vko5deOGcfm0nJfNmd+rH
DOdyILteDUYrzPLjtWOPXjl2O9zI/k7HHrx2b1y5RhkB/AdRZBNOdRFMteAZGnK+jikMhZNC46Dj
tGWnQ4+fJqWjLx9D07sNxbBlou5U1gNEvYUdANFxxbyAwFotZL7TNUtqzIE0VY0eKjkJK6BWBkQg
O3BnrRN3aZq8cMmjKCtEeGRF9ZqWAfkaLl5CIC//AATwRgD4LvgF4JceMri9EJHZA06Sdy0JUrfo
OMkxra5CZIc/TFtFZsLSyNixYyGvkiZ2uxFENZLsFwtqxWg5iZMKPuRcWJiwotl8T60RLYEWFcNA
kVFBNFr2UWsF938EB8BnEuC2RsC4VUngC1y2V3DBP4JGOSr5HUkIiQhkfCNiJYCisDbFESxfwUsE
1IKKGRWgY7/Y2BnHSH0EaoLusKoLGjVSM5jcHGOEGoqxFsOI1Z2kYh2JbBZloCRJ6DEVqlotfJrT
GOs++pvCDpwF003K5qhGxdMVGIT2R4eyk7jQymh8BUEMWzCw6KwGlj9gQGXGi16Bki0ENUmxdrFs
vwS0Co3sdLgxzlZMNLwjqcSIi46NFKxrprBkpK2DXTWCNQ4iKCWiCmJmNk8CnoBD2Lm8Ma/Impph
lg5Tw8nJqL8mdXkeTnVY5N/C3CUmPo7FxHU4mUOjoqS2FFEawWIxV8I4vO8na5mjhcuWWWM1x6+W
xUFkfXjcTBWZuMX10ON/av0aYmfjLBpho0z4CosCYy7WaJmKrthddXiyUzXKByOmt/cyzuSt2ozQ
uEe0ZEGGS5S7UY7QNRWYmQ6Uu4TI18dGarC9/g5/Ija515f2s5XMllmajA9jYyukKbvculs0Y6PF
ejp0dI5NGVrHSoTukVkVQlDDC7HJ+hkKdmSt8Wyg8IfHQmlHCHLFzk2K4yAqwyBfRph4NdF68GGm
8myk7WA63G0jQjFxZaNhBeCiFXJ4smo/ZnqK6fsfL9Cp5TLpjFVijHVSyb6q3gyVFsIwVVs5/Kjh
/o6lWOzDyYXRqK8xzY7t4OPXje56Lm0st2OJXhZs6Rx5eOPVjli+018iNnexm8mnH1SRTXssqQ1i
rTGwyxIyk7MLMrfRi0kPjYTRleNhyjgNRP8AcpyuRrADDS36BXkhAG0o3QfbsqkG1gDPU2LbGzWQ
GkZi9gQ2AKQcVk0zpgqtlGinG9iuRS/F2Iz+nIqf3MG4dWP5MBIp6psF6YUo7BXkCeCkFbANsl+i
mVYNINL0RkuMSDEskDRrJEtQdy7WDXS4vBbBQSyX4qJZ0GkSK9hxRESKIwksfoF4ChkKkhk5C28l
jMLQcUV5+Q1gJ9HHSDFpl3DQwUD3F9xcBglXKvgAXsB6CbyCwgbi5PITZXb3ADB3kbaKwhNCkr3N
cY2QEeCkwrFJZJSImEilbJaI0KDNEPBnhG7Rppw1kNSNNF4NEW17E0o2NMIX8ma6Q6ld2HRiBTja
w9HOLAkIyI20F4Rg5FTOzdV0zl1v7l5QNO4qvk0yxYHiwtTTtsOYCZSzrBdN3fsXPDGUVoVGiI2K
yDBDYoLBx0FYqJaMC0REjoOCCxFHAmV0zZFYMteXa9AHx1eR2eLHCwcvhxvZ/J2aCSsRv41Qj/ua
YLAmmtGiK0TQXkhP4Kf6IKmJmMkxcssMF2uLqr8WOasZa9SyaRW2DkPZiln9mqq+65mcTUYpajkf
FaBig4ioOJJaZcWVLTLMHO5kkovJ57lyvN5Ox1BvOTgciV5O5pikT8ivP8lzf5bItosTG3jXt6NP
gz8fRoWtmlTaM9WOzSKq6eDLBfCl210ej7e6gn5seZ4j/wDsJez1lJf/AFcgZKT3fwXKN0Lv+T/Y
7tdrmEKa7RLlm1hlRO4jtd9mm+xVMQOHzJNyZ3ZL8H+jg87E2OlZ0SLsyRWAfIRqhPJ1eFlfJx6R
1+DorLp09LAzFwKeg3sldOPp1N4QyPkRCWh0Xg5Y0JZGw2KixtPNh3A+ntGin4E04PA+OLZA38ba
Ny0c7jSyjoQd0BbLKeS7Ga0qwEkMWAZLBYjJUjsyVI7OhU0ZKi2Uc+pHZirRbTOnKne5jrw3gsHC
5kG0/k4HJpu7wep5MNnI5dFK+DpHPk8zyoWRzpuzO1zUsq2jlzp3ZpwzC7lSLcbfwDbBXPl0jyWm
C0WtZKka+PUs0dKlKLicSm3fB0ePN2sRua0T8ghMCTDYWSxGyJg8Oo+DS1+JmptGjuugM84iW7M1
SiKnC4ALIS2TtsDexC+NVKSwHU/KLM9J6NMY9xntycvk0+290Y1KzOzy6LcWzi1l2SZqNfFyAeik
2EtaKKj5C/8AYK8l2uBcUWUtFgRkK8EA3MW/Ixi5eQ0WGgVtBIqmRCjvYhSDjIjMab4YmbySLuFC
Nw0S7lMfONkJaKBIl7Kt8FoCfyWmSxDWWoiZfkpEeGPiIXfDKWir5IqPYEgmwGEwNy4AvYVIJjRS
2a4ZSwZqa+B6dkNWQVhc9FuQN7kaAmOpi0s6wMiiJOjYYsaqW0Zommk9Ga6zG2ksD4LKEUNmuEcE
rpDaax6GaBggzmoPkngnyC9GgmvPFjH9tzaHVrua+B1GHrRpPD6MUqaXwKqL+B8VgTXRJ6MVXayO
4/gy1r96+DZxo4X6LfBqgMiBFDIYMAiImgkskUUEOisICC0OSwFVLBjrQ75I2TFRjeS/ZaNnBpWg
sZR0qUcr0Z+LHCN1JawZrpGijEelYCmsDfHogrFwZBi5lQmbyUi5bKRGAVXZYObyJZeTXyZ2uc6r
K7ZWyZbAewwWisUMdjIxAQyJUimiP+1h9uCpK0WRXE6ntnAqrLPQ9QXdexwuRG18GmKxSX5FpXaJ
J5VthQejUc/Gmku1DU/8CYPAxFaNT0DNdywV8FN7DJfDj/8AZ/k9bGNuOl6PMcVf6qZ6SjPuppeg
ERo/lc0Rp/hotYHxt9t/JixquVVVmxK8jeZL8nbRljK5pfh0o90HY891JdtWx6SH/wCtnA6qv9UM
3xlprAE1ZhQdipSuGR0tnY4Oji0pZR1uDUV0vkq/HXp6QctgUv7UFP8A8BueigxyZni9DomGzImn
j7WDNA1UNozVbo6RGSOkTwRGji7R1KX9pyuM7SR1KT/FAH5ZLleSwq0VLRa8EeQM9RYM84/7mue/
0Z6iAz9pjrrLwbp6Ziqlg5nKjh4PPdSrWi1b0eo5ELp42eY6vxpOEnE058nmuRU75sRJYHTg1Ji6
sfxZuOVZX5Fy2G9gyR0+ONgXoFvAT0VbYJ6uDNnHmYkjRSdrDpuOnB9yAntgUamLBSlcx43JqLRT
BuX4yTSwyDwaaWjJFjIVLMI0y2A/JO65JIBUwUr/AMhyjuxUVY0nwdNZN1C3aYE/Zq48vZlk2srx
aOBzqfbNnoKmYnM5lPuTKrkRWAyTj2sHwVMWggES6DIyFAJsHorkLIGmtyBJ3Il18BdVYsndgBsa
0IuIC9hIBsWh0DNB5Hx0BczPJD5CpFAWIlkJIsAUV7KZZ0c7UWyIBPPyXgz60tlMp7KT8ETcWwJB
soNF9o7jrwDg0caOdANhGxbasVN5AfggtLJaj7JDQzHwRIkYBKOUXEKKyG8HBaNFON2hMEa6MdGa
6cY00I2NcNGekjRAw6Q6JHouKwDIi+BBmypOyEOorsM6TVb+5vFzbx3+BiX5TX7N1JdqNmGLAFXK
/RbaSFSl4Mw8IlS7pJ/Bopx7UkSAatgBkXgKNwY6DiRPol7DgChlND61DKQ16FwjoY1ZEaLnHu8h
0Yfkils28ammlgGNXHhhG2lDQqlA1042J42NLCGeCorRfyADdgJSVgpoWwhbyypYRZVXEL+iMuby
6tmzKn3FcyV5vNsgUmWGCaBsMAZUBYZBAjIoqQaWBVaVkxj0ZqumXxe3O5KvfFzic1ZZ3q/9rW2c
PnYbDHbmSjlhQeiT8kgajP09NYyOgjOmaaOfBQajgGUUOccewHEAaH4zR3uNL8F+jhQ/uXjJ1+NL
CVyerjXKVynUaTRLexdRAxkrfk2ISsx9VbErZkvTRF/6bOD1TNQ7U3an+zhc5tt3+WaZvbKB8hgS
DK43udHgtqSMFPZv4njBNxt3qDwg5ZZn4z/Ffo0F1Z6qKHR0BHwH4M1rehxkaaEsoxpjqD/Iy166
8P7UEBQzFBkB0sSOnRl+KOZBG6i/xQwaPISAi72DXgzT0S8EZaKY9ATQmayaJCZmhmnHBkqx2bpK
6EVI7A51WODk86neMk1dNM7NVWTOdyIqSlf9FnTHLx4nm8ftqu2jDUp4aZ6Ln00pM5HIjZuywdJX
G9uPOnZi5I211gySN652FSKLZYAobB4AJDyGWynKw1SujNB4Gmb26S9DS+CpPDFKTu/gNZQxq0ym
9DYwd7iYbRrpSwVFxwG7E8lMCpMB+S5geSgLtM08eermWoi6U7NGR1ou6EV6fcnjAdCV4bDeVYrn
a4XLp2bxoyo7HOo/i2jkSi4k9XQlMMFL2aA/yTyFYuwPEsQtEA0gNhgMLieSmWkS3yGlRDthApDL
XsE6VDZojoTFZQxSsFExb2E5IBsCAsu5VsBA+QZ4uGC0aQjufdodHTB7MhaQFA+UW2D5CUxFFJ2R
EwvxaWTVRwjNDDNEJK2go5Mq6sC5gqRENig7MCDwGtggot4GwAghkFlXM11kaqUMGmlG1gKK/FGm
ntHOuvHo2nEfCOQaUTRGI8VFqwMkHr9gVHjZPS9svIwmc6Un3PJs5Mv9zGleX8kSH8VXkb448CON
T7Vce5WNdqGbwKJOfgkFdmkMprAwGOC0AaYSYuIxIBkPA+AmMdZH00YWGwJPIUVgq1yKuETfxlZI
yQVzbx44Qb8bqJrpmajGxph4yZ9Dgb4IgWWKGYthz0KuGFSMvJq2g0ap/wBrOdyk2mGnK5E7yCog
1KbvkbSgPGB/BQfbgW1YoryHEAOBUFLTM9TTHTlZGSrUSTuza/GGvLZxua7tnR5E1nJy+TLZllz5
X7vQcQXvAcUajH0Udo6HGirHOVro6fE/tKG2BlHI26EykFhfa+5HQ4uGr/Bz08rybuPLKIvrorAM
soid0U3sHbPVjdGd2izVUatkwciovDHqm1JLsX6OLy8t/s2fdvdN4MvJjfWQzWO2NC3sa0LeA5m0
f8m/jb1owUGjbRmg6OrQf4miLwZKErxNMXhAhyZaYCkXcy0OLG0f7kKjkbRWSK7HFa7UNYjjf2o0
MionlGinPBnSDitEX43U56HxkYqTNEWEPTJcBPBE8IgJP+RdQYKlewC2ImPejNWeCs31i5Gn+znc
n+1m+uc/kYi7lSuFzFds5PJSuzrczMmcrkbLuM5HK5OHYxy0b+XHDZz35OkceU7LZT0XLZRpmqvg
uMgWSEQw1U3hDk8GeGPI1MOnEPkZHQFsjIoNCvk1cbKZmjBs2caLRA3wC9jlECUfRQpgWHKDfgjp
MzQiSuhUY5NElZgqGblGjju0UaFkzU1ZGmn4IxfS+Qr02cTkr8md6tH8GcTlRtJiMsqwWQhpdxHk
nxYhWbBfREBSIBqKLIG1RCS9EishpeglDYuwVsFBURCkyN4Aq4EmERxCKp5Dl+i4LtKk7oKXchYD
waRGU2VJgphm9JYiREw47DPqgQvOPkiDXaR2MiClkOIVaCS0VEKPgUg4oNYRIr0H2My3FQbNFL+5
CIRszRBPuXgzXWOjRSsaKS0Y6TeDdx03Y51tsoxHWsgaMbIb4ARIRVlYfWfajn1p4IjPXqJsnHj3
S0Ll+Uvk28WnaJYeNCtGJnqSyPmzPLbKe0EcyNFMVDY2IoaVIiIlc0vYoDUtC4jY5QMWnlGuijJC
DbNtKJj1BvRSi7hWChHKI1B0YnQoR0ZaMcm6jpEbaqaHR0Kp6Hw0QWsEZaWAJOxVJmxbYUnkTKQY
XOWGYq7TG1JYMlSWQ0VOKuFFKwDYyOwyJoTLyaJLBnltgpb2WmC9kRWVVXhnN5Et5N1Z4ZzOU9mu
ysFWeXk5/JnvJpryyzn1XeTDIVkbayQNKN2OcTUGd/3I6nCf4nOlTd0zdwsRKmNMhEvI7yBKOwpU
dnQ4kbmFKx0uGsIitcdFMt6wCwrNX/tZy6jd2derG6fwcvkxUXjRlGNyzoJPuWUW4r+SrYCelV6V
sx0zJNWOg9ZyYqu2ac7C4s1UmrozRQ6mrNDGnZ4mVu5rXg5/DqeDXKWVYLGiNrDBUNINGW54OHg1
UNoyx3g1UCH10+M8Gl+DNQWDRElXtb8DAbFoiQdN5NUTJF2Hwmgp6LQtVETvQDhcmC542JqVLXAK
cjLWngqdb5MlWp7waiVVeWGc7ky/Fja9bDMFWsmmvJUc3lv8mcyvt/o3cuplnOryGJ0y1VdW+Ucz
kQcL/B0pO7M/JipRNxx5+uVKeSRdxfITU2FTTSRpzwx+BkLeQCKVgzh0Q0xUZYDiw3DU0MiJiMQa
PhKxs47uc3us9mvh1rO3yB1YU7oqVF/A2hNW/YyZDGeFFeSVIq2hyAloqVzauJFReEO5EHe4hYMu
ZkXk10lexhUrM2UJ3sD0907xdzk9SoYukdr/AJWc7nO6eCtOBJWeSwqv9zFJ6KLWggG2VcMmxIVB
kDTT2lqIzBQbxSQyOgFsMRcVspqxfksM+FMoN6AbCqCTBJ+gCuU2URCCWAkhq/QLNIS9ghyBRGap
XCTLB/8ARWU+chxAWi07eA2bgtbFpjENBw0MiBAZFE9IdT9bGfAqmaKUbkdIkKd2jVCCRdKKS1kf
Tp3M10i6cUbePHKF0qdvBspQt4ObZ0MIkpEQE3YdDPyJXOfVV7myrLZkbuwWgoxz7N0FaP6EU4/A
3utEeIGpMT/2Lqu4KKhtJGiMWJpRNUbWNKU3YuEvAFR28i4O8lZhNboK4+EMaA40MZNcI2ZjxVUq
aXg0JW8AxQbwhV1QykriVl/BppQ0RTqSsbKSM9GOdGynHRK2dTWEOggIR0OiiC0sC6uENbM9aVkP
DxkqSM85h1ZGScslZXOWNiJZI5NshIKjG42KJTiWymo3gTPDYxvAiowmlyeSu4GbywGzYGtLByuU
73sbq8tnOrvdwVz63kwzauzozs7mOvTWzTKqTXgcZqWGaVoeJ4g/jaM8h1BgPuU/JW2RoKDydPhy
wjmNfBt4TsjKR0CPQN8IJPBpWetJRTvo5HKqqUsO50eof2M4c73ZkNjK5Ymk8jf0aAylb9GOq027
ZNFVfi/BjeHYM02lG7RrhTuxHGt3LB0IRwVF0qdvNjXBaEwNEWrEaMUrIJVPQq9/2RMK0QqXfwbO
PLKOXG9zo8TNjC9utQeB6lhGajr+Bt7EoepBJiISyOiyNdCW95CU7Cr5Kcieob9ywTqXMspr5K+7
7KNMq1lsy1a9/ImrU3kyVars8hm2tFStgyVq3sTKqZK1beQaKvW3kwTq5edlVqu8mecr+TcS9kcq
pdqxiqSNE8szTjk2hTbt6EVag+o7RZgqyfyVz5EV4qU2/kHSDkA1/uN1yurIDYnooKIyDFINBloi
wr4ExbDi9BuDLpS7ZoG91ouOGg07nGqXSybr3ijjcCfdK1zrxWEZNxGwJBsoazSase5aM0qVjbYr
twNRzpU2htCVrGidNNC4wsyes+NUZXiYuZG6ZqhhCOTqX6Ka4FZfkxRo5P8AczOI18W/INgvBCi4
YIWQo1dxE9A2ZcfAdDEWVGWNFXM+Cy7gpkuaRHoWwrlACkH4KtglgIQliAQGRdwJMrIJsqJTLiWJ
RgsIAM/RLRTZaYLeR23BRYcBcRkHoi4fBaHRExZopq5FgoI20I6EU4mqktGa3OjorOjVQiJpwbNl
CNsGK6w+lE0JC4LWBukZ9aqCazw/QcpWM9WV7hGWozOv7h1UT/zFK0U2XMXCaRJVDfTPipA01mxd
y6ccgaYq0fZJVVBO4ObGHqEn2/iwQdaspP8AF3NHDg5STMHTqbqL80738ne4lNRtgK1U49qWByRE
lgOObAHCOC5W8lx0KqSyZqqi7SNlCWEYY3bN1BYRkjbSWTXDRlpGmmStfD6SHoVSQ1BqLejm8upZ
POjdWl2wZxOZVu2DSp1fYmUhblcHuDJieQ4rQuHgfBZJ4eGRVgZBrQEtFQqWnkzVHsfUMtTz5KFt
5Bk8EYtvJ0C6mTBy1Y6EtM5/MjJp2BXOlOzYmpO5KmJNXEyY+OdFHaNFrJCKW1cc9FAsbRE3+Mjq
RFPQdhaGRM0BJD+HL8ti2rovjxarerEhHTCSsVAuZtWfkxUos4vKgo3sdqpLZyOZJNtBe2WlsdER
B/kOTwEVU/teDDVWTXUZmmssM1VCdpo6tGaaONDEjdQngrH10EMixNJ3sNRGxp5GISt3HRMr4ZCO
jdxjHHwa6E1EasdSl4Ck/ZnhWS8lSrr5J611h6lZjYVFjJzp10LjXd9kzGXWc0tMTOta78GF138i
q3I/BpsN/Gmryc4YK5WDjT5DTeQf6rGySMbrq1OUriKvJWTnOvfyDKpdM1itMqyd8mSvU9ipSeRN
STGds31VSWXkHvwDt6L7Ll8UuWRVTQ+acTLWu7o12yzVJbRkmjROLQiRY5UiUSrDJK4LWDTN8BYp
q4TJ4NdOQUGkRRCtheDLa4q9sjIoGKDQWJYvxsva+C1H2Gh8ap9uon48nf41Tvgvk84/xzs6HB5V
rJmc1muuwZaYMKsZ6Zc9MmYoU7hpXM8e5P0Pi2VlGsC5R+MDllh9lwrNmKEch3TNlWn+Jiqaa9BH
H5H9z/kztNM1ciOWJfkrPZbJf2R7KsVtd/ZAe0gG+xVvgJ6BYdFrRT/ZaCsEpZGMBeieIqJcRaeQ
osqDwRWBuS4VGAy2DcAZMG/sqbyBf0ajAwxSYcQJ5C/9gl+SesqYtjGLeytSrj8DYCobRrpU8LBP
GvR0Y6NtGBnpxybKL0vZjW5OjaWzZRgmlgRSp3d0dDj07JEtbkptKHo0RjnVgIYY+KOd7dfIKAUt
ArBG8EQqYia2PaFTRrDWWaEzRplYW44ZPEZXf5JF4DnHOgbGol7HB+jXSji5jp7ybaU122saEkZO
RDuNFWdgI/6gIPhU1FLB1aVlYw0V2pKxrpPCCtcXsbDZnh7NEQDk7GepJXDqzsZfud07GWmuitYu
baZioaRtpGRrpv8A3NNN6uZafg0QeiVvxrg8IbFmemxrkkiKzc2p+LOHyJXk8nS5tVZycmrK7KgF
ogN/4ImVT6f/AGHw9men5HQJWKbfBUrdrKvgCcvxJPWSajtczyYdSWzNOZprFTlsVJlylsU2aF3u
I5Fu0ZKWNmatLDGxL243JzN2ERy/k0cjbxYzx2bZPpxGSWAaKsgqmjCE3yNhPKEMKGwzfWyL0Mj4
FQ8DoCnwaHU7JikHC6ZmLGyDLk8C4PCCfk6NE1XhnF5T/wBRnZqaZxeV/ewE09jomeGGPjozoktM
zTNU16Ms9s0lJW0a6OEZG7M0UpoqN9GRoTuYKctGyErpEXw1DYO1jOpZL+4Yo2xljY2EsezJTlex
pgwp0ZElUstipvGBFSpZbLQ2VW720SNXJgdVthRqZIN6qZ2K5EroUpX8gVamLELWatJ33cXGWclV
JZKisBk2HySUiobsXK1n8j1JS7gvZfbnDK7bPZ0a9RRuG12r5JG1ipt2KpVepGMXgwuXdL/wa5Un
PAEOLLvMMkTp3WvBhq0+39HbfHfa/wBGOtRfwWVyscuwMjTVouLM8lg6MWdAauV2l+gorAYUkEX4
F3DU8MiW0yohxyG0h5Ls/AcY4yX/AMxFk0Ki7ZVyJNPCNMad4ryNp0LokRmp15wa3Y30eWnZSaX7
M9Wn23xkw1aNRy/G6Roelp1KUksq5crf8uUeZpuvTd74OnxObaynn9mB1II00438GalWg0nfJsot
NbDN7Lr0/wAL/JglTu2vR2JpSjbZy+Quybxgpjj8qjZs51SLizt8uS7W7HHryXcE+kkQRDRQ+CF2
IFa2yrsMFL+Q6dpENFJWei0E9QBjMAW/yEwuwSKZa9gQq4dsC5eQinKwPcVLbF3KLkAy5MBljmOO
xkRKGQFbHH2W0yQLYMC16AcXfQ0KMe4hhVODxg6FFfikDSpKw1RsyLOjacB1JZQFHPg10KbvoxfX
SNPHVkjbTWjNTjlGuEdGa6cRKOh8EBDGhsTLWqYHcG/GRU9muhGxNWdkxtzDyZ/lZPBpnQubbDUr
IQpJbI6isZ9IubE92QatQzKp+W/JZMV0KMb5Hq6uI4s8D60kkvZEwmbbG8fwZe/8v5NdLAxWqn4N
NPwZ6bwh8H/k0m1pgO7rRMsZJWBrcjtizFTU5PISeRVOV2mc/kV++WGPozxH0RueO3xn+CNlKRya
VXCszRSr+wOrCevA+Mzkxr+wlykvIxrXbhPAFavaDycn+tstmXk8/wDF5J+TTuZzMteTJGt3nK5H
LTk8g0OVaWxmNO03guEjFCt3LYcahVdGDDUrGOnMb9wietHcBOWNivuAyqbHjOBqsx1J2HVZ42c+
vPGynhrqRfkru2Y4z/LYxTKmmTlgw8ipZMfVnZM51Wd2/gfUpNR3AjH8i3IkZK+jU8ZrTTSKqLGi
UwqiuT09ZnEKEbMOxEDDYvKHQd7GVOxp4+bGjw6ISlknhiJSycyN9OaDbwYqEmzUtbLqlVZWRyOS
vzZ1K/8Abs5tdX9lCEsDIrQKQ2CNJpc7oRUNlZY0c6tKzY+JoWrvQymhMJX8mik18gOho1UXhXM8
c2NNMKYUGCjHobRdkaI1LLZlgHf0QNdRtCarui7gT0y+mkZuWtgp7K7ssvaU+MrAzdyoMjZAqSBv
axcpK4mVSwxIZ3WaClWVvkyzqJqyYMISky9pnbSqq8ASm5K6wRcefs30eIu1dwnTc2OdDub2aYRd
lc2/0S8DI8azWC7p6zU6eVgcqfo3U6KS0E6PohjnSjhmapTi/B06tLeDBUhaTJkjNkc/kcdO+Dl1
6Nk/B6GULxdzl8yna+DUuscuLj2SeS2wqkbSYJ0c8VfAKCAZNPDI6GxERY2BSU+OUTtCpK9g5Rwz
LfZlDKtfJ0ePRbSdjDw43qJHpONTiqSdsjTxzp8deUCuPBu1jqSgrPAjtSloz+mfWGrwYuLstnM5
PCnBtxTZ6ZNWL+3CUXdIqWY8lTqVKaXc2rHS4HUYJ9s5JP2bORw4TvZJHF53T50k5Ru0GnpaVeM0
rNNega1FSueY4XMnRfbK/wDJ2OP1NSjaYGDqK7G14OPNts6/PrQqSfs50oq+EWdoSl5LURij8hdq
+DSYVYg1xRDOockHGICQcUadBdq/yU450GvGQ2lYKzA3GTQp+wniiRZCBB3shM8BqWBc2EBIBoJs
osQDFzv4Gr2WopsoVTTdh8IjKdNWI1ZkqoifsliWG1FouLsyRRfaCNNKqrWGrLMUU7rJtoZtczWp
61ceJ0aEbJY2ZuPBWN9NKxmvRxnQ4LI6O0BTQxIwZ2ZFjYySQhMkp4IQyUgPAp1AXWwGl1aiink5
tSp3SbC5VbL+DG6mysX06VT2InU9gSlgz1ZFwh7rLTZI5aaMUf7l8GumbT63UJdqCqVDN3pLeQHO
72Gmqm9GmM7NGGnUjdLyPjLCInrdTqex8Kvs58JWQf3LLdgre6yXky8jkJ3V7mWc+5bM8nnZnNQS
k3M3UJ3SOcnk0Up2Jix04VLR2WuRZ7McZNrYMpNBp0Y8nDvkF8h/D/yc37jWifeKN0uVi3kzVeQ5
LYlyuhVSVjSaGUryeSQl+SyUrMkYXZzXXUoVV2q7NEKnswUvxQ+nINt9Ofwxn3H8mOnL+BqkRWhT
9gSnjYpSBnL2BdSeDDXkOqTwZJSu2PGNSn/cG9gRLbN/E6iquUYqqumbJ5Rkn5MHTK0SnF3GPehk
LXWDcZNpLGiS0HG1gJs0kLYKLIsmVRGnj6QlRNFFWFDJMTJZHSWfkFRCQfHNXdgzU12jW1Yy1C6u
UYKkdm6o8GSptjwJjH0HFFx0MSwaQmsrxORzE02dioYeTTTyGLK5tKTwaaU7MU4drDpRyaWRvpy0
aYSSsZaf9qGqWAvTWndBmalJ/wADkzPUUyAVwYhjpFXAnphWBk9jpWdb+SmmNSv4Klb4NM9qp3sD
UlbZTn2p+DDXrPOTCepyarin2sTQnKondB0I/d3m50+NwUrOwJO2OlRcvB0OLxXh2NdLj28GylTs
lgmtgp0cLF7DFSt4sPisIYoqxNMZO30HGPo0diuWoZ0WUwmMQ0hqiTtLq9MlWOGYasL+Dq1I4MNS
GWEzWGpGyMXIpqSeLnUqR2ZakLp+BOkscKtxLtszS47j4O1Pti/yM9Xtlq1jesflxZQfc1YpRs7H
S+wk29iqlJX0SVi8WLtz8DqccoqULMOns2zjVThZIGpKzswoP8UZa0n3kax1+m0++aaR3ortilo5
XQo4vY7FXRFwuUlZiGr5Dkm36LUTCFXYcG9BOBO2xQcYY1cCrRjOLUldGillDFRu/QV5XqHTXGXd
TWDFV41WgvzVke6XEjNWauY+rdMlOg5Qj3frwbR4iUrsiK5dKVCo01bICncRDbEZUJXRbyzTN6Tw
QkdECHU0NsUo4CiZ11SxLuwTQL0PQuYmY6YmejR8LeyIq5Ycrqv5AkwnoB7ETbQ+SMnyC3k14sTy
XF2aKWw4xuwp9OWC2BH8UXj4MqqTJDaKkSntAxpgsEcQ6S/EqTWA1i6cc6N/FpXM/Gh3NHW49LtW
iNcYbRp2SNEYoqMcIJYRzrrLIZDCI5AJ5LJsi1blbyA542DJgsenapSYqpUssvKLqSwY6rdmGey6
9S7FAyurkWjU8VNguOQ7Y0VY0A+3p/AyOirFoMLf+wLDQUY+gvwqnF9+zbDCQmMc6GxkkshobkwX
N2Lumhc2AEpP5Dj+Qt2DhUjYjGwyMbBxVtFQkpGmlxpzX4rAXQQlYjdxr41T4QudKcfBnFlBomCr
22DKSyG1ya+TPUd2W55AurmUplNNodBMlFJjlEKuGmMg8i0rIOO0BpgxsZGdPIaZF05yM9RtvYXc
DJ4ZU9InKyYlPLDqik7BfpkZeAr3F2CCXxJWEySyNl8C5Bhlmslw3suoslU/7g18PWgZDUsAyiGZ
NhIUVoF7yHA18UyC9GqnHAinlo2wj+JKzS5RBSHSWBLwyLOk/RL4KTJf0GlTeGY5u7ZrnlMzKOx9
EgMWgILI1IQJqxwYK7wzpVFgw1obNIwSCp7RU4h0kaGmGi28kisFyjYUNhLA6LwZ6Y6Ojmh0XobL
QqntD2sBNChc9DkvQMkrMsIzwfySUopPJKtop5OTyK7u+1m1xor1E1ZGf7Up+Lk4sZVJZO7w+LhN
ox4rN07itWbR2KVOyWCqcezCWh0RfAcUvgZFegIodTRk9RRCsW1ryWkZrqqKDsWkXZiMKRTCSI0a
jFhUlhmSpHZskhEqd0VcrDUjszzp7+DbUVmZ5op3rjc2DuZoQOxU4/3MSRX9DFIus1zVTwBUpejq
rj2TwLnR3g0Y4tSj6BhRzo6k6O8CvtNPRkxnVNJGKurVUdSUHZGGrRlOurIaY7nQ8QR1ZmDptP7c
Io6EjRS3HZIxKcrNIYsmHIDjYBj3EXKJcb/K6L0a4ywZIIfFkZrXSka+5OjNburHPpO7Rpd1B/oq
PBfUlNRrSsvJxKccbPT/AFDBd0nY8y5WbNwpkMDVkTFjIvBXK9jRAVIhMMrfgtL0DTyM9GHfAMG2
A2UbgRMRJja+LmTLNMaLyRlohPEBIBr0MlsEu9IC3oq2Q0S2SpmBjHIa2XBZD7cDxQ3LiTtKdyNI
/QVOOSQQ6ks6CyHUv7bWCjQc2sDqVNWyb+LSWMGLa3J0DhcbtadjpwVkVTj2rAZnW4tFlL2RvBn0
xSwVKWGDKQuUhGkcgXLGAJMkX7OieqnIzyd7+x0xbXwY1cjPUjkWlY0yhh4FyiWM0AKI8Fxjc2qy
WLSCaSRWOoFKwa0gL/7EVzOr0cJnK3kJSK+25iNF/da8g/ebH/0ztouPF9DwkZnUbQCkzoQ4Xf4H
Lpuhq/mMFKq1Y20uqTpfjYbHpvst9Nuwz+S11WpKWIu3yXLmTktbHQ6eohy4tksGdPzjBKo5bVhc
r5+DoS4r+BdSh2xeB614505WQr7vaMrQl3adrg/0znbwTwMocqS8Nr5sbafJVlcyQ4c0mr4FVKNW
FrXsiW6mutCopDIZOAuXUpO0kbePznK2bBXW8+wvBjhyFLyrmiM01sKO4MmEgHsIVUEXH1I3TM8o
sLh1PITQNFYDaC2aBgtehlkV2hjGacSU6ebjXHIynFAXGOESccDoovs9EI57pu+g4QNc4egVEq4l
GnlGxLANGKQ5IifkiUcCJqxta3gRUjsLkZ0QhEBTV0zO8XNXhmWqmrjBUHkcjPTeTSlgsKXUeDHW
eGa55Rjrr0aZrJNei6as1gJolsmg6LwRsCIcY5CaOnEfB2sBAbGJlfBx2h6d0LhEZayJiYjdhM6i
SZK8u1PJza1a91cRpXN5N7qL/Zlo0pVXokouck9nb6bxfwTasXAPA4va1dZOvSj2pIGnTSehtiUX
2hJAxDIng4jYIVD/AAPj4IsHFBKOSQa8htpeQ1oUiwXJW2KqVUlsYadcm0ZY1s7LlyYxQZtaO35K
lFJGGfPXhg/1t1suL+uh8qKuZHsupyO5/IlzuE2aarF3T8CFILuHhab2qwucF/IXdYrbGoTKin4E
Oj8o6CjdC3TGqxfaXwIq0bNdqOp9sr7KuXQHGVopeTb2/gJjTssD1/aS1ms8v7kNjoCUX3DFHBXM
WbFdpa2ElgdqDtKSYxoBqzJqHUHaSNyXctbMFBNyOlSV0i+jh9c4KnSk0s2PB8ii6dWStZXPqHUo
/wCjL9HguoRSrSdvJuJZ05KVmGmXNK5SiacbLqmQu3shTXVpx0SeC4MqezGPWDdg7Y0CkDVqWVix
zpHI2zJY0Tn3exdsGmQg3sE0C1/gC5Cm8hyeGKYiLUg4ZFsZTaS0AcQ4grLDiiiNXfwSMSy1vBE+
Ila2BlLElgqMb2HUqTusEtkb4y1og9HQ4zaSxkz8ehdLB0KVNJaOddpMNi7oNeLlRjYjMNLegGy0
ym7gDsVNMbf0U0a7Gdr0Dew2YPkAQLpDLWbBlEyFNr4FtPI9Uwvsu3g2MTjkOOP8B1o9l7oTJtmk
nqpTUdsU6y0vIboSnpDePwZSkroqfm1XHpTqZSY/+mmv+Vnb6fw4whG6ylk3PjR+Dlbh+deXjxpt
rBrocdp5R2v6WKWFkipKPgca1mOYqHoOPH1g6DgvgijY1qs1Pj28D4UsrBopR9D4xH6XpkVHGi/s
v4NqVvBO0mw6YXSdtCnROm0hcor4JadMDpWMtemsnSqL4M06bbG4y5y40X4CjxF8G+FIbGFlolur
jLSoJbRVbiRmtZNiVy+0LmuDV6YpSeN+jFyenVKOYI9fCMfKQFWnGa0mDHieytCX5Ib/AFTp27tn
oK/DUpOyRz+T0nvd7XZdMJ4/NUsXNcKilm5y6vBq0Mxi2vRdCVSL/JNL2Edb8Whc4q3sTTrryxyn
GWgvxI4Reydty7EgBkuG0UkVAOOQoqzGRjcZGCCYlPWhqiXCONDVAikShcGNM1uBIwyAqKsMSdgu
z0Eo4AU/0BKN7mjs2C4CDBOm0wO130bpRFOGQjPbBl5Gmb5RsjByGlJl8UuitGrwZ6W0aUh4Fzjg
xciNrm6ZkrNO6NaxWCTzoKOfAUoZDhE0zfUhENRIkNgrggqcR0Y4KghyWDONKhoucrItLBl5UnGD
NKy8ythq5zbuc0r4uFWm5Tavc08Pjqc07GR0OBw4ySctrwdenTUYpLSF8ekopY8Gi2CWoiRGS1i7
C9qkS7A6B+6kRejosOM7PZldYp1UD41ut23A/qjHKpdMV9y/wWSWs63/ANTdMTOr3GT76WwJchWw
ym61qTWgKku5NXEQ5MXhgVK8YvDTGRLUnF3dnsijL5M/9SnN/A+HIi0TqBkYv5CsVGaebjI2fwQB
FMMZ2qysBKIETDiKeA4N/IU2Mi8C1cL4EPol6CSBigkXF9GlgKKwSKXyElZbJfXO9F9uQksFkCKs
RBMqO0GhduAWhvgGQEotJ5N1OWEc9bRtovCDC+XHvpPxg8L1ej2zl+2fQKsb038NHi+t0nnHlnSe
jz3Zj5BlFo0RtbRUi+1y5esjZBk4fBC4zjppFfsNxdrg2yTHqUlgyV20zXLCMdd/kxGeRCuWsERV
zTAgHpllSAW9AXDaAaExEuHTzb4EXH0ZKwDo4QaBhkO2AvWJYunG8vRIq5qoU8pmbWpDaFC71o1R
prGAqEbI0Rhoza3xg6MElo0wVl7BpLGhiwzGuqvAuUhjYioyIjlnAKbuSKCjG4VEW0OpUr+Bro2Q
PGBxvsFxya5wxgU42Azy37JBXDqxwKpyaZPo0Qpq2gm1HzkCNVWFTfdLHk0QNWH3JYVxnH4fd/cj
VwqN0u5HSp0UvBq3EnTDHixikkjVx+MvjRoUENpRsZ2tdJClbwM7fYyIZKkZnEVOJpkLkiQvhHbk
KMdYD7Q4xKxooQDSsFBF2I2EgdiBSmgWsBtAsBU4gdudD2gbBClAtxQemRhQKKJ2hE7Q1FJFWDsS
wC+0B0x9iWwBinRTMfI4fcnZHXcfQDhfFgrynKpOj5yIo1mpLJ6Ll8NTvg4nL4coNtLRdZsaKNVS
saVlHB+5OjJXvs6/CrxqRWcjUxoSRfYNjGLLUPgoXGI6nHJcYXQ6jT9BB06eEG4ZHU440E4eiNwj
sIoejR24yiKIClD0Ts9GiMSdpGWdQ9FOGDT2FOOBBilATOJsnETOJ0niMNbEXg41ef5PJ3+TTbot
JZOFUpPud1kxfRKDysnRjG8VgwUYNSR16VO6WBC+MdWBzq6abyduvTaTwc2tTbeiubJCN9jOwbGn
ZBqmaPyzKA+nAZGkNhCyNJmJGNkFb2FGJdthr0Lwjm9RrJJpG2vK0G7nF5Mu+T8gYo/6lW3s9H07
j9qTt4OPweO5Vk7HquLTUYLGbAMUbRIMa9A9vo50FHwU5JFd1hFSorsp+dVWqWMU6ru82C5E003c
586nsyrTKv7LVf2YpJvyRKVisWtcqsrOzMVTkSjJ5Gd1lkxVpK7t5N8ZrGlcjl1W3ZsCjWqyV22W
nGT0PpqMVo3+E1UXUflgSdVeWaYyivBMSZPyms8JT87GwlJeTZS4vfawb4ko+znymOvGsf8AUSj5
C/r3FbJXouPgwzptt2uZkwtdOHU/lmuh1CE9s8/2NIKEnHyU16SVeDzcKFRWung89Ku+21xlPlO1
rmsTdd9VV8jYTucOlXbSSZ0KE9EajpReEWsCISuMTK0bfRdxakMiyOfIUfBZCBULsUGQVFhAoIAV
tGqizLFZRqprQG2CvE8t9RRUVKywespK8P4PK/USzL+SxXk1fOAW7DVHJaoOX8nSVy5Rm2yHRpcO
Vr2IaYw+aVnjQmWx9RWRnlsO/hdR2MdTfyaq2jJN/wDcjHItlLDIwHIrnuHAPRIvBTdiemgkLk8F
yYFslJVwi5XsrjoUZK2LInH/ABsa+65PGgQiMjHRcM+DRTgvgLxmgp0r2NdGm0FRjhYNMKeNGXSR
dFGmnoGnFJZDWDnrcmGw0GtCosn3O3yRobiwFTbfoOFRStk0Uo30gFQoeh8OMrLBopU72NUKeBqs
dOjvAcqTcbGyNIuVOyDTjTg43T+RTjn2auXJRbvg5tWtn8RIx4lTBld82TZtpQdSKbyaqPHVtF8O
65VGjKb+EdClxFKzNMKCT0a6VNJLAti9lUaHaljRojCw2EUM7SazhEaeR8Y2QUYhxiTVDGJbQxLG
CmieqS4g2yNaFyNIpRQVgbk8E1MMTwRP0LTLTyRTLgyZV8EKqmwL5LaKCIyiEAhRALhsSCFplp3C
jIgUGlcIqxC7EsDxSJgtRLsD0qUU/AqdCMllJmlq2ig04vUeDSlC6gk/lHBX/wBeq7XWT2k6akrN
XRx+d0yM25pO4Rl43LUsM6FP8ku3yee5FOdCWmkmdXpPLjJKLeUViurCBopwwXQj9xo0/Z7dBoMI
hdoyMMFdpNUPaRRGdvwX2gCo4J2DIx0FYIS4lOOB3aU4g7ZJRESijZOBnnB/BYyRKN07HMrca8m7
HZjT+QKlJNFRxocfKwbqcbRQ9UV8B/bSIMlWPcmZJ01+zpypqwidIazjnumvgipq+jW6eSlAu9J4
RGn6GKmMUBiVkWUZ+2zF1FZM0y2Z+Q+2DsU8cvl1fwkls5dm5GqtUvUa9g0od8kl8j0dLptGKs7b
OvDCMnGp9kV+jT4Jp6NzX7BdRCKs7GeVR5yTTDK1ftvkxVa928lVZXuIkT03B/ccnYBwu/bNPD47
qNWV0dWn026WMlS3XGhRkSVOyfo9LS6b6Ob1Ph/Ym8Y+Cudeer3SOfXmzrV4Np2RzeRSfa8HSJjB
95qVrjFXlbYiUfy1ktKyNsU/+ol8jafIldZMfktPPwS016jpHIjJ2m1j5Ox2Rmrp4PDcepOM0748
nqumcnuppSeTF7bnLo3k8aMrmCpxbReNHedPvjfZlq0cPBk15uvBRWDK3ZnU5dBpvGDn1KbQCJMq
EslyTimVHZrpWyhK1jqcaV7HHg7JZOjxKqVrsy6cddaDCcjPCtH5DlNNYJ40cqnsdTeDBG5tov8A
FBmnpuwS/YGw4BnMWgyFWIqIIpF6AKmrDo+BK1gbR2x6y30JYSPPdfhe/u53qZx+sRy75K08kqf5
GmlBJrAE8VDTx4d8kjW4zjTTt2rBDp8fiJxWPBC/o/LzlRmeQc5CJS36NgKujHU2aKktmWoRjkXJ
gN5RHfIK2TtDU7IFyKegWXtFPJaT8FLaNFON0sF8JAUr4NMblRpjowzknrQqSu0baFO9hFGKN/Gj
rBLW+E7Po0fxHxjbwXDSDZy12gP4Cir2yV5wNhEih7RdSDZqjANUr7C+MdCm+5HVow+UVRorGNGu
nBINLpQ0aacPRKUdDtBQqP8AgVy6kaULvaQdap2QbRwup8xyha+QjD1HmxnU7YhcSl3wTavc5cIf
c5Cv5PScOko04r4QZ9SjStZWsbI00lYuEFiw+MAYzqnkdCngOMRiViNAhAPtLS+C/wDuBEsBxRUU
MsANirBgN2QC5C5hSkA3ewZQhTWCl7Ki7EStciZba+SZUUyJ2RTkD3XQWdrbKbA7i1IL2lwXL4Bk
8ipMIZ3Z2U5C+4FyyFh6ZaYhSyEpWDbRFjYmaEhsJYJQ1FgqRV8k8BXImCX5HqIwQ2CPTtaXorsT
awEgkUc/qPDjWpNKEb235PHVo1OHyWspXPoXbc5XV+mRr0nJLJVrJ0Dnqo13vR6aNSMkreT532z4
NTDsrno+jc6VdKLJSPRRVy0s6JS/tV8jIxJ3FAol9o3t/gnaVARj6CcQ4RCccgJ7SnEf2lOJVZnC
4uVM1OILiGfWNwAlE1yihTiUZu2xO0c4olgM84ipRNUkKmiOdZJRKsg5rYtmu0UkiEZLiJ4Cayc/
qdRQp72dCbOF1qrhI6K5rzJv5Oh06Kckcuk3NnZ6bBrasY8R1Xi2fAMpWRcnj9CpywTsLq5Mzex8
5CJoigUe7Hya6HA+6ld2E0P71fR3+FBdiEYtBwuIqKta/s6dKUIWclgpJRTOX1TkqnTavZmnO13V
1DjR/wCaKaWjgfUPMpVYtxa/g8tV5VSU32zYipUq1FaTbNSM6390JpWaHLhKpTburNHFU5U/OjXQ
6k4xabNyH6Y+ocZUptLJz5WNvO5KqzbMEmVm3QX2Mj4E+RkXYuaHRai14Ol0zkRdaKv6ORLKD4T+
3Xi72yZvTfGa+kca0qa/QNWndPBn6VW76SzfB0u3uSMtY4PLoJ3wcmvR3g9Jz4KKZxK6u2DHJqU7
X+BSjbwb5U3JsFULNBqRiad/Q6nJpI0OhfwRUbbRl0nh3Hno006l3Yz0qaSQ+nFXRMGlvAyjN3Qt
rAVPA8MdCm8DoYRkoyujXDSKlnS7FhKJO0y59hRSD7SdoaTwOoZF9uBtBbBGyj5OR1mOH+jq0ts5
fWV+L/RR5PtbqP8AZ1unceTzYw8dd1Z3+T1PTuOvs3SAZSjaKXwiC6kpRk0nggHiJPBnnIZN4MtR
+zqxQSlkW8ltgMRiqkhbDkAzTP0LdgbhEilYLi4vKNNNGSL/ACNtHQqnR2aKcVfQqnHKNdGFzLfF
KccnQ40PWBdCneaxc3UIWRmuk6HFY0U0MSwVbJydIqCyjTCmrCIqzNFNk6XoUY2HQiUv0NgtFaMh
H0OhECA+C2FNhGyCloGDxsTy6326bd82CMnUOSoU3nJ5+ManJb23cfzJVK0l25+TqdE4jS7qiswr
n8fp0k02s3OtRouKSN1Smk8IqELABTp2DURkUW4mUBFBJYIlZk8AWiJWZVwblZORV8CXOwuVT2Gm
n4+BdSaSwzJPk2WzLPk38hJ201Ku/YuFbOzHUq52JnXUU8hXQq81Q8oR/XxzlI4XJ5DlJ2bsZY1J
Ju9xPWXf5HU1Dzf9CF1ZfLOHOTfsG8vg0xXcl1ZW2yR6ukrSdzh/k74AlF/IxI9B/wAXi2RdVT8n
nYJ5I733oYbXpF1JPyU+oL5POSnJLYH3ZX2XD9PS/wBfEWudeSszz6rP5LVVp7L+T9PVUuQpJZNE
anwzzXG5Txk6VDkppZMWOnGutGYxTwc+FVNrJphIzjTZTk7BxkxVLIaCwxaIilgtMmArv5Jd/JRE
AQSYJaRnxR3Cw01JXRQS0WVMed6109T7pRWNo5nS6749bsaas9ns5RU4tNJnnOrcNwmpwVv0bR3+
DyY1ILOToxykeG6dy5U6yjJvZ7LhVVUgmtWCtNshJERaQVcUF5KiXYiKsQuzKKBaAaGMGSIm0mSF
uIyWAS4aW4AyiNkBa9isFSiKlE1OHsVOm/BOmKwzjkU4mupBxESQ+jPOOgP5G1seBLkagGo7RPNd
Wqd02tnf5U+2mzzHNl3VHnydA/ptNOV2ju00opYOZ0mF8rVjrdr/AIOV9JNRvYio7XHSVkZ62jXR
mFOWStkhB3H0qWckUfGoKpY7XDp9iS+EYuJDtZ04YQjhy9XyJNU38pHievc1wm1fKPYcqa+2/wBH
z/6i/LkSaNY5zsriVnOV3o6GO29jm9Pj+KZprz7YtXsb8akI5Mkm7GT7lr5JUm23kS7monIfddsX
KRNAvJSChpkkVDCJJnRDFpBxaTQCX4/JIJ38nLljXF7P6fb+0vOD0dLxc879Pr/Ri/R6CnLWTHTo
x9Szc4lSF7na5zTvZ3ObKOH8AY4QzkkorwMnhsFmL03JS7EaC86La9GdawC9DaewUvQdOL7kWUzG
mwdOHc9B0qXdvBto8dRSZdkaDQo5TsaowWMDKdO1hqh6J+oFdpTiPcH8AuOxsTC0v4LUUFYK2DXx
iwvtQcEXb9E8mQ6lo5nWf7X+jpU2c3rOYP8ARYmPNQl21F+z2XSrS4y84PG0V3VHjyeq6PVX2lHy
X6NlSkr6IaO3uIRl8sm8GaQypIRKR2yM7oZgNkkxbedlkYq5SBuC2SJTEuRXLLisE01dGF3nZspp
IRSWUbuLS75JWI1xmm0V6N3HjoZT48Y2wbaNJYxYza78eK6FNJXtk0RSSJGNkWlk5+tYrwUgmSxi
r4iQ+jEXTiaKSKGRiOpxwDBD4INrhEYnYijgXN2ZPBJ1uxM5XM5DrVO1aH8qpZfszcak6leOMN5G
stXT+F3O8snYjHsSUcYBoQUPHgNjWkaKImXbBKsSJJMFgtgEim8FXBlKxUqSlYW54F1aqS2ZnXw8
iBtSr/gQ6jd8iJ1tmSpylHyXBrq1bIwVayS27gVOZGxhq1+5uwZ1olXec4F1Jykt/wACYXk1jyb6
PGlOOvBEtczPcPp03LwbKXT255WLnb43TY9q/HwVi8nnIcW7zgY+Gep4/RvuVFjF9G6r0anTptuK
WDc8Z3XgalLtv8oyVJKJ0usuNGtNeDzvJrtt9rsiyLrU6iiA68bnLnWn8i/vSb2X84nx1J1ovyJl
UXyY+9kbfhlGtVF8h05XMCbuOpyd0B0KcrM10atrZMdH8rDoba+DFXja6NHkNNZOlQ5HckcBNqxr
o1u1bMWNfp6ShUwaIyONxeWrJXydGlUvbOzNmNytncWmIvkZHRPXT05aKBTIhUEg4+BYcTBPTEEg
Y6LQaHFCuTRVSLTV7ofBFS2bR47qPElQ5HdFWV8noehci9JQbyV1TjqpRb8o5PTKrpcq17K5Ue0g
8IMy8aalBZNCKDh6CSFpsJSz5IpiKSRccoKwQNvQuUVYKc4x2xX3YSV1JfyysWYqULiZLt/RtpVK
cvKMXV6kKVJyi1oqFyqwV7tCJ8unFv8AKKa+WeR53VpRqSUZ3/k5dXqFSo23K5cHsqvVadNu8lgR
LrtPxJHi6nJlJNNswzrSUsNjGfX0D/itOp5QP9fTfk8FHmTj5YyHOn8smD29TlRn7QuM7s8tQ501
ZNs6/F5acV3PwanTNaOfVtSZ5uf+pW/k6fUa6mvxeDl0ruuseTZHoOk07RV/g6bSRm6fTtTT9Gmp
g51oqpoS0HUkAvRD1IxwOpwbBpr/AGNVFLGChlFOLXs3U8xMqV2baawJ65coycyP+nL9HhurQ767
Xs+h8ql/oSv8HgOsRca7/k05yYy8VKEUgeU7piqU9q+i5yvs160xyVmU/wBjKkfgUdJ05cr2jKIT
5L4kqApZCLjEutYbT/t9jKau7C9RNPTaTq1Yq2LnLl23xet6FBx40fg618Gfg01SoJL4HORh14dk
1Y3yZakbJmyTuInG9xtdMc+cMi+w2ThduyA+2Z9dMZlTuMjTwPjTwNhTwiGM0aPyjRS46xg0U6Xo
10aWdAwqnRt4NtKloZTpmqlDCIYVClgaqVkaYQwFKODPi4yTp4wJnBpG2UcCKsTTFjJbIRclZ6B/
gusVMEayT+AlseoumjmdZ/ta9HVgcrqy7pMujgcem++Tti51un1HTml8mWMbGjir/WWPIZ9en48u
6KdtohfGlFJIg0fH5yEyZc5C5SPQ5IvImQzuQue0VAtlwKsSGwkOgkGti1hFwzInhjTTXwdjp1NW
TObxabbXwdriw7EY5V2/nxa42bRtpRwjFT2jpUYfijFeiTpFEpxHNWBayY1CbZDSLUdFxDSRWR9N
ZFxGwWSHR9NZHR2hVMeUXfBm5ErD3L8Tnc2o1pkphFZ9zSWcnS6dR7bNowcOn9yod6hBQglYMja/
wC0HIFmfrYUi0QngpAMW3/kYxE209BV92QnozOok8lVeVCMdpYLEZ+dKyVsHOlyElsR1Tnrwzky5
bl5NRPHRr8pZszBWq93kzTquXkunebS+RVXOq7WG8NOo0rXdxvH4P3ZWbseg6b0qMUmskc6z8PgS
k1g9Dw+n4X4+DdxOFGKj6OnTpKPgmM2uTT6arq60zdDjqEVg22SvgVUkop/BccrQU5RpZ1Y5XW+u
UKFGUXNd9rJF9Y50ONx3K6u1hHzDrHKqcuu3d2ubjGr6lzHyeRKV7q/gyqmpLVxNOFtu5qpSStg3
CUqpw323sYZ0XHwdmpyI9qS+Dn8iXc3bBo26xJZDii+3+S1gzfWpdgWrFXsW2A2T0rZx61ll2N/G
/OXycRSsdHpldd9m8jMaldd07ITNNXwboJTytWAq0rIzdbmE0Ju6zax2uHV77Z0cFrteDVxazgzF
jUekgPgc7iVe6Cb2b6cr2M+Okp0Syol2sKqBRKsHGJFGtBxXoGMcDlHGjB2kUF23CjEbCF0NxfWS
tT7oNNHlOrU5cS9WOLM9xKldHF+oeD93hzaV7HQB9Pcz79CN3d2PQwVzw305N8fkdksLR66ry40a
Tle2LhnK6NGEc9zKlOinmcUeK6j9Ufb7owu/aPN1/qKtOo7N2uRX1tVKNv700Aq1GzfcfL6P1DVa
V2x0evVLrLaKj1nWOeqcZdrwr2PKVetzhJ2bZn5nUXWjZu6aMNPiz5DtDbeBB0P/AJJyIP8ABsz8
jrfL5icWpNM38X6a5M4r8btvP6PS9L+mft2dWKuvk1rnjwUOBXqyc7SbfyMj0blS1CR9aodJowil
2L/A/wDoqMdQS/gumPk8Pp7kyWYyX8F//F6zTdnc+pzowWkjNVgvCSLpj5dW+meRFYyYqvRuRRzJ
H1Scf0YeTx4Ti8K5R81+xKniSs0HGr24uer6h0uM4tqyaR5Hl0ZUqrT1cfGKOpVumTgRlPkQdsXy
ZbM63Ro3qaHwj0vFjamvQNfFx1FfihPJWGZWsVSeS6chM/7mHB4A10jVT0Y6LyjZSAfE3UTFDwba
LwX658j5rvpuPlnifqTgypVO7d1c9qmc3rtGNal+TSaWLsMyXXzftcZaKlc6XMoxhlNM58084wa4
1LMpUtCtvIcri0snSVzsR6wyJEcXZk0hbG+PFajnQyEQIjYXuTWvxq4wu7Wueh6LxVG0mrM5/TeK
687ydkn58np+LQ7IpI58uTfHg1QxFK5d7g9uC9IzOTpJirAuId8EJrUJcAezwOaLURrZKgOhT0Mj
FDoQAqnDWDVRgDSpmqlT0RJplOmPhDAVOJojBWI18LjHAXbcZ2lqOCKT2IRVgr6NdrMVWjhliWa5
047F2NMlvAiSL65XoHb7LRGRZLGRRZzOo5kzpnO58JNtpNo30jj1ZuOjRwpK6k3Zmatl/oqLa82R
ll6Klyoq2SHAVRryQDwc27C23bYypsDwd3n0KbJfJZAysKKWxcMDFoNfVsdx6fdJYFQjdo6vAo4T
sZtdOMbuFQSSxk2uHb4L48EvA2p4Rjlenp/nJBcando7FCH4oxcKk3Z2OpGPbExrqRONnoC1hs9g
NYIyW0KayPaAaAqA+C0Lih1MB0A7/AMEMSKpdWSjFnLry7jTzqllZMzceP3Ela7CNvTEsY8nXWEj
n8Ok4JG9EUYLZfgBkaxUpFd2AJSFORFMcsPIipNJO7wBWq9sX6OVy+Y/tvw2SepYnP5kYL8WcCtz
5Sm7N2Jy6jnfJz3FqV2bhh1eq5rIhPAUmUot6NMcpkFTi5NWVzs9N4Lk02hPTOJKcl3I9dweMoxW
Fol1iMvD4FqqbWDvcWhFWxoGlS0baNO1ifU5dRqoRUYoehVJWaHJYNOW6F7MfMxBm2SyY+bH/TkE
fPvqnktTcbux5W97nb+qG/6qavpo40Vg6RhSRL2QekLkzR1Cp1BLmFPbElgNy8i3J3GLIl4ZF+I2
XHIuWy4SsSIZJY/YzjtxmmlsB6L48vyS9it8cer6Y+6mrjuVpCemK1Ne0O5WiNVz57Lj4KnFp3Lg
zHLxrh663TZYs3g7FBnG6cdnj6Rh3a0sBWwDHwGiNVEsDYx0DFDYxyRmCjGw2MSQWkOhEw30lOI+
nAlOI6MSJqowTEc6gp8Wats2RWAake6DXhnSK+Yc+p/RcptOzuVyOszqUnHu8WN/1n0xpSqwbT3o
8L3zTcXc0Gcyu5NJb8iIOLV27MtQlUeE2/g6HA+n+VzZr8JRhfIwZKVSKbVjZwePV5NaMKcG03u2
Eep6d9ESlJOopW8nt+kfT3G4CVo9zS8oM48nxfpOM6cJN3dso7/TPpilRalKFrfJ6mNKKS7YpW+E
FpGfEZqXFhSilFJWI3n9D5aEziUUpCpy2G0Kni5Qmb2Zat8mmXkRKONFGOQmp5NcoZEVY4ZrWMcz
kx7oNJHleq8b8m2tHr6kd/Bxer0e6DaWTbN7eRnFRZ0ejf8A7kc7kxcJtW0buit/dJPEerpL8UL5
WngdT/tTAqx7rmatcOtO03gum20bavGUnexKfGs1gx9T0NG6sbqRVLj6waYUreC61IKmtGqGLC6c
TSollw/OpFmXqNBcii01dpYNqiVUj+LXolvS/l4DqHHdJavmxgcXbR7PmdP+7N4umZV0ePlMkrle
OvF11basZk86PYc7o0e5YMv/AAWL8HX9J+Medd5RwVCjOXhs9PT6E7adjdxejxha6/ySdrI8lT4s
/wDpOhxenynZtNerHqf+H042/BYG06MY6ika1crn8PhqCV1rR0YRship+g1Tscb66yYSlknaaFAG
UbGe41hHbYqw+wKjsstQtRxkZGHwWojYRHrUVGGR1OJcIjqcbsnhR0o+jVTjoGlTWDTTiVYuEco0
RiDCOhsUYpVdpaiMiWkIeEygIqrZtcbmerHLNs3tz6kbXM1SP+TfUjhmSpH0VzvbNYiDlEqKKxmI
tCeW/wDQn+h7WDLzXaiy/FebeZy/Yajgpf8A7X5yaYx1gJ6R9tvwQ2JIgTHzqUbgdrNH4/AubSO7
zYTYBp/Iy4LBIkUMjlgQHUku5Brjxmm0Kbckd7hUrQRzuJCMmrPNztcWNrZ8Ga9HHg0U4tLIyMO+
S+LlLWzRx7Nq7Od7jtJ+XQ40VGKsahNHtVvI+ysZzDZjPJZBsNlEBx/wD0qQKXoKWAJMAoodCOhV
Nj46RFHEKTsmVDJKmIsqOTzG+9mrptNNJ2yZuRmRu6WsIGunThZaDsR4sRMyuI8C5PIbYqbMfW8I
qMRObSG1Xa7ObyuR2xeTQVyuX23UnhnKr1lOLsTlVHUksAU+PKXgNMtWzFfa7jd/TvutY0UeI76s
i7h45lHhyk8qyZu43AtJNq6R06XGUbYNCpKPixrWeUFwKEY2ssnZoRtYwcNZ/k6VKyaJrlmNdGOT
VD1szQfsfT2is3tqpLQ9CqS0P/8AQnblZgbXMfOX+lL9G6KuZeZC8WvRrGNfKPqpP+rm0sX/APBx
KcvDR6r6to9tZpI8pK8Wbi5pvgRLzgPuTFSL5EsKayxclke1cCUHYvp+QXwLm0FKLSAlFkxC3skV
kZGm2xkaRZMAJfiHx4Wmr+WMjTzkOMLtWJWuPT0nTMwVnfBprwbasmzL0iHbSR1oxv4OdrtOLmyo
trQp8d/Fjsdi+Cuz0Zta/H5ZeDFw2jr8eV7GSMB3HTU1+zNa+OrTg2NjTDoQ/Ffoco5MLpUYjYR0
HGA6FMihhEbCOQowwNjEKkI4GxiSMQ0iKtLBdkRIJIq+OD9UcaNXgyWmz5PyOM415qzbvZWPsnWV
3cdo+adQpyXMfZjJ0ZtO+k+izrVVOUG/yvZrwfUqHBpUoQUacYtLNkc/6VoKPFpytmyyeilFDU1K
MYqKSilYtxVwE7MajSqwnoCauNsA9GEKtgBrGhzFvYh8JlHBnmtmuRnqrZRlkLav5DmgCoXOJnnD
DNbXsBoqOZUp7OdyOP8AcTTWDuVY3WjLOmvgaw8J1jh/blezyI6Qu2t/J6rrVJPjyxpHleJLt5Fv
ZdHqYy/01b4Khkqj+UF+jRGmKyCNP0HCmr6GqA2MCNyYCELeAlH0NUQksaIAhEco/wAlRQ1IqyKi
vRclfwXfJV8hfQqmvgJQXwWmXFr9kXGXlcZTastCI8X0jpq3ktqPwD8ysK4ySWMhw46NaUbbCvFL
wTan5xklx/Qp8XJv74oXKoi6uMMqai7fAM0Mqu7YuxUDYCWhoDM+ml29Fdo23olvRVVGI6EC6ccL
A6MAsVCGB8IawHSp4Hwp6IqUoYRohEkY4Q2MTFVIxwGkEo4CUSM0KDRfbYnbZBUFzjcZYljfxnNY
qkLXMlSG8HRqrDMc0aKwzWxawzRUWRLQc1PTMHPu6LsdG2PZmrw7otfJYxXA41Luk77N8KKsDQo9
tSX7Nsaax8m8iazf09yGxJEJhr5QZ5jrpeLC5HZwJbyHGNwGsjFonhDIJLYyNrrIlSwO40XOola5
NdeHFp4vd3Pt+To0q042uaeBxIqndq7YyrxlmyJa9HGdCoVu6N2x1Kt8PyYVRlHWi4xqRzYz01Xc
49aV074OjCrdHmqXInFK6tY0U+e01d/sy5vQKSuDJ4OKuq007N2a+Q31ejby/wBEV0J3Fs50+r0/
mwH/ABWn8oYzrqxdvIyM/Zxf+K0/kj6tTs8oNSu4qyj5LlVTW9niavVav35NTbhfCNFHq8na7uwP
Suk5SRu4VOUGro4nSOZPkzXc8XPTQg8YI1DllEsFGDLUWZ6WaU0IqGtx2LdO5h0c6onK6MfI4bmj
s/Z9EdNWtYqx5uPAV1dXszVDjKOLHUlQXwB9poNWOf8A08b3sGqSXg2KmT7fo1pjNGGdFuD+DQoB
do1m8S6Me30a4N4EpWG0xrN49NlGWjXTlo58JWNNOejTneLp0pDe4wU6nsYqvyyxzvFthIqpDuWh
NOov4Hd+Cudjw/1fxo9zla7Pn9eP5tW0z6x9R8b78G0s2PmXU+NKjXbs7XNcbBh7bXFsNytsC506
Z9UmW8oFuxI5JGsRpW0A4oY0VaxpnFQjkP8AgkXgv/sGsV59m7g8dzaclhGSglKZ6Dg04qCsYrXG
NfGpqMUrWSN0ErCKUdGiCwcq3FpeiOPoaoXSJ2GPXT2FqNlo0cWnd3tcuFPRv4lJLaNGY1UIvtX6
NEYF0oKyHxhozjUgIwwOjAuER0IjDARiMjENR0MjHBihaRaWQ1EOMSKCMcjYQv4LjEfGJV9crqND
upSwfPeqUezkXatk+qcinemz539SU+3lpWxcvxl6/wCmlfgw/R154ZyPpn//AAoL0diSHYBK7GRK
jYNRNwS2AHEaolOJE6Z2vgGS9Gns+AZUxD4ysTURrlCwqcdlHPnEW4mudMVKIRnaAkjS4gSjgqMl
RYMzWTdOODNUgVlyOqw7uNNbdjwn5Q5bTVsn0DnRk6ckeH51Nw5bbxkI9P05KdJfo6HYsHM6HLvg
ondhRurhPWdQGKOjUqGNE+16M1qQlQwUomhRxortI0Uo2CYXaSxVLBf7GNANFULfsvuwU0CyJmjc
2Tu9i1cq5F8NT9gymCnjBTBekc3YByYTJYuoX8BFuOClEqegaIo3GdpaiFwtQ9EUB3YFGAEpR1c0
QhklOGEaqdMKqnEfGJKdPA6ENEO0jEbCJcYjIrBz9VSWC0FYsCvghLES+QBLsFYjWNlhGapHZlmt
m6osMyTW8G2aw1VszvZrqrZnaK5gYuosDgO3udixj6xKC73L5I5JMfyofbimsHPqTZv4laPuIhj7
yER8zIDclzrHIt/3jErg2yNprIrXHsCi1I6nSaN6ibWBFOkpNYuei6XxO1JtHPcer+c6bONSsraQ
2pSQ+Me0jV0S10xkjxrtXVzXS4qa/tG0oO6NlKJjSsFXpqqR/FdrObX6VUpXaaf8HrIL0BWpKS0V
j8vnnM41Tus1kXGjOET1nUeDd90Vk49ejKOGgzjjShNyzfZXa08nRdCXhXyBPiz/AOl2KmMMo+xa
gjTV481d9rExpVJN4YZK7V3WOtw+nd9NTSwYqfDqSf8Aaz0XAjOlxldEvTc1o6LxvtVUrWyevpRX
avR53pNT7tTO9HpKCwZ9bg1BWRO0dCN0W4nNuMzgC4Grt/gXKJGsZ3T9AumaLegXErTO4inDOjVK
IHZkh2zdnoHsNn27eClAu4sjIoBKmaewtQxkq2Mrp2Iovwaewn20EwiOB0GU4ZLirFlYvA+MinL8
gEiWL+mbxOhUatk00qvsxJBxvbYlcbDOTad8XueY650yNWLcVk9IlgVVpqcWmjcqfh8i6pw63Gqu
y/G5ijJ+T6V1bpcaibawcKX07GS7oyav6NSs/jXk7hRdkeh5f0/KnRlKDcpLSts5q6Rymv8A9TNf
pPywqogZz+DU+kclTSlBo2cfolTHfcfpqcOnFVR3sk/8D8uKwz0FLoqurpm2n0aMrXVh+j8Y4PT+
N9xr8Xk9HxuL2xWM2NXH6bCjayNcaNvBjVnEilR9DoU8j4QstDIxyYtb/JcKeAlSyPhEOMchoFKl
rBtp0+21gacVbVjRCOgplI1wjoRShlGynAlVIQGxiFCIxRMapaiElYZ2F9pNAJZGRiRRGRQQUIjY
xKivQ2MR4vpFZf6b/R89+p4tcpO3k+kVI4aPB/V9NRrL9mt1MdX6Qk5cZJu6vg9LKk7YR5z6RXbR
geujC+SJ6wqk76Gxp22alDOguwsGeNPBf2zVGGAlA2jGqZTp4NvYA4kHPlTM86eTpzgZ5w2Ohzp0
/RnnD/J0qkDJOGGVWOUQHHDNMoiZIMs7j/kVOnfwaXbPyC1grDmV6Ss8HkevcRO8krM9rVSs8nlP
qGpCKcU8ssOi/pf8qihe7R7GjQaSweH+kanbzMvbPo0bKinbaIjM6dkLlTuar38F9ob9YnTsKcTd
OmKdMisvbYrtNMqeAHTKrM0C4j3D0U4gZ7egXE0dpTiRJWftBcTV24BcAvrNYu2h/wBvJXYAm2Cm
h/2yOmEJUcBKKsH2BqOAFqGAlHA1RCjAgUoIZGn6GqFhkYAnoIU9GmEC4Q0OhEVpUIDYxCjHAcED
EisFpBxWC+1XMgCDbEsQLsC9jLASCKIQgCprDM1RbNktMzVPJ0SsVRbM01k2VTJJbEcqXLQfFj3M
Cawx/BjeRpF9Q416CaWTzlaLTaPb8infjtvVjxnPklWkl8sqMuSF9yIVnt8xbLTwCWjs5C+B0ML2
Z/g0U2pWJXT+frp9Npuo9Hq+JDtppW0cXolFW7rHoaWkc+T0cKtpsqMXdYHU0mzRCCb0Yb/QKcNY
NUI40SFNXQ+MSLupFYI0MjEvtQVmq0VJauYa3AjJ3sdiysA4pk1LHDj01KWh8enrF0mdNRSJG19m
9jOOe+l05YaX8FR6HRv8HUirjoRsc7y7T8uL/wAJhF2iroRzeK6FF4sl5PRxivgxddX/ANF2Wb/+
x+l/LznRpdvK7U8NnsaEXg8P0V25jv8AJ9B40F2Rfon6akg4RwH24CUcBWMNkuAEoGhoBxI2R2YB
cTQ4guJTGVxKjHJp7C/t+hqzjhHb6B7Pg0dlvJXYRrxn7SnE0OAuSsUKSxolhliKItQrsuEqY1R+
A4xIvwlUyOkzSkrhJI1652M0ab+A/t28D4pF9q+R453j2zqBHTwaLDKcU9q5qcsifly61JSTUldC
oceKja2jtTpRvpAuhC2i/qUxxKnEjJNWMz6fnCPR/aj8FqnFeC/pPy4EOmRk13RGvpkVe0cfo7cK
cbjoSpq97Ma1keffToxWhEuPGPg7vJnDNjlV2s2Y1mxilBC+0bLZSV2NA2wg4RsRRyMhEFRIZGJI
xyNggerhEfSjoGCNVOIXDaMdGylETShlGyEbHO1VwiGolpYwGkRQduCWGpFNBei1EZBEURiiGBRQ
a/QMUX40FSVrM8H9ZzX34pfJ7itNQhJydkkfMvqzlxq8tdjxexVet+kbSoJ/CPYUtI8Z9ESvxrns
6WkGTYxQXaDAYtmp2mqjENRDSGKODSaR2i5RNMo4FyjgnSsk4iZR2aprYprZpWKcMszzh6N84mep
EDm1I7MlU6NaOzn1llkZsZ29gSnhhTxczTlkM2E8qX4s8P129SbbZ7avHugzyHX+M1eSRpGH6cqf
b58LvF/J9VoTjU40LO+D4xx6zoV03u59G+neeqlKKcvC8kPr0UYY0EokpvuS+RqjgjUwiUAHA0uI
LgRpllD/AAC44NXZ8oFxwVWOUN4AcDW4+gXAMsnYD2mpwXwC4IGEKJHE0KHojgFZuwnYaOwp0wEd
pO1GjsIqYGVwyWoGjsyWohCVDAUYDlEtRAXGIyMcFqIcYggoRGxiVCI6KMNKjEJLISREDRIKwKRC
UX4RYKCsBBUhlgJBAaJchTHoGXkz1Fhj5aYqppnRmsdRGdrZqqebmaQjBclhm3p1LN/ZjTOr0yHd
Y2xWnlq3Ha+UeE6lFqvJtWyz6BzaS+27u2GeJ6vG9RpWTA5RAoxdtkLo+aJBRiB/IUZP5OmuGKrL
tQfT4/dqpeBVd91kbehceb5S2kiuvH17LpXHUKKx4OjGKQHFh20UvQyxxrvxMpLJspR0ZaJupeDH
jRkI/wCRkIlQGxRViKOCJBolvRlS5C3cdJAuJL6FWwUo50N7S4xMmCpR0aFC6FwWh8NE1cLUTJ1S
KfFd9HR7b+DJ1Wm5cSSWwrw/TZdvUWv/APbB9H4SvShjwfNuPTlS6krppd2z6T06XdQi/AI02Ktg
MKwUvtBcdjUsl2I38IcSu0dYvtCwjtJ2j1AnYG/pHbknaOUClEBDjgXOGzZ2i5xAwuOWWlbwOcLs
vtwEKtbwWv8AsE4lWApMJPBREWdM4vusU5g/JQ1mjUg4VLGe9mTuRGWqVVfILrezM5Y2C3gsGl1s
bAdb2Z2C9FD5VnZ2Yr78lfID8AyQ+piqlZy8mebbGuBOzRU5eEKNy1EaohKJpjstR0MjAOMdDIxF
aKULBxQ1RDhTyjBF04ejXSg8YKp08LBtoQ1jBNXBUaWjRGmHTgOURVIVP2Eoju0tRIhSjgpRsaO0
nYUKjEOK0Eohq3wUUogch/bg36uaIrDOR1uuoUJZstXA8n9U/UMaFOVKnP8APKtc8FW5Eq8lKTu2
7m7rVCXI5k53urnNhT7ZpfDHg+ofQt1xVfye2pnjfo1dtCC+Ueyp6L2HRGRvgXAajUZp0UNVrGeM
gu/2VDJCp2sU5iZ1CGdKn5Et7LlIW2VrygqPZnm8DpszzARVV7mCtHZvmYqwHPqmOZ0alO9zFWpN
XCEuWDn9U48a3HkrK9jTNNNgr8k7+Ss1846jSdOo8Wsy+B1GpxqkHGTSTTtfDPQfUfBsnNRVtnj6
0e12DD6b0L6kXJrwp1FZy00eyjJSimn4ufDei1Jw5dNqTVmfYOk1XOhBt+MhuOogZIuLui3+iNFt
ANDX+imvRAhoHtxoe4k7Sk6Z3H0C4mm3oFoKzqNi7DXEvtJ2zhFiKPof2guJTC+3BfaMSZfaFJ7S
KO8jHEpRCZoe0uwfaTtBhajcOMdBKOA4xIq4KyGRKQSWDCi8ERETwXQS8kIQnopZLsUi7gSwL8hX
BkAsFhyB8MqAdrMXPQxgS0bZrHURmmjZUMlURgqKydnpeLezixeTsdOdkjUZuNPW59nGUm7LP/Y+
c9U6jBVmnK7v4PWfW/OhHgwhTn+abul+j4/z605VXLuYHon1GPhkPLQqzSyyAcu7CiwbEjvZ2xwH
CLlNHrehcVdqaWcHmeJFOau75PcdLio0otYwjF6jt/OOjFdsUgithwRjXeQdFG2ksIzUomymtGda
zDIIdBAQjkbFEBJEsFFF2XwZqltANZGsBkTAeC4F2uXBEWGQ8D4KyFU0PigooWFcyKnTa9DkgZRu
mFeO5UEpteb7PW9Gd+HTzdpWZ5jrFNxqN2tZnU+m+S5R+28raLB6VLRGiQYTXyRqdqSIkEo2Io3Z
GwtFpBKNi4xAqxSXobYu3sBdgewZb0C9hfAdtvIuUBpbQTWfs9AuI9xyA4g1naKcR/aD27AT2gtW
THOJTjgDOgWMcWmVYsCGQuSKsRxD5LRaVy+0sFA2D7fRO2/o19XsCiU4exyRLFyIV2AuI/tKlElS
s6gFGFx0YBRgSdM9FRgMjEOMBkIABGF7GmjTXwSEDVQgF4ipU1jBrpUlZFQho004awRoVOAxRDjE
JRI3hfainGw1rGgWshnApF2Lii7GmS0iSairhPHg5/VOTGhQcm9I3Jqq5PUYceEnKSSSPEfU/XHV
ouFOaUX4MPXuoPktuFRxSxZHlOUqlS922jX5Snvlrtabu/kRxZOtyVGOXdGKcZxRv+n4N82N15M5
2zr639N0HTo0npduT0lOXg5PS128SD9GunV/NoeLHRhIbGRjpzTG94Vpci+4zKQfcx4dCnLAtsO1
y1DBlCWrgSRq+3daKlS9DRhmhE4vJ0JUr+BMqW8GxzpozyidGrSw8GaVP0BilAz1oqzwdGUMaMta
nsg4XJirvBmWGb+VTyzIoZNM1m53EjyqLUt2weA65wnxKjWXk+lWsjzn1Dwu+Lm1crDznQ6CqtNY
adj6p0hdnGivNj5b0qtGhyuxuyufQukcxTUVe7sGo9FTkMuZack8jkzLQyFFPwTFH4KawQKKAXYl
hjiV2mTSmi7DHEnabAWK7QkvQViShfaTtG2JYGENeiWGOJO0ehdiWDsiOJQKCRFEuxgWvAa0DFBo
gIhCBEIQgEIQgEAegwAoJAvyHIB6NxkLFzCYM9FYrPUMsl/JonszTv42Il8KUfyHvmrjUm07NGOv
V+1Byk7JHhuvfUVRynSpRxe17mmB/UPWanJ5U4QfclhnIjxpVldxN30z02fUeWnVg0pvHs+gU/pe
EKdnCw8V8xfT5+EQ+oR+mof9JAPhhLBJDKUO6SVjs4Q3gUpSmrabPc9N/GjFekee6Xx0knY9Hxl2
oxXfg2qVhtOabRl7rj+MsnPHeN1FGuCsZ6CNkY4JjXa4bGx2Lisjo6BO1r/wWRItGKAkC0FIFkFR
iFFf9wUGtkX02A+GxEEaIIAkg4wvFkSDimFea6/x3lxWLXMP07W7OS4N2PUdQ46qUXjweNUXxupQ
llK4H0ClpMcsmPhVlUop3zY200RuISMchyWS4xDQYxD7Q1FWLUfYC1EPtCUbEsACj6AlD0aO0Fxy
FZuz0Ro0dotxCFdotxNHaV2hMZnAFxNDiC4hSHErtwPccASiE8Z5RFyhs0uORbiE1llAHsZq7Sdo
TGZQL7DR2kjEeGE9jB7MmnsXwX9vBdZZ1D5C7RriTsLKnhKiV25HuBahktPWdU8hqmxyiHGJGfyS
qedDIUx8KY6NML+eiYU9GqhTCp01g00oegSYlOFvBohAkIjoxI0uMSW9hIliYKsA0Mt7BYwCkWkW
iR2XxAuF0eR+spSp0JKN7NHs0sHL6xwI8yjKLSbttm5yV8QrVn+Xd4ZhfM7ZWauey6r9JVnVm6Sb
zpHleq9F5HE/Jp2Tyb/TNY6/Li1o7H0jS+7z4O2GzzsabqTUfNz6D9E9Kn3QqpYTDOPoVJdnGgkt
IRGo+9s1V0qdFLbsc9v8mRqTp0KVW1smmNS9snMpNtI2UPBjTHQg8DoRuZ6a0baMdE9Bxp+hsKXo
ZCOh0I/7hCFS9FSp40bFFWAlEKwSp+hUqezdOIuUfRdRzalPZlqUvR1akNmacPRqDmygZK1PDOpV
gZK0LplSvP8ALp5ZhlFo6/Kp5ZhqQWQjI9Izc2gq1CSfwzcoK5U6fdF2NI+YdY4s+JyHNK1nc7/0
xy2owcnnWTodZ6b/AFEJXWbM85Q7uDWUXhJhnx9M4tTuszdE8z0XnfdjFt3PTUpKUV8tEbg9IiyB
PeAoa/giiGwErwNgQgyEsU0YVVvgjQSRdi6FOJEsjXErtwIAsQZ2k7TTPZVimhvbgpxK0D+CWwH2
l2IF29F9odgTPoHRdyS2UQXcMVctMBhVwSWCCuS5TBuAQNyXRTZQMmLctlyeRMns0yK90BN3RSYE
3hlYLlsxcqp2JteDVOSjFtnnutc5UoSs0m7os9ZcvrfUZOM4xdjzfA4E+fzYJQclfLSNE6kuXX7V
ltn1T6D+nkuOqk4K7ysGkO+m+gQ41ChLss1l49HpKtPFrYR1qtBUuNaKtZHLm3dk9Z0lUvRBmSBd
flZGzh0+6SMaWDo9P2jq5x6Lp9NKKOjHCMXDdoo0d2Q68WmODZxVdnPpttnS4kXgxXo4uhRwzVF3
E0EaoI53WugxRopi7WGRMeC7YLLIQJkCHJYAaAkdhxAirDoLWAsHBYNFNC6a0PgiAooNEjEOKNdK
GUFKNrb2eU69x1DkXirWZ7BI43X+N3x70t5MLJjN0TkNxUfg9PQyl+jwvTqzo11G9snt+DUU6Sd/
AahzjkuCDaLig38FFYWCJWDiiKIQKjcLtDSwEogL7QXEfYlgMzjgW16NMkKccgIsSw7tA7V8AKay
U1hjnEFxClWAcb+BzQLQZpDiLkvRoaAlEIQo+i+0b2lWQQpxIoju1EUUAvtJ2+xnai+1WDJXaRLQ
ztyTsY8T0NilHOhkYMKMC6sLUdDIxwg402OhT1gAIQHRgHCFh0YYK0GnAdTiXGIyKDPgorASJEKx
BaKJchRBchgt6CLRIlJBomIOIqpG+hsQrYCsDoxu3Jfs8d9X0qMaMrQWb5PdciNqbfo+dfVtbvl9
vZueMvndPiOfMtBWuz6z9J8b+k4MYzVm8njuhcD7vMTa83PoVOm6dNWWLGgfLn3YTvYxpZGSu3ku
EQ13R0Y6N1GOUIow0baUMo5rjTRjg30I6MtGOjfQjoJYdCI6MSQiOjHATwFgHHY/t/gqUQMclgXJ
GqUciZRL9RlmjNUjs2zXozzWzQxVImWpHDwdCaRlqpWZpHE5ccnOqr0dnlR2cutHLAxOORkYqxbW
SwzgZ8eNRO62jyn1N0hUr1IXate6R7KGicihGvScGk1Z7KY+d9H5v9POMJX3bJ9D6dVVWjGSd8Hz
7rXBnxeTKUYNK7aaO19MdXhC1Os7eEQewqLJIOxUakasU4u6LjH5DQ47QyIEVgZFEQSyWkRR9hKJ
hpIq4SiFCISiQA4/wV2/I7tKUQFdvsvtG9pHDBtCVEvtGqJO0rXwntKsG0C0RnS7AsNoGxnxS2n5
IXJbBaIiyEAewCuTufyAyXCjuDdAtkuEFcpvBVwWwKkxUrhO5CzpCXgVNuzG1JKKu3YwcjmQinaS
X7ZuOdYuqc1UYtN2djwvVeXLkSl2t2Z1/qOrKr/+p3fmxzOF0ypKKlO2SxnG76Q4Dr8uEpq6ufff
p/iqhxYK1kkfL/pPhKnVhjR9f4NoceK9I0xfQ8zMX8HGlHLOxzJfg2ceT2APaiEIGX5TjFnR4UWr
C6dJNnR41O1sHTokrqcWX4obGX5oVRjaI2lC8r+zLrwjfQSbR1ePD/Y5XH2vR2eL/ajFrtG3jrHs
0RM9Jj4+DNaGg4lf+y4+TGkq0iWLIRQMGwbKAFLIyAKQ2CCw2msI0U1oVTWjRBEWGJFpEig0RtSF
cukqtGUbXdh9iktrwFeD5lN0OQ/Fmej6FyfuRSbyZ+v8Lc4q98nP6HyXSrqMsK9gj3UBiQnjyU4K
S+DRBBv4KKDUS4oJLIRSj7CSLSDsGdLaBsNaBsFhUkA4+h9gWgpKiV27wOUcgyj7AztFWGtA2AU1
gW0PawA16AS0A0OsC0ApRC7RnaTtDJfaC4ju0naEK7SKLsN7S1EBSQXaNUPRah6ClKIcYaGKIcYg
DCAyMQojIoqKjEZFEUQ4oAooNIoJFYRFrRT0yyeCm8kRZVyto9ASD8APQYUgl4BWwo7RENiMgri4
hRlZF+KHl/hx5u/hnyrrdSXI50ksq9j6J1rlqHFqRvZ2aPnHH/1uo2s3d30ImO99NdMl/e0ekrR7
IqNvA3pHH+3xk7WvYLlQVzcHMcLsZTpjexZH0oaDUSjT0aows0XSho1wp3awYPF8eGjfRjrAmnG3
g10Y6CadTiPjHBVOI+MQhfaDOI/twDOOAMc4iJo2ziZ5xAwVUZ5mussMyTKxWep5M0/JpqaZmmsP
BtXO5K2cuuss63IWzl11sDHJlXJPYJUOT0Pg8bMsWNhIyhHUuDDlUndflY+d9U4lbp3Kckmop7Pq
EWYeq9Pp8uk1KKbtgeq879P9c/thUljWT2lCrGrTUou90fLuo8OfT6/4ppXwzvfTHWG7Qqu3gfR7
Zeh1NYE8WpGrFOLRqSsyk9WkEkSIaWA0uK0GolRDWzHgpRLUSy0iAbEsMSJY3GaW44KsMtgG2CtE
tegGtjmsASiSphLVwfA1xBcbGDwprAuQ1oVIKDIMggZ+Qgb4KuC36KbwEH3Fd2BdynIGjlNK4Knc
VUndFU8eAmnr/AE5qKd2Z+RyPtxabsjy/XutfbpuMJ2aTWGU1p+perx4tJfbd3ezVzxkupVeZUau
7P4Zjr163LlebbTfk7vROnLuhJwxtmownTuPVqSXfFuK8s71LhRpwWNaNVChGFu1WGSXg2jsfTFO
9VNLCPpPGV6MfFkeJ+lONp22e5ox7KaS+BrFmMvLvZ5OY9nS5j2c15ZXNLEByQNvzRx0nY6vGpp2
OTxXo6/Gf4o6NtUvwjgPiy/7iqmUiUdnPl41HX48e5o63HVkjl8DSOxRWEZdI0Ux0REB0GZvanRV
w0LgxkEZxYsgaRLEUtrJXaMsVZBqeASaG0wbIKIGmGkaaZnpjqZCGRYQEF+QxWI3oiEKQNByKUat
NxavdHj+qUZcWs5UlZ3Pa7Vjk9Y6fHkQfarO3gIL6e5cq/HpuTzbKO/TkfPuj8yXB5H2nJuN7Ht+
LV74p/OQ1HRg7oZFGalJ4NMMgo0sFvwUiXCoymi7g3AraIRYJ5AqwLQb0yAJcQXHA5gMJpTjjQtx
HgtBSe0HtH9pO0BHbknaO7Qe0Ml9oUYh2CisBC1AtQyNsXFBQKBaiMsSwAKAXaRBxAqMQ4ou2Akg
IlkJFLYaCIi0ymymysiuS4NyXGi29FXBv7KUg12O5Gri3LBFIuxnDEshIGLwFcmpg0Lr1Y0oNydi
d1jhde5qp0ppPwN1uOL9Q86VScoU3dN+AvpXgKdf7tRY9nM4jfI5HznZ7LgUlRSsrXSDNdSD+3Fx
jpaM1V9zCdTCsysP9nQwuMDTSjq6AhE1Uo4MNGUYGuEcAUIaN1KkmGaGnTd0zVTg7IZTpK2jRClg
MpSgPUMaChDGBkYhSu0XJYNDiJmvREZ5oz1I7NUoiKiKOfXWzJUWzoVI5ZlqxQSsFRbM8lhmyotm
Wp5A5/IW8HK5KyzsV47OXyY4Z0Ry6mwLhVcXEXDJqf8AsMixCeA1LAwaoSyh8ZJowwkPhIKydW6b
T5lCS7VfwzwnI4Ffgcl9qajfZ9Mi/wDAnm8Cny6drJvwwPNdC6w6UlGq8aPa8SvHkU1KDTR896r0
qtx6j+2na+LE6P1qt06uqde/Y/nQI+lqLsHFYOfwOq0eTTTjOOvk6VK00nF3QbXFaGIpRC7XYiIt
ERWi0AyOirpeAUyXM7ierbBbRPAJtO4gLCBZKsA0Cw5f+AGYUmQqSGsCegFNCp+bDGyvJUZ2A3gb
U82Eyj7Iz6q5T0DKVr5M1flQpp90ksANcop/k7IRW5tKnF/ksHA6p12nBOMGmzzPI6pWryaim73w
gy7fWuttycIST/R5irTq8qo5WcvLsdHp3Tp8tudSLTvpnquldLp0E5did/DNs1wOl9JcqUXUhbN1
c9Lx6EaVNRSSsaZxSwkkl8AGmdUsFLMl7YLeQYN/cX7/APINfQvpeCVGOM2PS3tB+jgfTS/0Iv0d
qvOyZS3WPlzWbmByj8g9VrOMfxZyf6id95CY6/dH5Icr+onYhUfn7jLCOxxl+KOVx42OvxV+KNNz
Tqi/FBUI3YU44RfHX5EvjcdXgwskdakc3i4SOhS8GHSHx2NjcVAfBBTIXHQFx2g4EJ0ciMFOwTJ6
oGXYphGBVi1hlf8AssKdTY+DM8MWHweSNnQ2OEReRiZKoykV+i4hPBIZ9pSgwIxNFOIO3keudL+2
vu0VZp3dg+gdU/NUqzysK56Xncb7tGUbXbR4PqXCr8LkOdrK+Ggr6Rx5RnFNZuaIqx4/6b6upWp1
ZZ0j2NJ98U1q1wogQ+0poJFixgphpZCEAp6ZCPTBAmygki7ABYGURpLAJsyWY6xVgE2JYY45K7fk
MlqIajgPtLSwACXotRwM7SrABYlg2QALFxQVmUsAEWmD8BIIv9BAJl3AK4DZGyrlrMFcG5CmyNI2
VcFsru9hUlIuMhcpF938hg7uwWmJUgKlVRi82DSc3kKjTbvY8V1nlPkVHCDu27G3rnUG04J5MHR+
K6/LhOorq9wN/QenypWnNe8nou61ilGMYpRVkimWAoyH03e2DLo00dlGqmjXSWjNSV7G2jHRBoor
RvoLRloQ0b6EHgMtNNGimsIXTiaaccFQUUWElgsgXsXKOx1gWrhGWUfRmmtm2ayZqiwyjDUWzJUR
uqLZjqecAYqq3gyVEbqqwzHU8hGGvHZzeRHZ1ay2c/kxwwjhchWbMkmb+THZzp+TpEGn7CvgXHRf
8BOjYMfTlgyxH03oK0d2DTQlpGOJpo+BQXMoRrRSaTPPdQ6JGpdqKbWj08XcNQhJfkgT186+3V4F
R9jaS/wdzov1FKnJU6jv4O7zelUOQn+Kv8nA5f039u9Sgsht67i9TpV7Wkrm+ElJKzTPln3eVwpv
uU12nT4H1NKm1GrdLzcD6C1kiOHwPqDi1ku6qk/bR1afNoVEnGad/ZEw9gthwlGSw0U4r5uYMoL3
Kcg3EFm9TFXKvghVweKkxUhoLMqULkNlZeRE6lOO5JBANP4AcW9CuRzqULr7kV/JyuZ12hxotyqJ
t6syI61X8E29Iw1+XCN8rB5bmfVDldQfdF+Dg8jrfK5Df2o4eCpXq+o9WjTv2tNo8xzepVuTdRv/
AAL4XE5XMm3UTSdnY7/B6MqdnNX9AeVpdL5HLqZ7l7PSdI+nv6eSnUfdjTPR0ONSgl2wSY2VorDN
Ri2MsKEKa/GKX6GqXbG2gZSAbNMpN3uAiNkTCUqp+K2M4lOVapBRV8ieRrCPQfSnD+6oSkvP/gM+
PX9BpSpcePcrYN3KluwylT+1TSSxYRXeyjjdSf4r9nMSOh1R4S9nO7g1B4IL7iDWsj4VSeTp8WWE
c+FJ3Ru40WrBqOlTXch1Om76F8eLwdGhDGg1IZQVkjbSehEIYQ+CMujRDezRDwZabyjTB6CHx8DU
xMRsfJm+KMrJaLMirFgsiAIiRC0FFEdTEwQ6JFOgOQmAcSNGIOIuIyIWGxWh1PH6FQHwXoNDSujj
9e6d/U0W1tHajgOUFNNNbA+WL7vTuVe2Ln0L6e6lT5NCCbzYwda6NGvFtKz+TzHEr1OmcrtldJOw
H1RRTV1kCUTk9G6vDkwSbsztYlG6eAjO0Cxk0AFBYp7GAsM6ohCJXDQlopkSwXYJ9CQKwMgVRLkI
FVsIopBgRaKItAQhCBUIWygIUWC9gUFopBAUiykUwLIVcFsMRbZVwe4psrSTYFySeRU5AW5DI6Mz
bfkn3O1bIHzqqCbbtY831fqv5dkHhPwX1zqsaNJwi1do8nSqT5FZ7bbDLo1HPlVkkr3PUdL4qo0Y
4zYzdE4EYUlOosvOTtJK2FYCNg+QrFqIaSKuaaURcImmlHRRooLKN9COjHRRvoLQG2hHR0KMdGOg
tG6igw004jorAunocBCEKeEQUypF3uDJ7KhU2ZqmDRPRmqsDNUWWZKiNc/JmqbCMVVYMc0bapklt
lGSpHDMdendM6E8pmaqgPP8AOp2OPVVpM9D1GOdHD5Ect2Ns0iLCiAHHSKkEhtJsSNpbA0xNFNrB
lix1N6CtkHgO5ng8oag1IbFhRyvkBIJbIrL1Dp9PmW7ksKyPO8/6X7k3FZ9HsYyQas9oy1Hybm/T
vMoSbpSmv0wOL1Hm9K/06rk83Vz6xOnCSzBP9o5fUOhcfnNNwinZoNPLcT6xnTilK1zZS+tU1myG
1voujd2RirfSEUn24ZGa6dH6zpSv3NKxa+sOM790kmeZ5H0lWjfscjBV+lOQ3/fJBh7X/wCX8X/r
RP8A5bxf+tHh19Kcn/rkX/8AFOT/ANcjfwe0n9Xca2JoRP6w4/iSPKU/pTkN5nKw+l9IVL/lKVij
rcz62pQXanlnneofVdatN/a7rP4OxT+jqbacndr5OrxfpXjQS74ptegPnVTnc7lSdnNXNHD6dzeQ
/wAu9r3c+m0uh8Wna1OP+DXDhUqa/GCX6A8LwvpypKL701+zq8P6ep0rdy0eoUFHSKb2Ga5tDgwo
/wBqQ6UUlofJ3uJqaDBQqoxvnQmfkMbpVyiMhQPkpBgoBVR3ko/J7z6ToL+njZWaPEU6XfyIfs+l
/TnHVHixdtoM12JWjG3o53Kll2N1WSyczkyyyp64vUE5VHjwZI0zo8hKTbM/bYLClQuiDLteCBXw
WPddD6cpIpRfwXZldM7dLg1G2k3c7/Gj+H7PNcJv7iR6rjR/04/ojcWhkA1Tyyu2xhsUNmiDwjNA
0QeEBppyHQYimMgUaF4IgYhI5+JoWiJBPZQVVgkT/wBloL6OPgbDYr4DgRTYvI2OhURkSNmRGRAj
oOIPh8B8P/Jnh4NVMNGRGwwKiGtIBlaMZx0eT+oekqr3Tgs7werWvRU6Uaiaavf5CPmPDr1eDyFG
TaSZ7vovVY16ajJq5y+u9GU0501lfB5ilXrcCtbKSYPX1OUk1fYmTPO9H639+0Zz/wAnoYtTinFp
prwFxO4q9yYLBVIYLWC0/kCwiEDOoA/H7CuDLQVQJf7LsE1CyFAWWgUggiiBWJYKplXJ8kAlwXlh
ECBQRTdkBcBgDYNyrgS+Sm8AuRTkUS+Su4Hu9XAcrICTkJcmG2hUpLOSMmKS/RyOtdRjxoNJrusD
1LqEaMWk8njubWq83kYu0ytF161Tm1nltt4PQfT/AE/7bU6iuxfSOmqKUprPs79KKjZRwQbqbsrR
VkkNi2JpIfEKOKGRiDFaGxQQUImmnHQumjTTiUOoxybqEdGejE20Y6A1UVo30lhGSj4N1PSA0Q0E
ngWngtSwGDGyrgORTkAbYuciOQqUsAVOWDNUl7DnIzVJBAzlsy1JZCqS2IkwhVXJlmss0TeXkROW
wM8xMx05XEyZWdYeXS7k35SODy6W8HpqiUtnL5lHeNm09eZk7NoOEkx3MgoPRhcs4Cta0Mp7M8Hh
Doi9HTUg4XApjoJFaMhc0U9IREbAzasaERARYVyaqw1J/IBSYgfdWKTsAmTuzs0m0xyuhX7Lvkpv
Jg9U4xfgF0ofCCRAgFSh8In2YfCGlXKFulBeEDKMbYQyTQu5pCrL4CTwR+QWVBdwEpYLAemFBJi5
sKQqT2GfgZMXJlyf+wEngOd7C3cTU0w5MW2Uswp+yXLYLKz2hS2WSJFa+mUvvcuC8Jn03iU/tcSn
FbSPBfS9Hv5SdsXPocl2xSXwVmk1J2VjnV3dvyaqsssyz8sJGScdiu30OqMWpDFUqaIHcgxXwO5e
bPyzR9v0FTpXksE16PynAi3UTseu4kbwX6OVweOsYO7xadopJGdxqQUYgSRqdMTJbMtZ0T2hQLeG
VDAYPpvOx8GZoDoM0NEXoNMVAZAzQTKI9EIq/wD2FEH/ANhwCrWxsUAtoOJFHHwNsLj4GitDjoKL
Aj4DiRYfF6NFN6M0fA2GGGmqLCTFwYd7gMTC7gVoryEE4qafdm5xOr9Dp8iDlBJOx2osK9wk9fKO
dxK3T+Q7uSSeGjs9E679tKNSo2tZPW8/ptLl37ops8b1rok6HdKjB4zgNvZ8Xl0+RBShNNvwbIpW
XyfLem9Zq8CbhUUrXtf4PZdL6/Srxjd5YS9u+/JBUKsai7ou6YyLDODQQFyXDQwHol//AOWI/wDY
IhCECYgK2EQCXLRRaAIhVyXAplF+SgIU2WLbApvJVymygL8AtlgMICTJcGRSdigmC1+NypVEk77R
jrc+FKjJt5IJyaypK7Zw+f1B2k4tpeBHL6jKrrKbtYxRpTrt+F8FGOcqvJqtO7VzudK6aoRUpLIz
hcGNNJtZOpD8Y2QEUFGyWA4rICd2OggG0pW9miGbYEwhk2UaeEMZFTiOjHOgoUxihnQaFTWjXSj6
FUoejXSiA2nHBrorQmnHBqpR0GY0Uka4LCM0EaIvRCnEWhfcifcLEG5AOXsVOoKlMNnudhM6gmdT
GxMp+wwZOoZ6lTYE6mTPUqAHKeRM57yLlUyxM6hUHOZnnIGUxUphElIByFynkByYQxu4qtC6DjIP
ARwOocZzi8aOBOHbNr4Z7etTUk8XweY6lx3TquywbX4yU9D4/wDgRHHgdAejRT8Gin4M8No0Q2hG
j46DjcCOhkdIzVGi0yiIiCRZS0RlgtMhX+SXNotMlwbkuYUVyrlXLuO4i7lMl0C5E9KqTBuRsW5b
wGPVt+wWXcFu5WkuQG4LZtAzYmTDlITJgBJ2AkySYDeSuamxcnktyBeys1UtMotgWII9A5xb5sXJ
4Y7psfu8hRauUe1+k+KoQU5LLyekrytNq+LHP6LT7ePGy0jZyP7s7sIzWW3dfHmwuvHtgzVCKs8b
Ectfg/QRyK0rXEqp7JynaRn7grUqvshlUiBXyW2dDaatYc6avoHss1b5D2Ox09dyVjs8am7aMHRa
V4q6O/Sp2OfI8hP28GarTs3g6biZq0dk7PXNlG3gFbQ+pEVb0RPoojoeBUBscG0Nj4GxeBMWMTwK
DIRMtGSerSyMWha2MWiKuKyNiLgNRG1rYUQUFEMjT0MiBHwHEjcOhodARF+hkWGj4sZGVxEXqwxM
B0WH4YqIcQJf2XcjRSyAUW1kXWpRqxd1e6sEsFp3DOvJ9Z6BCqm6aszxtejyum1mo91ovxc+uSin
4OVz+lU+R3PtT/gNvJ9B+pJRl2ch4WrnsuF1GhyYrtmr/s8T1b6fdOTlRTTOLT5HM6fUypJJ/IH1
6EoyTsw0rng+mfVSso1VZrFz1HA6xx61r1YpvIR1u0ryXCrSmrxmmithFFfwHYFoKF6KT9FyBsGF
p5GIWthxCisUECwKKbyWUEQFou5LhkLSBt8B4ZLoNEu6AkOk4/NjHX5FOF/yQFtpGevyI0/OTnc3
qkIJ2Z5/ldRqVqr7HdNWA7HO6ko37XdnDrV6nJnbNmVQ49WtLLujrcThdtu5ZKMfF4Lk05I6VLjR
hayyjVGmorCCSDOhhGyRbYXgHywi4j6UhCG0QrdRjlG+hHRjoLWDqUY4QBwgNhTLjEfTiQVTpmmn
D0SER9OJWhU46NdJCYIanYjPhqaRHITKaTAlVB60KZO/Bk+6V932BolNW2KlUXyZ51fYmVQNVodR
fImdQRKoJnU9lYOqVPZmnUFVKu8madb2A+dQROrsROr7ETq+yl1olV3kW6nsyyq+xcqpWK1OaJ3K
xk+4RVHYiNimkWqpi7wlP2MGqVTBk5FKNVO6uxncrbKuslzBwORR7JvBVNaNfOV2ZoI21DY+B0PA
pLI2mA6IyIuIyCMLo/5LRVi0iJ6JFlJFhL6FsF+i/knkKFsl2WUUEim9lRI/JALdik8EkD4N/E9W
37AbKlIFswCT2WDcFyOiLYqcssty2Kk8BNDKQuTKchcpBhUmLbyRyyC3gqXxJMq5TZX8lRZCEZC9
F1P7Wdb6X433a6bXk5M368nq/pSmo2a8srNe34tFU6SS8ITWzJj4ztBfoRLLCfQpfiZeW7RZstgw
86X4sDicj85MR9s0S2ykgEdr+SGjtIUfLGFTj3TS+WV2sbRl9uadsJmX0Xo+mxUIxSWTrwWDjdMr
KbWdncSwjnainoz1VdD35yLlEzp5GGrEzNWbOhViZJxKxS4hRKSsRGp4hsMjUJiMTNBsQ0BBjFkx
okUMjoGIUSGiiHEGPgtEa3oxBRAXgOIDIhICIS2GobFhxYqIaZF+GwbHRkxEWMiwafGWhsWjPF4W
RiYU7uRSYCZaYUT/AMsgNygLUi+70CwZYCaGrShVupRucrndFpVk8I6vcWpILrxHP+mGk3TVn6OH
Pi8zgyv2yaXk+q2UloxcvgU6yd4oD53S+oeTQajJTTPSdM+q6bhBVP7rZZXUPp2M7uEVc83yfpbl
xk50m0vgD6Fx+t0KqT74pfs3UuZRqanH/J8jfC6hxnaSnj4uNo8rmUJJtzX7uB9bU4SeGmRo+dcb
6i5FFJSePZ1KH1Z3JKTQZx7GMchpHl6f1NTxeRpp/UlB7auDHf0VfBxf+P8AHl/zIOPWeJbM3f0w
jqsljlf8c4i07/sz1/qPjU07O4Hct7L/AASzJI8jW+qIOLUPPwcbl9drVJNxckvBR9BlXpRb/NY9
mSv1GhSbbmsHz3/ifJc005NkdPm8l5ckiD0PUvqOEZyVN61Y4PJ6tXr37FJjuL0KrUa702/LZ3uH
0KnTiu9JsDyVCHK5EvyjKx3+m9IXanUWfZ6Gjw6dFfjFYDf+CjDT4kKWkkG1YdPAp7GAGWWwfLDK
AfJb8gMAr2H0FdmU2cRZQHV4kNXOnTWjn8fFkdOjHCHrR9OI+EQKaQ2OCKNIbBiU8FqQGqMipVFn
JmcxUqj+Qh9Sp7FSqq2zNUq+zM62dgbXV9gut7MLrewHW9hW2Vb2LdbOzDOt7FOv7A3yrexFSt7M
cq3sU6vsI0zq42ZqlQTKr7FTqbAZOpjYidTLyKnVt5M86udm52506VQB1TNKoA6hpi9tn3SvvezH
9wn3LgbfvE++c+VW3kH+oQZsdJ1n8jaVZ2ycqPIuzTCphZC4ZyncRBFylcuCwVqDihsEDCI2CDQo
xuNiiQiNijFRVsESCCsQ8BYgYPksAMryMYu2R4Kl4AYxlE9FLwSTvcHQN38lwXIGWiXKZtC2UGLb
IiN2QtyJJi2wi3KwuciNipyLjIZSFylkpyywJSZWUbBcgWyrlS0V7kQKZdwDvclwU8EQT1HTc5K3
yew+moOEFjyjzHDjeej2PQ4pU0B6CLvElrFU4vHgc4/yEKlo5fOlho6VV2icnmSwwOe9kTKf9xLA
xd/RAbeiFMfOregKi/F4NXZ6BlTw7rBjXu/TR0N5X5XyenpywjzXTYKnLCwd2jLBjksutF8AykRP
RUzHi0uauZZrJpYmayX1ikWKX6CaKL4ytBICISwbDYPI2LEQGxZg+nR0EgEFHaCGL/yWikWtkUaC
iwUWgGoJC4sOJGhxCiCEg0ZEZF2FRYaYDosOLERYyLwGjVvdi0haYUWFMQQCZEwDBZdwGEDJFBvQ
LQVE7F91wSANj2tZC7YNaVhVy4v2ANXiUaizCL/g5/I6Px6qf4L/AAdPusRS+UGdeX5P0zTkn269
HKrfSTu3CUke/TVyNr4QV8xl9NcyLfa214E1Pp7n3uptX9H1SLhbMUDL7f8A0oD5Yug9Rj/zv/Ba
6L1H/rf+D6io03/yovspf9K/wD18wXR+etybBpdB5laVpSdrn0906X/QiKnTWopfoM9Pn/G+mKqf
5yZ04/T8IxSkm3+j11op6QMrfCDTzfH6HTjJO2vlHRpcKEbXSOg2vgXN/ARIU4x0gu1AqTsVfYnq
BlrQmS2OkxUixkiSFtZHSQtoqAsAxjwCyVaEVP8AYx6EzCKT/I38LLRz4bOj0/aDcdejtHSovCOZ
TaUjXCeCq6NOQxS9nOjW9hffSImVucvYKq28mN118ip118kJK3Tq42Z51t5Msq6tsyzr5eQZWurX
VtmKpXy7MzVaxndQGVu+8/kn3sbMKmT7hcGuVX2KdQzuoA5sg0SqexbqCJTAcwHTqbyJnUAlUQiV
TBZGRzngS5ewJTFSnY6fGaOUhUpAyngTKoyud6P7vYEq6innRh5HMjSi7tI811LrMk2oOwHpK/Oi
m/yFw5sGt4PDf11WrP8AudmdDiVpYu2yK9nR5ClazOjRqYR57hSukztUL2X6KNqd2OprQins10o6
Cz0yKGwRUIjYoNDgsBoqKwRbJgYQhDP0VbIAflgfJrwWwGGgGZqVTKCuCQCwQmA9HRmqv6KZdwG9
gCxb8huQtsAJC2w28AMqYBiZvDHSEz0wyS3sBhPbAbDPgWD4CK8FYvayA3LvcHxdy0yi1kjTd05X
qHt+i0rU07Hjui03PkJWwfQOn0u2ksWwUa4r0HLTLjHBckIzWOt/7OPym7v4OvysJnJ5GWBitkKw
disBQ2IFggHiVTQE6K+DT2tEUbo5bXsBxoKLR0KWEY4K0kaoPBm9t8I0KRJMWngjkRauTwJk7hN3
AkGQS0xbGNYFvZphCJ5KZFs2h0RkNio6Gx2YDYjIiojIgMLTwUSOiEHH/sEgVgJAHHY1CYvI5BUQ
SfsFBCqKIcWLjoJMjRsQk/4FxYSYU1MJCosNSAYmFcWmWmAdwhZLgMB8EuDcCyFEAtFoEMCkECi/
IAt2KuE0SwT6FMtIuxEBTKuWwWwL7ge5lfyRFjK1LBL/AAUl7LTLcaUwGgimZAFMJoBl0VLyLYyQ
D2CgkKY9iWtlCpgMbLQsgHwJqMc0KkrhmAhs38J2sYoxNHHl2yQrTrxl+Wx8amNnOVTOxqq2RGm3
7lhc69vJknXstGDlczti82YHUlyUtuwmXUKSv3SSPHdS6vKndXZ5HqH1FVVVqMnYEfT+X1mlTlZT
TVr7ObU+oaXc1dY9nybl9a5E6ram7fsxS6lyG7qTz7Cvsi69x27d6v8As1Ueo0qupx/yfDv+JVlK
7m7/ALNnH63XhJJTdv2DH26FWL1JP9BSkvk+adL6/VTXfN20eq4nV1VSu7hLHf7inIzUqylBO+y/
uhDXLAtyBc7ipSwGbcFKQqUsAOQEpeysLchcpFORIx7jQBvBh5nJVJPKTNPLn9mGX4PHdd5921GW
TbFZer9SlKo0njJxHKdSTbbaYMnKpNuTua6FFtLARp4NBSabwdji8XJzePCcWrI7XD7sXQV1OJHs
ilc7fGV0jjUPB3OEvxX6GI10om6itGelE2Uo4DQ1HAcVgtRwWgq1hIIWHDyZvir0QhDIvwCVJ5Kb
NTxEkLkEwJFL4Fg3yEwRERvKBbIymVFAy0yMFsAGAw5MBsngGQsJsBvBUCxM9MY/YuWmaYpMgGg/
JTdkwyXrQDeQpvAu+Qiy4g3CQBIbBXFIdSegr0f01RTne2T3NCPbBfo8f9Lx/L9ntKS/FF+Mi8FP
RPJJaIMHKzc5laOzqV9sxVY7AwOPonb6HSWQHYAO30QLBAPGXJFlkOD3pHY1MSthKQpx6MvnZO4W
pWZHIi0fd/JGxPdYvvXyPE6MYD2RSVtlNmnOqZIkX+5P4L8Q2AyLERdhkWRWiLGRM8ZZHRAagkDE
lxmng/IaFrwEvJFHEYncTEZEA0y1sGJaAYngtMFImiKNPIakJTDiGjYsOLFLQaCmJhdwpMu7AYmW
2KTGICXZEVkgDUUBfBabAIK4u5EwDRdwLlXANstMC5dwDKQNyJgExcgrkCegtYuxLlNhnO13KRV/
RXdnQWTDBTL7sFXwGkegHsJgMCpAPY0XIICQtrIwlihMoi3E0WyV2XAzWBcWa/tr4J9tWDLGkXaz
Gyja4t+iNGRkF34EXsTuYXR1p/js4/UKjSeTfOV9s5PPTlN2fgNTK831ZOV/0eU5VB9zbTfs9fza
DlJ7OPy+NdaCvLVKb79E+3jR1f6Nybxozz40k3dXBjn/AGLu4cONJyTSNcaElbA2VOSqRsnpBcbe
ncObpu6zbB3Ond8Uk8NYMPAi7LasdijDF9MGdOtxa7UUrm2FW5xaMnFm6jUu0Vytjf3guQCYucsM
MClL2LlLIuVQX9z2VnTu5XI60YLehEp4ZyuoV3ZpMozdf6m7yhB3SR5Gf3K03dNnS5cpVJu+UwuN
x72wa9T1k4/DbV7HRo8e1sGyjQsjRCnlFxMLocdYwdCjS7VoGnG1jRC4xPDaEco7nCX4ryceiso7
XB2h8PXTpQwa6cbITS0jRAqz0TwgX+gyrEaAHDyWD+jN8UVyXAIZBS8i/ATAeyxMWwWECzSUItht
lXVjLPpbBbyHNipM2qeBcmXKQqUgmrcgHLZV8C5SwGLRNi2wJN3AcvZU0bfsXJ4fsFv2A2VLUbyB
JkegW8BFSF/JbYNwLQyAobTYDEhtKOULijVx0m0vYSvV/T0OxQdsNHraMl2o890Sj/pL0jvUcWBh
zWxc3hht4FTeGE8Y6zyzHWeH6NdR7MPIdkwpEpXbBYiVazdyf1C+UENIK++iBXkrkuZ+6RFNnB7N
aLguXsT9zJfcvkG4cpK2yN+xLatgilbyJG/0ucreRXc15uK5VZU4t7ObW6lCnHOzc4uVrrOtbyOo
1e7FzyPI62lax2Oi86HIinfJrMZtdyOwioq6QdsEvTUCg4g2CiZoOI+mIih9MYp0CMqGwrGfBFsN
eQIoOKBFxDiCkEtBRxLRSLQBrRZVyyNoXFlE+QDixlxKeA0wCQSYtMJMHo0wri0EnZBR3ZSbKQQF
3CuBEl0AdwSroq4BXwQDuJf4ANMikLbJ3AM7sF9wly9ld2AH936J3P0I7gu4AnIpyAcimwDuC2Dc
gBXJcEMCrlkIBAHsMqwiFNESDS9hdpWS7ZLSCUQ1EjQO0naN7SKIVlnD0Zpx9HSnDBlqQ2BhlgXJ
j5wYucQwzVDBX/vePB0ZxMdaH5B04ubVppvRz+Vxbp2R3JQwInSutBt52PF3gTLg3bxg9GqC+AXQ
XwB5yXCUfAL4sXZtHfrcfGjO+P8Ag7rNwMVCko2sjdT0Lp0nF2tgd22BfFxaTNFGWVkyaYdOVrFc
b660ZJoTUl7Ewq42BOdwyuUhcpAuXsXJ4Kx9HUqWjs5XIfc3dmurJtGVpN5N+HxgdGLnofSoqNrD
/sq9/IyELPZona4RshsYlwiNjHAVIRHQiVCI6EQzR0lo6fEqWaMFOOjXQ/uQR26FQ1wkc+ho103+
IWetKlcITFh9xGhIFkcirmb4DID7CMgWA9hSBfkKj0LYTeAJPZtnkG+GU2C2U2YZVNi2/Zc2LbOh
VN+xcmFJipPIYVfYEn7LvsXJkZoZP2Ay5MFu5omYsB7LQLAFr0BLFxktC2VKBkI0CwCCgCFFCBq0
jodNipVV5yYIZR2uiUe6ssXyFe16ZBRop2zZI6ClYz8en2UkvQ1L0Vk1ywKm8MYv7RU9ERkqPJg5
Wmb6u2YeTpgcfkX8GfJvcL3BdEKw3kQ1/Z9EBjxP9ZD5AfJi/KPFLqcwZdWnHTJ+a6/6Paz5EYpW
aZS5Kts8QurVG/I+n1GU/wDmsT8tft7FcqP/AFIwdQ6pGnG0Wm7nm6vLm1if+DG5TlK7u8icV/b0
fM6reklHLa/w7HDr8qdSLV9+Rau1siptmvyx+tY6inu7Z2fpnnSoVWmr/FzDKH4tWJxv9OSaVjWY
b2+ocPkKtSjLz5ND0ed+n+UqlNK56FNWuYrfGrRa8kKiRs6AyOxMB8NnP0NiHHQuI2OiJVpZLSCI
VYFbGIWthkELiRlx8hr4u5EyykEWvYYKCDavAUSEiQWgkD5Lj5ANFplIIKq/stMgKANPAVwSXCCu
A2XcDYUV0S6ICwgZSJ3einosKpyKTCBQIu5LlaKBRJlEyRbCImHEoiAYREKQBFELCqsVYtWCUQgE
g4rASiGohnQJZCUQlHIcYgAohRiMjEJRC7SnEz1Kd7m5xwJnHYVzJ08mecDozhliZU/QHMnTwZal
PJ16lPBlqU86uGpY5kqYp0zpSpiZU8hrdYftlOn6N/2wXTCsLo32hFXi93mx1ftgSp/wBylxPYiv
RlTR2vtgVKPdFpq4OTzrJc3cniOKbSMEoy8FjmdCYVzPCM1a5opp4LHOgd/ILTsx7jkpwxo3GPjL
KN7iHSdze4egXA0esai0Npw9Dvt50HTgFBCA2nAYqYyEbeAyGMB0YYLjEdGIRVOBpo08r4BpxyjX
T8AaaMTStCqXgcgqRkMUvYoG5i9NNN8bKixEZexkZeyrfDSA92CkzLK5MFstv/YC+QnYZN3YtvOw
5Cmaip4BbwW2UGQSYthTYt6DIWxUmNYpo0n0DYthtAMAWVctlX2E7UwWW9lMM9qeirBEKpUkB5GP
QBPiKQwBDIGvifTKSd0el+nLqok0rfJweNC8ke06Fw12qTxgivQUspfFg2SK7Y2RYSqQNRYC8YF1
ZWi2wwxVZZZi5GUzRUl3SZnrtRWWGmZR2WogOvCPlFf1MPlAN7CCv6mHyQD86ZK7bl39kv7Ovhq1
D8dFRTTGQl4DhFNozISpTi3bY9RstBQjZFsuYsoVHZTuv0FJgKXomNCvjJVk7lJ40XEF6jodH5f2
KyUnZNnueHyFVppp3uj5o3aSa3c9f9PcrupxjJ5MVrhXpkyJg05XQZl20yA2AiPgbHZPg0Q2NjoT
DSGx8GMBrZaRZS0Fi7FgDEsEVGSJAgLKRS0WghhASeRVk1aCBRaJ634sOOmARfsBqJ5Fp3DWmCDJ
/wCyECrICtBAQosAIIFhEClPRZGrESAgKCt7KSAshZAaBEGIn8A1RUQreiIJ6IpFkQVFou1y0ErA
UkMjEpIYgzfFJBxigYoZFfyGUUQ4xLihiWC4gVHASj8hRWC2higaFySGNANBtlnDIEoGiSAawBln
TM06XwjoOIuUSLHNlRfwJdLOjpygKlTC4w/b9Afb9G1w9A9gaxkdP0C6fo29gEohZGP7fov7Xoe4
guISzWOpQ7lq5z+Rw0m2kkztqOBVSmmtFjLgviv4DhxnbR1/tK2gVTS8Fjnlrl/02dFvjY0dJ08l
xp4OkT8uNUouPgU6T+DuSop+LinRWcFZxx/tv4DhTa8HSdFZFShbQTxmUfQyMM6CURkUAMIhwiRB
QDmOCyjRBGdM1UvysGvWmnr+R8dCoKxogsEUElryA1s0ONwJInq70SRMNr2VYz2akZW8hKQrRFI0
HOQNxbkS5SivkCeLk7gZMAW7kZHgFyCBloW9BN4AbDCm8oUw5f7g7KzS2/QDGNC5MJqiibTBYFMr
yWUwmhaCLAZQL0wPKG+AWE1EkHDwCFTy0Irp9LpqdVL4PfdMj2UUkvB4vodFyrxthN5Pe8amqdNf
ooemUmC2SJGL2ttJGblz/B2ZonpnP5EtoJ9JorukYOtSVKD7nZfJ0uGvybawcL6tqL7cs2Vg08/X
5d3/AKc7r9if6qp8/wC557kc/wC1J2eBH/FguPVLkVLbZDy//Fn8kBjwtn8FqLua/tIipo6+uWs8
IM0U1kOKSWi8XLGoNS8EevkouOg2GTuUlgtxyEohdCkGoYCjHI2KVtCs2s7gzodJqulWSvYQkvgO
FozTWMnPGuF6e54lTvgnfZsXjycLpPIUqaV8nbg7o53p3hq2hi2KT0GnexmeLGiA6PgzweR8X7NK
cywUEclQJAhrQFkIQCkWilktAETyQnkVqLRa9FINEaURIMEMolkOJXguIaGQhAqIspFgQB7YZVgI
QliWABoiRYQC2WWwbP4AshVn8Es/gC1oMFIIIhSLKQVaLKRYBR0GkDEKKCCSDigUhqAkYjIRKiso
bBBhFENItIJIoqKCsWlkMBDiLkvBoYqSCs7WQWhrXsFkbL7RUoj8ASQIzyiLcTRKIDiGozuIDgan
EFxDTL2//wAsU4mpxQDiBkcfQDjjRrcAHD0Bn7QHG/g09uAJR9ArLKAtxNbj6FSjjRrj6xSLEsW4
lqODoyrtAccjoxKcSMs7hgRKCNso/AmpEM2MkooAc0D2mmKWgokcSRQQa2a6HgyLZro+ARrj5NFP
wZ4eR8CKaLkgn6I0FKaBa9DGgHogW0AxguQAt4L7hcmBdFZ9NuDJgdxTYUdwW7lJgthEkBdhSBsG
Asot+SipQy0KlsaxUtsIFaZTLvsF6J8W+KK8Fg+CotAsJAsn1E8AsLwUVEGUV+SQsfxIuVVK1ywj
1XQafa4/Oz1cJYXo4HSKVoJncpvx6GrcOvcKItZQxaQxlU9GGtC7ZuauhU4bClU+2MUvJ4X66rP7
VSMXZ/J7at+Ha27LZ89+suVSm5qMru9gr51Wm72k72E93sdXhlvwxH2ytTxfcyA9nshEZP5IDcik
d3DBkQKfq5cWGoOKyMjoUg4vAaGlkZGIuLyhsf8ABO1S2QkU2U2EGR6ATGJkqt3SuQ6VRJuyuet4
tVSinfB4VNxaa2el6NylOKTeTnZrfGvQlx/YunK6QcTGOsrRBjoPIiOBsNojTVHRYEAkrmL0qtBQ
L7SRRGvoyf8AslikshFoJWKDIBSCIQLFJlrZSCDYkWiky0wiKwSKLQURCEAiLKRYEAe2GA9sAiEI
AOQiEAhCEAhCEAhCEAhEiEQBIuxSCAkQ4gx2FEA4hRfoFBRCGwHQf+RMBsNaKybENAxQ1LCCIS3s
JIiWAFsXJbHSQqZVZp/IAyYuxlpAQrFMKFoBoZ/2J2ghVimhlsFNZDYLAuI6xVgpDiA4I0NYAcQM
8oi3E0yQpoIQ0JkrmlxFyiai3xlnHAFh00CdHNUUF2lrRZgwtxEVY7NgipE3GOXjDOL+BTWTc4XE
TjsrlSNlWCcS7AA/8muhlISo4NVFWsBppodEXBYHrRFWieCkEAL0Kl5GfIE9BCmLkMYiowpcwSSI
VAMIH5CCIQhVwz4FsF4LYLMxPQtg3LbAvg0JJgNlyygQgbkYQPgIohTLKAYPgJgyAFyJHLKYUNki
COp0il3VW2r2sc1QvJfB6LolHWC+JLr0fT4OMF8HQisr4M3Gg4wSsbI6QKbAO2BcRiCJbAuSwxqM
3JqdkGwzrm9arxpcWbuk1F2R8n6xWVarP9s9d9U8+U1KOsNI+f1JylN93yI0x8iHxn9CPtv4Ns2r
vFivxK6TxkVNkNP4/JCDz2fgqz+B3aSyOuR59DBFouxEXxVxWf2H/AC3oNFFxGKWACIlWD7i0Agk
GxJBoWmEncBl1Y19Mr/arJXw2c9t30XBtNPzcwse+4lTvgmma4SPMdE5c3aMtI9DTnf2YrrOmyEv
Y6ElcyxkMg3cxY1K303gZDIiizTHx+jnW4KxFsspaCiRdgSAnQyFLRf/ALGKhCEsQikEUiw2KIRU
UXb2EWiIiIgoiEIBEWUDkAwHthEAhCEAhCEAhCEAhCEAhCEAhEQiAJBAoICR9hoWg4u4BpBxBjsb
BBBQHwFxQ+ES+goDUCohJFKgREiWDAWKnobJ2FTDU9ImBYZJAkXxQtoaURS7Y0U0xliwaUkTtyMS
LsGiu3BXaMaxsqwaKcSnEf2ldoRmcfQuVM19hU4A8YXEVONno1zhkRUjgs6GSosCGjTNCZGtYxSW
CJF2LSwGkB7O7wMhBt+TZR4/dbAY9c5wstCqlO97LJ2/6ReTPyOK0m0jUZs1w3AHtN86JnlC1zTn
hcVgfRjoWo5HUlaxEaI+A1oXHY5aCrRYKI2BTFzCcsC5MAJbM8x0mLdihMgXgKYu5GfF+SAtkv8A
JWdHcpg3wVclZtRgsu4LChYDdwmwG/gopgstssMqBI9FAUyyEABgv9BsEoBhU1kstYYRpoxTa/Z6
ro8FFQPK8ZSlUj8HrOl6Xyh6ePQRtgZFmaLdjRSWBmIfFDO0lOOFkNr2GPAaRxOvV/tUVZ5u7nZr
y7Yt+EeS69W+42r3S0CPGdar/cm23m55qUl3v94Ox1uvGlJxbSZwVLundMsaSrC+Uxbg/k1qN0T7
X/8ALGs1rZjF9t/JDb9r/wDliF/K/p5T7yKdZGO7+Snc6PO2Ksh1OaZzY3+TRRkyNOii4r2LpXaH
wWyrFdpcYjEi7Bovt9AtDvAEiHgUFFMkUElYAlHIUKf/AHJFDaeLXMrGvg3pVEz03DqKcVnPk8xT
rRi02dbp3Iims4Zix0ld6DGwM1GVzTBmLG41UZGmMngxUnk1QZzsblOiw1oXAYmRVkIQC0F/7BQX
/sjosp7ZZVgIiyki1kijgMFwGBEIQgVCEIBCEBAIgIQEIQgEIQgEIQgEIQgEIQgEIiEQBIIFBACH
EBBRAbA0Q0Ij4HUwhsDRT0Z47HwLA2IUQY+AkU9EtELQLYMBIVIZKSFNg8C9C3saxUiUQhCkRVgs
KzB0D6iLsRInkLvaWJYsgXVWKtkNIZCmF0uMbh/aVjR9stxsgusTobwZ63HdsK50m18gNpr5LBxZ
8aXhGeXEnfR6HtiT7cPRWLrz64svgv8Ap5JaPQqlD0DWow7Xgv07cmhQVlhGunTUUXZRe9ATrRj5
CZo5SSRlq1001YXOvF+REpwfk2zelSSdzJUir4HymtIUwxWdxyHEJ2BIyZHYd/YuIV7FQd8AtkuA
2VVt4FyZbkKlLIPFNgSZGxcn/gCpZuAFcB/oz9ZqwfBP4Kbw/ZWEv6KTKZB6i/5AZdwZMn0CxbDY
t+zQIgNyrhFlXIVcCwfJbK8hciPYIUvH6BKgUyQjKpUSiiNHQ6XFSmsZuEdbhcD8IPt8ZOxxaKg1
bxYPj0/9JY8DqcLMqNtCzSuao6wYqOHg2QCNMXhFtgJ69FSl7JGfhXOmlSefB4jqldRqVXJ2SR6f
qtS0HlrB84+pq7jTq2m02gTp5b6gquvyH2O+cGfjxdkxCVScu5u/s6EItRX6LGjKeg8/Avv7bE+8
jpnTXptyCvvK3khcTHh7FqN/IN/ZXc/krkYqWdhwjZoVCb0Mg8q/yRHRo2sOZmoywOuVYbCSt8Mt
KzEXsHCeCqOWgfJGyIEHHQUSkXHwZa9hsS9MFP8Agl/5CCl4fwauBW7ZL4WDHe6LpS7Z3MOnF7Th
VVKmvDNlN5PP9Mr3tk7lCV0YrpG2DyjRB5+TJCWUaaejLbTHKGQYqAyBi+tcezVvBdio+CWyZaWi
yIsKqJZaJ8kaRFr2SJdgo1osFBAQhCAQn/shP/YFqxC0QCrEIQCrELKx8gSxCWJYCWBYViWAhCrE
sT0RIv8AgiLKKsWQHyBEEV5LCLGQQIdMKbBDoioDloIdBaGRBp/+A1grK1/sEmCrBF8NXewEpey7
4FOXsHxUmA2STuBsCN5IiEWzLcEo40XGIUdBRLF8V2i5RHAtEC/IPkNoprAT6oiVy4obCnoNeqhH
A1foZTp4BqpRQakmgdXt8i51vhmetOyedGaVZJbDeD5FeV8OxVPkYyzDXrLOTDU5VvIWcHe/qV8h
f1Kte55tczOwnzMbDX+b0f8AUv5FVOS7PJw4c23m5VXnYefBqJ/m6FXm7yZanM7k7s4lTmXk8maf
L9m2fw7c+QvkX9+/nBxv6z2XHl+xiXhHW++xiqP/ACcZclfI+nyU/JXLl/OukpsKLuZIVU0sj6ct
E9cuXHDk7BXFd1vJFK3suMmOVgHIXKexblsjN9NlIGMhTkD328lDZtCZSyU57FuQBORSfyxfcS6D
mY2gdg3uS4Ft4BuRv2CydotMFsgLdzQj0AEwXsJEuQhAqA5LZYAERbIin1ZUVdleS3K38jUX23dj
sdH4zdRP2c/hw+5NYuet6XxuyKbVv2B1KUFCKW8EnZN4ItAzCYOjL8kbacr2MEHYfCpYM9Njkl5E
VKudifu7zszVqrs3cBfUq8YwbdmrM+b/AFDNcmvLtVo38HpOtcxruVzzcKMq7ect7YHF+wlpB/ab
xY6Fej9mTjKzBp2W1gQc2fGn7A/pp/DO/CMJrVg/swto66rzv9NP4ZD0P2YkKPk3Z6J2+h1iNGnI
qEbMNO3gKKCcUyIbQlg0xMtP8UOjIngawo+gI7GwRpZ6iCQXb7BtkKNBJayAg0FgkRgt20UmRoaw
ELiw1ohOmvgcj7c0rnpuncjvhs8Wp9s0dXgc7snGN8M52OkeypSv5NVKTwc7g1VUgne7N9N4OddI
105YGxejJTlk1U3m7MN8To4LBiMI0sgPkIipHRfyDcNaI0i2EUtlgWggUEFQhCvAFbLQRErAXEha
CAGwNhgHkCW9FWDIABC/2XYASFl2AEgViWApE/gJIvt9gB/BVhnb7KsACQVi7F2ABDoAJZ+RsV6A
OCHRAgtDYIIZT8DAUrIsrK0yd2AO4ByKHNiKjyyd4tyuKerciXAT9lpmWhrRIlJlraL4s6NgsBpA
wQ1IL6Boppje30UkDwtIqS9D+1AtIifSoxG93atCp1FHyY63Kw8h24cLW5crtbu8COTzI9rycTk8
7tbyczldSw8h2n85HW5PMTTyYXy1nJ5vlc6TvZv+DJDmzcst2XsL+O3oq/LWcnMr81J7OZyeZJp2
ZzXXk27v/cOnHjjvf1udl/1yxk4sJ38gycvmxca2O+uZeOzPV5tr5OVGu4Rs2Z6vIbuPGbJW6tzc
vJmny/ZxuTzGqlr4LlVvFO9zWpjrrlex0OT7ODGt7sMjyPY2sZHeXJ9jafJ9nChXzk006yHbNkd6
ly2rZOrw6/fbNzyMa52em8lpKxqOP9ePT0beAHK2xNKv3RV3kGdS18l15LRSqZBdQU53AlJfIY9O
7/YEpi+/DBlLAUfeV3CO7JakA1SxoIXF6CuGFphAop6KnwXgpgkDOoyFMEGrYL2XcoEQhGVcHqyF
AfyFwX6IgUWtZKiAyTbQ2McMnFi6tdQS2wjtdB4rk79t0eup03Gmklmwno/B+3xYO1ns6Sp2WQzt
YWpJ3asgo5YyssfoXBWL4urk7C1JtBVMCUyBncZedNRovNsDZSstnG6vyvxcU82CODzZOrUd3dXA
oRUGsWCf5XdsstYA5vUXeq2Bx6f3NK4/k0fuSfwdDpXCjbDuBno8WXwPXFfwdqhw1nI9cNFg88uK
/gh6H+jRDo0+AWKt8FkRtwUkWnfwU9Ej+gDWhtKORMTRTdiYpsVYZB3Fd1y6byVfrStAvZcZE2BF
sIpIvQEYPkIpICINMFLISMqGcb5JTTjNNeAyr2Jizlj1XQq34pNnoKTTjs8J0nmfbn2t2PWcHkxn
FdrvdHHlHfjdjrU37NFNmGnLRroy97M43OmiDGoRF6HRZitmEIQjSBR0CWQEvBdwVsINLWQgEwwq
ERCICIL/ANgoL/2AZCEAhViyJYAogVkSyAWthWJ5LAqxZCJAQhaj8F2AGOgyJF2AopLAVi/IA2IW
QAUsjYLQEVkbBZAZTGRBgXcIdcW5A938Ad3wa3ATkA5AuQEpEB9/sByAchbkGTu4KMsmdSyHFmum
2lMdSjd3EU8mukvxMgoobFFQSGYQEAeL+ipzsZq1dRWxVkpsppeTNW5CjfJgr81Lycvlc/eSOvHi
6PI5qs8nL5HNSTycytzU75ObW5ad1cPXwmNfK5ndfJzK9du/5GarXvdGSpOTDHLlJWipUvtiJ1Le
Rbk7ZFzyVy/07VUq7yc+pWkpOzNNT+1mCondhP8ATGqjyZeWalXbRy4J4x5NEpdscG5D96fKrnJn
rVbJ5AlJtYMtVtp7Mus59MlVuVTZsov8VcyRhltmqnZIepeWik/9yKQtv2UmE1pjP2aadTGzn91g
4VGgldJVPZt4fK7GlfFziRqsfRq2auVz57Y9jxuR3JZHurdnneNyLJZNcOWnvBt5rxdT7pTqmB10
/JdOpfyHKzG7v+C3K6ZnUsXuFGX4kiQxPYS/7AIJFUyAYqLDuVgaKbKTyRhOSXJcsgZUyFMsACEI
T6k9QhCFXwD8lBMFBUe8Foq5CoZCR2fp/id/LhNq68nF41NzqpbyfRPpvp6jxozas2RHXoU1Gmlp
IqpE1OKikl4FVNMrn9cyu7OwtOwfKve5klUsthr4ZWqJIzSrKzKnPuRmqyUE2/BQHK5nbdPZxuTP
7km9h8qp3ybEKN7AD2lqK+Au1paJG5AFSnG2jd02moxRjluzN3ExDBRtU2tF/ekKuwbv4Af95kEX
ZDo0+BXJ3W8ifuE+4jeOOnJjadjLGormnj/lYniG9pcbpjYw/ECayUEn7wFB4/kTEZEKfBjYCIDI
siw3x8F4Fpl3wAREDEtEqaIpsiIBG7IpPJPAKYUaVrtbO90LkNJKTycOOjTxpun/AGuzZiunCvc8
are2TdTl8Hm+lchySTejuUpa8nN2lb6cnfY+LMkHlGin8ma6RoTLQKyEjm0Iq5ZA2pMtPOiFLZAa
YfkCP/kIMjIQgbWUiykASIREQBILwUthoCELIAsKxEggBsSKCKQFkIX/AOwKSDBQQEKsX/7IgJYl
i7eyAVFBrBUdhgSLCuUitBFNguRbasxNSVvIVJTFOYupIW5CBkp5LhK5mlIuEyjUrDYLJjhUyOjV
yEbqezRFmCnVV9jnyFFEG1VElsGfISTzk5dXlqzSdmYa3KdnkNcY6fK5qSdmcSvz3d3eDDyeU85O
RX5LzkPRJkdavzotbObyOUnfJzK3Ia8mSryXbYXi0cnkvNmcyfKl3buJr8m98mF1by2XF5crI7EK
ncthOS+TFx542McreQ8/LnV1almL77ia07y2SLNSbHK8uzJZM845GOdhUpXLIxedHGKsiNKxcdFS
eNm8JzsA7IVU7bA1Z2TMsql/JHT/AEXNq7t4F/cawVKW8inkLP6dn91y43wKg7Doq5MdpyGlcJL2
Ci08GHXYtBwnZgAeSsc3V49S6NCm7o5tCoopZNMKt2sh566EJOyyaqUlhGCFS5opt3Qnbjy7dGLu
vQyLM9F4uNubYp0WHFiYv2HFhk64SeBV7oKLKg0y0CmWgXwTZLlXuUGPEbKuR5ZYVCrlkAhLEIWJ
VMEJghUQUVdC5uyNPTabr1O2zeQO39PdP++1K2me/wCFRVCkop+NHO+n+nrj8dSa2jtNJBnQC6kf
xY3yLqP2Erl8vTzo5NaSbaTOjz5/3ZOP5v4ANysjDzays44bYzl1O2L8HHq1HOs84NQXLORlON0H
CHchqppIgS4KwEY9qZrcF26FVElFgZKn9xv4cG4fs5radTfk9D06jeinbaAGFFtauMVF/Bqpw7Xl
Ow5OP/SwMH2H8EOh+P8A0v8AwQvavyr3MjmwM/JdvZ31xHCTb+TocSWjnU1k10ZWJUjrU53WySSb
M1KTaNEb2J6pbVmFB2sU0yRK1DosZH/Jnu0HSqZszPo0wQbStsWne3sIpuLIiiL+QYIphL9E8kMC
kRRyGgkgJBBRJFei2nglb4uj06o4zWT0/Dq9yR47jT7ZI9J02smlk52OsegpvRopMx0ZJpGmnIxe
LpK1xfyEv2Jg8jEzHjoaQBF3MqIgNyeQGR/8hLYuLDIaK/wEgIloLKtlospbDQkECggLWwkLQyIB
EIQCEKSLsEQpF2LQFF/+yECr8ssBMgBkALT9gGQG5V/YBxYVxPdYrvAffAEpCnUwLnUCenSn7ETk
LlPIuUwqTmKc8gTkKbE6DpSwwVK3kW5YFOVh6NH3fy2MVbBzZVe17BfIxsJI6keRZ7Kqcy23g4c+
S1LDKfJ7tsNyOhV5azZmDkc3eTNVrpJ5ObyeSs5DpJh/I5jzm5zK3KtfYivy1kwVOQpXK1+miry0
/mxlqV0/kROorsTKoXGf9JBzne+xELuRFUV8hKSWTX56Yv8ATW2hOyCc2/JihWYxVHcflytNk8hq
SsBGSaysi51EvJ0k6Y9XUqZAjUXyZ61QXTqLGRiWOkp42DKphiqUlbYrkSsnkqYVyKuWZu/P7AqT
v5uLuQOc9FxkZ+4OLI3x9PuNoydxMdD6TTI9PA3uKbsgZ6wCkyN6PuRUZXuD2PZcYtDGb3BqVkaK
EmxEKbb0buLQyroy41qoXTN1JZEQp2saaCyacebTT0MQEUGHPKJDIsCH6GJFSwcWGhZaYQ4i0K7m
0En7KmmEACCWp4LKBCDIBctE8J6IhCGoVTLKZWmVU7e52PU/SnTXOr3uOPlnH6Zxvu1I3V1fyfRu
j8VUKKskseCI6FOP24KPiwTyRgsjPqnhGXkVEovI2rU7Ys5XIrOV1fBT1h51RznZaZlqRUIJ3H1t
3ObzakrNXHqk8qSkmr3ZijRblexohByd2PUVFfBYFQjZIcrdpSsw+01FUjNyX+LNX/KYuQ/70Z3t
lioRcqyxhvwew4MUqMVrB5rgU3KqrHqeNBqCW8AN7UUo4D7LItIMg7UQOxCmvyb2ktkIiOzCLY2k
/wAhcR9CneQRvoL8Vg0pYF0Y4Q0NSKsrAtW8hrygXELA3J5L7WTtyZ8DaUtDbiaehqWh2vRsEGol
U1j4GIqBUSksjCo+MEwSMcBJEWieGUEpJMLEkIZcZNEbhkPxZ1em1WpJHKUzfwGu9ZwYb4vVcWo3
FfNjoU28HK4Ul2rPg6lFaMuzXSeh4iAyLONdJ4cQFEIggQgdEBxD+BcQkQHEMBYLDUGUikWg2JBA
ogEGRFrYyLXyAYKLuiAEiikywIQhAIQhfgAb5CQPlkAslwbkuBd/gq/slxd8gFJgt5KbBbAu+Bcm
W2LlIAWxcmXKQuTCKeUxbQbeAQBehU0PFTWQMVbGTBX5DhezN3KvZ2ONyqc5J7QdOEIqc20n/wCR
MuoWezNX4VWbbVzJU4Fe+mHWcW6fN7r5uY6nIcr5Eri1E7WkE+LNR1k18WsvIqe8iL4Y+rQkllYM
9RWTDlSnK7Bnoq9nnAFSXg6Rw5XKFysFF3QibLhPtVjTPG9tEB8HZGSE0O78DS+nSqWRmnW3kCtP
2ZKtT4KdnVKvsXGor7MkpN3AUmmEdmnWstiq9ZzujJCba/gvMhDKvZPDIotBKL+QuF2CjsZ2k7TP
jXCWijobSw/RIQvbBppUW0sB6OMwVNdwz7fodRo2tgb9vBG8Y1TGQpeh6hkaohKVTp+jZRjZA045
NEI4Dz8hRuOopp6KpwvsfGJHno0EikWkaZHDwMWkBAYZFkRSCRUXYuJZCspclyEC9JclyEB0ly0U
XHwE8GQhCnqIpQc5pL5LSuzp9I4br11jCZR6D6d6a5RhJrCsz2VKKikraMvS+OqFBK1nY2vzkjHk
VJi5OyCYuoGdZq+U/g5tRZZ0a2mYKz2G2Oukos5dWHdU1dHS5DumrZMijm9gjP8AbUUZ60mmbamn
gyzj3MoCg72NsKfcv2DQ47xiyN9Gg00/BrRk+1aLwcblv/Vmj03IioQeDzfKs60/Bn6y2dGpruT2
z01CKwcHo1O1sbPTUaasvYaBOIvtZudO5X2kHNi7WQ3faX/8sQptfkCzKasMKaOzHwEDRSn2sSln
QQI6nHqJpI1pHEpVXFpXOnxqrkkrhposQpspEa6q/HwKlsYgJr0CLpSyaaTu9mOMRsJNPYK3w0WK
p1MIYpE1FrJd7FXQEmVfBqZTkBAt7J8QSZS/ZSZZWoKLs/k08Wr2yRkQyk/yM104evV9NrXUc7PR
8fKR5Dpcnj9nq+HL8UcuTtPW1BRAiHE5310Egl/kpBIwKuFcEgUSeC0wVhEANSCT9C0wk8AMiwrg
RGEAsIhA6KTsFGRRIgF3ei0wS0AalgvuAuRAGmXcBNhNgXclwWyrgXexLgsrwAXd7KbByVf2EHcG
4HcRy9hVyYvu2STAbwBHIBu5G9i2wCehbL2ivARZAAwAegJocCDj2xzp3ehMuMns6XavgrtDrwYY
cSHwXPg02v7UbVgrePIdY4HN4UVFuKs/0cTkU5RTPXcun+LOHyqKswvKdPM1lLO2vZza0lGTueh5
FFZOD1Og8uKK5VzuRWSljGBH3VcVXvHZmdRpnaePJzvbY5g9xm+9gn3G9DF/n3WlzsT70vDsZ+5v
YUYth0wbqt7ywG2/BbpyXgZTpyl/ysun4uM7XotQ+Ua1x5PxcNcef/SF/FZqf6NNOCCjQkl/YGqc
r6Iv4TtVtXLVL0NhTflD4Rxaxn9NzgxOmWqLdjY6LusGqjRWLofpucCONx9XRvo0UkMpxikGnYzu
Ok4luCX6L7QmRWJrfKYX2hRjkMkWb15+XQ4xHQ0sC47HwRY8/I2msIbYCCwhq17DhfUgg0ioYCRG
E/RaeCEKz+hJhIBaLT9hRERV/ZEUor5JcoMMqQRREBEFFfBSQS8FVfgpsnwFGDnJRSvd2A0cChKv
NRirs910PpSoQUpbOd9M9M7Lzmt2auevpx7UlayGhsX2xsWncEtBmiFT0FfAqpIIzV3vJgqvZrry
tcwzeQM9VCHGyNTjcXOGyjHUjgnHoKTux8qbYdOHaA6EFFJDEDHwE1gBfKs4O/weV5b/APsNL5PS
cqT7X+jy9d//AGn5IPT9HppUYPzbZ36H9pxOiRc6UV6PQUoWjYotFtBKNrE/ggqxC/4IXsfjnuJ3
C/5Iv2zvjhhly1oWg0TMULf5HQ4UsIwWu0dHhU2kFboZDsVTjYN7JVgEimvAZFEq+FJXDivkPtLj
HQXpI6DjLINrEQQ3uwWvYCDggCjophIuxMT0KRA/ADK1FIbSf5IX4Lg8oldONeg6W1ZZ8nqeJJdq
yeN6fJ4/g9T0+T7Uc+TrK7FPS/QyOhVD8sGhRONjpO1ItaCSJ5MNKIWygLRdwQUAZaAQSAdAO4hP
AUWRTiAJ4JdhoZEBdlp+goy0AmS4BkQPd6KuA0q4u5aYB3JcFMvuQFXKuC37KvkArgt5LYtsA7oF
tAXKcsAXJgNltgvyBTdwHku5AiAsIgFWBDSwU0GUKsXYrQaCWiBXQdeF7DawCaTZJSQipUsw78eI
uS04/wAHD5by7nUnUumcrmZuyV1nDpyqy/LRkr0Yzg0/JuqLbMlaVl8jWOf8nmOo8Ozfbo5FTjST
03k9ZyI91/kyLjpvwdZyea/8t5POx40nbDNVHgyl4Z3I8dfCH06VlhKxf03w/wCb8uHDp78pmmHT
Y2Tu20dhQ2Woj9u0/g50eHG1rI0U+LGPhGrtV9FpY0T9N/5dEqhH4Rbox+EORT0T9Nf5k/ZVtIr7
EfhDlcsbqf5zGd0UvBFSV9GhK5faZ0/BX21bQUY2DsEo5Jp+ApbIkE9FMbqzjIpleAZuwHcTWeZg
cfAuLDh4N8a8nM6Ku0aICqSNEI+jo83KmwwgkRLCCGOFSPgNC0y0xidGFXBuVcYnRiei7gJ+y0ym
iWgkLuFcIJBLYu/sl/YTDAo6FxY5I18FxCsXFYYLeSYqI7nQOA6/IhKSxs5XCoTr1VGKbyfQehcC
XHpLuVmkEdTjUI0oJRSsaQF/aRMIMlwblNgSTEzew28ip6YRlq5bMkou7wzXUzcXYBEYklHA9QDV
LuCsXYRR9GydGwtU0ghUI+hnaMUUl8WCUb3Gjnc2FqbZ5qnSVTmPzd5PVdWxxZfNjznBVuQ35YHt
+j8GnS4sJR21m5vUe1mTpNRugk3dHQdrXuApoGwcgWyirEJcgH437WTtNHaTtPQ5M6gTtH2K7QF0
4/kvg6fHnBLefgwKOMFxi09kHXpzTexq9HNoyaezbTndBTEshJZIshqIVViKPvISRdgdglr0UF5B
8+gLjoZD9gIOADCfspO/kiVwgkgUGQLoGsFR2giksozW+Lq8HCXux6bp8vxXg8vw3hHpOn/2JnOu
/F3eLLBshlGLiLFzdHXyc66QQLLZTOTSMohVwCZRCgLKTwQq4B39l39i0y0wpykTuQFyXID7kEmJ
TCTwGjLkTA7vRO70Ay5VyrlXyFE2Wn7AZdwg+72C2VclwI3kieQblJhTPkW2XcBhF3AuS5AJ/ILf
spsG4BEADAhCEAuPgjKjpEegqAvAQDCKlpim3YZJ4FNr5Dpw9LbYiqxs2vkz1X7D08CZyd2Y+Q7p
mmo0Za2UzNejja59VmOs/wDBsq/sxVQ13WdxvcWotPRpjYHtG1fzMJURkYh9voiG2rkwNi0i0FFZ
K1IFRJ2+hqQVkTxrojt9FOI6yBlH2NT0kgzt9k7RqYGKCsS1iNXHxnFWImX4KsPWb0tgyI3gGUrJ
l8cy6gj/AGJ9xuQXbcrl/Q+nlL/uaIR0KpR0a6awiz14udHTiPprIEENidY8/K6J6LKvgq5WOhFI
q5aYTqrIQgMi0sEIiIMXpfwED8BfoKhCECjhtGiBmitD4O1i6hngKhSlWqKMU22DT/OaitnsPprp
TcXOSzdWbA0fTvSVSjGU1nZ6qMbJeLAUKMaUUktDQgJAhSBDNGA9kKbDIWxc/IbYqebhpnmtlJZD
YUI3CrhDAfbYZGOC7IDPU1oVm+jVNJrQmSyEKb9FKSSZJebCJSeQM3Vp91FpfBw+BBy5DTwmdrkx
74u5l4tHtqRaXkD1HTYdtJL0b07IwcWXbBfo1d7sBcv2DcruwDsM/VtkBuQrT8mdhOzA3t9FpHoc
8ZZRK7DROORcl2oHgIR9DFTV9CoTzsepJtZILirDKbs9gP8AYMZJPYHRpaQ7Bjo1E0smhSug3xMZ
fgXcJNBfQSv8kjveC5ZBWgwYElfRUY3Ww4Jx2wmapRd9h2t5K743ywa9SMU7PwFwXd7DhkwxqN3e
0HS5Dv6CNjVkUlkGlOVRpJN/pDp8eq7WpyefgjU07jzs0t5PW9KSdON0ed4HCnJrujJO/wAHr+m0
Pt00pK/xc48rjvw7b6CsjVFC4W+BkWcNtd4MhSsRkaDIG4bBsQqAyLQMtFFXJexVymw0vuuRSBKT
yA5SwTuFp+y7hkxSyGngTF5DiQMuS4CZdw0K5Lg/yT+RibBXJcH+SfyMNgu4ncD/ACT+QbBXJcG5
LhRXBbJcF+gJ5KeEVcpvYAtku/kjKAlyEBbDI0/ZLv5AUvZHLAaMTx8kbFqRbYF3wDKRLgMEVKWB
M5DnozzDpx9JqTZnnNjqmzNUD08fCas7GWdW98h13sxN5YerilSV2Zqg5sTPZOmtKeCIkirkrQ74
2VYFMJeAi7FlPQLBKO+Cd3sXciZVMUgloAq5Ok0YLZTkC3jYxV3Jf2LbJ/IYtGRvAFwJywBc5fAm
VTAM52E9zk/2IxbIKP5TsjbQpOyuK41Fp9zWToU42Rp5v6ckp0xsVYqL2Emb4Pn/ANKODdhidrC4
+LBvwdHGiCBQQPobkCIEqrkuWQIiLuylosM31LsKLBLj4CmIiKWxkUBcMfsOKbeEApK9rnY6TxnW
qJdl0yhn0/0yXKrKbuknpfs+kcSjChTUYXtZbMfQuBChSTSSdjpTVnhBi1aZfgWvBfc2gauXgqxX
7IBVwWggWAuQEvIbBaAUo3HQjZAxQ+CwD1EiPQViNYARPTES2PqaEvyUJn5ESNExNRWQGSssFcaP
5K68h1tFcf8AuRB2aP8Aah6asZaMrofHQDH+8A/yX4JcrKyFXIGn5Y7V6LUEZfuz/wCiQcKlR/8A
JL/B6ccdMnFZMvJklA0Qp1askowbfoqfB5M3ZUHK3ytBXIlJ3waePGpO1k2bqHSa86qjKkoNv4Pf
fT/0tDsg6rbwm1gzYPnTo1pOyTLjwK8lezPsdL6a4UW70Yt32xfK6FQpwl9qlC69BdfHZ0q1F5TY
/jVZuys272PacrpUXVcZwjb2jb0z6e46r03KjDw7hvi8XFTa/sf+C+2pf+xn2Lj/AE1w5xT7I/4N
n/xDiSs4qEVbQX4+JKFV/wDJL/BcaVV6hLHo+5UvpLhpflGD/gZ/8U4VsQgv4Dlvb4S4Vo4UJA25
ElaMJNn3Kr9K8SP/ACRf8CIfS3EjPu7FF38Br9Pj3C6TzOZNKNOaf6PTcD6I5leNpxt+7n1Tp/S+
Lx7JJN/weh41KjTjiyCa+RUf/wAczUL1N3tg38f/APH9CjFd6WD6TyJxV7Sj/k4nK5qjdd6Jsb48
a4XF+mOHQaXbH/Bu/wCD8SOowt+hNXqOXZ3Yl9QlLGjF5On+bTV4HGpK6hH+DNOMEvxSSBlXctu4
N7nDlXXjxyJEOJUS1o5usEggdF+CNqZRbATyBV7AyDYEiiAPBfgBsAigO7BXcyMDTCTFxYV/goOI
UZC1IlwHXxsq4u5Lhs26JdAJkuGR3RLoC/wXfABXRLoq5LgXf0Tu9A3fyXdhpfd6JfAFwgypkZZT
I0FlFsq4FsXIK4L2GVFeCMq4aWmW2CskuFGigL+yBfEkJn5GPQqWgvHpnq+TLM1VDLPQerhWHk6M
cvGDZXTM00Y7enjSGLl5HMW0XWyGihk0AxqiBXgotA9W3j4B/RbsDf8AgC7ld2CAS/tKmickV3K2
zJUm/wCRcazvl4JidNzkrA94j7ikt5JGVyrrQmWLWiXfyRnkMVVeArv5BkrhiUizk9Ow6jx/yUgo
RyaoaQkrlz5CgrWHLQEf2GkdJNjyc+WoHDwRLD+S4o1xmPLy7NgglgGIxI252KCICE8oiAlpAWQq
xLBFrRZFouwZvqi14JYKJTocS3IG+CknKaSV8hbTuNx5168YwV8n0X6b6V9mkpVFZ2wZfpfosIU1
VqQTk7NHr6cFFJJWQY7XTioxslaxUw7gS0GQIIEtWAsAtvBdg1oQH5DBePIAg2ItlrYPFwWR0UBA
ZEMpNfAPgNrADDRFRCVsfPyLKEzRnqZRpqGWo8EGWs7J6K439yA5LsM4au0UdWgaIGang1UkQGlh
F9vsvwXcrIe32QK5A08J/wD1hT+I/wCQo/8A4xpL/p/hn1ZxwC4/i8Hsxw1854f/AOP+LxpJuMLL
LbaubaP0twKE05Uou7+Eeq5L2Yar/wAGaevAfU3QKUJTlxoRi7XusWOF0nnzpL7ck3KLtfdz6R1H
jqvQqxa3Gx8y5XHfB5Dhppv+SVp2oc5vaLqcy6aOH/UewZcjDyQX1Kak3JOz9Gb/AIpUouHa1hJC
K85TlvBkq03lsjrw42vWdG+opzq9te3b4tg9JHrNOys3/k+U0a7pVLpPB1uPzpSad2G/zX0GfVfx
bjLP7F0+rzTTk1Y8h/WtR+QXzZTVtfomxx/F17ep1+Hb+TX8Iw1uupp9jPIVK8mtsXCrL5JrU4a9
XDq87p3tb2ao/UVlaUmeNdaVtivuSb28E1qcO3sa3WHUX4zaT9nPnzHK/wCTf7OFCo15bNVG8rGL
Xq48Om2nKU57djdTgK4dHFzZ29qOVrX5VFWsMQKRbRi1RLRaB8IKJDBLKCQC0FfBGgyKsXIq6B8U
wJBsCRT0PgCQ0VIjJb8g3wFIBsIKLLuBf2WngoZcq4N/gq4DFItMBaImA1Mu+BSYSYDEQEpSsF0f
8k/kG6JcNGEAuQArBCwkRmCKZZTDQJEJIgEAewwJAC9MhHoH+ALRLkSK0DV3KZGUDVMVMa9C5ILK
z1EZ5o1TQiaGO3Dmw1o4ZjqROjVjsyVIZZMejjzYpIE0TiIlEN/siaFj5RYvt9Eyt/sD0RYRGU9D
FvOUMpIBzQNRSEtSb0MY/R/f/AMpXTBhF+QnHAT9stTLBjEbOLvoBxaWin7RR+GNpxKpRuaYxslg
LOfQUiu0YosLtGMXmUo4L7PkbGOC7YLjny/p0qEEMjEGOkNijUjz8v6LQyKKSwFFG5HDlyWg4opI
NG3PRRQaKiEthAssplIjCBIspBfqyEIEWggEGGL6FBLAJeWILinKSSR6v6Y6I+TUhOonaLvkw/Tn
TZcmsnKF47/R9K4XHhx4JQSVllorFsp1CjGhTUYqyWAlLJbzgtRC6uTwB4CloHwgl8Uyi2RBlErh
WJEsBegZaDYMvAX4WvJEQiCemRCi8ARwEG/hjfsXJ79kBbAXU0LSGyyAULqLBmmr3NU83ETWGRnt
zOWrJfsPgf3Irm6RXAdpIvY7FOI+ngXRyhq2yNGXICgiiEIQD0Xd7RTd1ZFFHq15WLlww2c9xT/g
6fK/sZzXg00TVgu123ax83+sOLKFZ1IptXyfSpPB5/r/AA1yKE01mzsYb49vlbm18kjK4XLpypV5
wfhsVBmK78ZKY1gXL8k76DcsMU5ZZn47SQqVJXZUG4SwG2AxreRso1HLZpgsHOoyszbTn7MuWCls
qKsX5LZLVnFVsA2DLhFyksYM63OMVBO50eHTbaVsl8XiOTu1g6FCl2S0TXSa1cePbFZGsXCWAkzn
yutLIX4KMCJhRBCQgtMtMhAKegf0E9AsKjF3uE3v5BCK2DLQQuTwx6AKaCsWGaTLBSYUhbZUGpF3
ForuIhsWGmJjItSKpqLUhSYSY0NTJcBP2U2AfdnQSYpMtMBqLuLTbLANMtPAtMJMArkuQhBaKIS4
xdQqxLllw0NsF2IkWNQtolg7EGtga+Rckxz0A0NC3e2gGjR2gSiNGaccaEyiapIU16KsZJwM1SBv
lHZnnHDDptjnyh6Eyhg3TiJlEjX6YnDYtw+TVKIuURq/pknEU0bJREyiRvjzpNinFehvaV2+g1+y
1Ep0x1imsCRi84zukvkipK/od2ktkYzOe0EacVpBKK8IMli41eYUiJBkNSOV5bQpE7Qi1o1jnyqR
iMivRIoOKLHK1EgooiQcdGnO3UUfYSRaQVgUKLWAiEYUVYtF2BUSIT4IGL6hCEB2j2WtEXgtFFob
Sp92kLRr4zs0J258q73R69TiRXbNr0j0PG63LCkm/wBnkqVS1jTCsbxyte2odThNpNW9nQp8iE7W
kj5+uRNf2u1vguHUa1N/3MmH7fQ3a20wUeP4nXnTspts7PD6zTq7ZManLXYtcnbgVT5MJpWdxsZp
6YxdEii/JPBFLYt7CbBXgLEjHOrBWLIGlPQN8DGKlphlakC2UmRhFlWLIAmYibwzRMROOGBzeboH
hLWQuarJFcRaCutQlg0xeDNR0aYhoa0ECiXKCID4IB6LtBasht0Lke5wxnrLuizk8h9srHYmcnmw
ffrBkZ+/GzJy4qpBr5QyV0JqNtYZzXi+a/UvFcORKUY2WdHnu5xfs+ifUHF+5CTt7PnvMpunVaat
kY9HHVqV4ipSzslOX4tC3fueMfJiu8E5A9zuRgN2I2bTbv8AybKTwYKU0mbKc9Gdc/rRFhr9i45W
BtGjOpNJJs58q1JiQi5SUUsnW4nBk2m00h/A4ah+TWflnXjiNvBz1sFChFUkrZXkCdPtY5SsU3cb
rZFgkNsrC35sZZWQDRbJ6aNE0CnYtMeNeiuF/NhaYaCo9AsNoFoBb2WUygihchrAYZLt6KY2wthr
0mVxbvfRolHAPaDCHcBv+RzjvItxsGQxkEnkElwhsJZDUvYhPBalkIemXcQpE7gpyeS4sUpBJhTo
yL7hKkFGVyoYn6GJiUwk/YDblirlp+wDuWAncICyRBQyKCrIRxL7fZAt79EsMt7KtgNFP0UhjXyA
0D1QMtey9Ipg8Kkhco2HyFy8lWUhrYicTVJCpRC6xzh8CZU/RsnEVKOyqxSgKlE2SiJlH+SYu4yy
iKlA1yiKayMWcmdw9Fdno0OINhh+iO3OgbbwaXH2TsKxeWs1saB7TT2FOmVmXKz9pO0f9v0D9sYt
tpcVgu2BvYV2+jbF5TSu0JR0M7QlEJeQUgooKxaRPHO9qSDSLSCSNJVpFvRErkZWVELKIIQhV38h
mrX7IVctMIhCEAJaCBXgGtNQg3csc70K+R9Kfa0cafNd7RzY28ar9yCkajFdhVPxQ6FTCycmNWXl
4NtGV4p/JuOXJu+47FJtvIqLGq1iuer0vZdKrODvF2YDfsij8DGpcdfhdUnD+5ux3+L1eEopN5PE
XaDjWlHTZMb/AFj6Vx+VTqxTjJDZTTTsz55xep1aTWU0vDO/wesRkkpdq/yZsanJ3XNthx0IoV6d
VJxkmaY2sjON6iwwky7MqxMNTygJvDLBbwFBm+gmUXcGLIVb0S2AYpipWDlhCZPYNY+VDvwLpR7W
l8D6uxEP7kGnRoaNEfBm4+kaYgGEBf4JcoK5Af5IB37+yXBuiXxs9uuKmzNWavoe37MlV5MeJ6w8
imnfGTnyVnY6tU51dfk8j4rmc+mp0mnY+fde48YVJNH0Tl/2P9Hg/qD+6RPj08Xle/tkw+6/ky13
aoyo1rLZx5PRPD5ytczzqAVaqfkzzqY2Y7VroS7pWudLjpu1vBxOD911H2K7fyel6ZwuTdTqQj2+
ci+M5NauFx3UklbB6DicSFO2FcDh0YxSxZmx4eDm0bGKSsvAQEJYCZhVMIBhkVAGgy0Aq10QY4gS
jgBb2y4kayWlZEBIOOgEHHQbGLYdwHgBT82LJLyCBAGhoDQT0DAtcOSKB0F6Af8AgYD4B8LYuSGM
GfgBHlkIwUBGVcj2ymVld8FpgXImMDVIJSxsSmWpEQ9SLUhKYSf8FU5SDjIzxYxSAamWmKUgkwHR
YSEphpgMQyGxKfsbDQINu5ZVyEF+CJFLQSDQGA0NYEtA+ltAtDAXoKW0V2hIuwQhxwLkjTJCZIqx
mnEW4miURbQW+M04iJRNko/yLcF8FRklHAmUTbKn/gU6foL6yuBXZk19mNAOHoMkdmC+wb22sS2A
vxncCu0fYq3wWJSO3BXaP7SnD0bCGikhzgU4FceXpaLSC7QktBAduC1EZb0SxFUkXoiLRWVxKYfg
BhnxYBbKCKeCEkQJUKuWC8BMEQC5EwYPusmzjcvmNzcb4udStL/Tf6POcmH5t+SxjkfCopPR1eFK
yscKhZtZOpx6na0bcq6vdg08ar4vhGGMu5JoZSlZo1GOU114SGKWDJSnew9MrjeqdF9w6GhENDIu
wBOwDSyRsFyNClsZGo4tWdgYrRb/AEZsdJ438PqNSi1l2O5Q62rwu/FmeVXtBp2GH6x7/i8+FVLK
z7NnerbR884/KnTas3g7HH6rLCk3byzGNTk9S5bAbuZeJyYVoq0v8mtWtszY6SwS0WAv8lhpEEVb
BX7IKloQ1cfPQgIz1lhmeH9yNNfTM0N6CxuoaNUTLxnhGmLDQykwWyrlZNILIB2vuAuoJuWexx0T
qOwqT+S2BIzVhc9HO5H9zOjPbObyl+RGmHkZTR4b6qpyUW0rN3se5qeTy/1PS7qDtsldf53t8orV
airNSZSqsdzaco8iV9i4U7mK9fHsKcp6VzZ0vp8+TNd6drjOFx05JW2e06RwYU6SaWTHjrjP03pV
Okk+xNo7dGhaNksDIQSeEaqccaM8q54zJdoSyPlBPwAoW/R56sVBf4GJYIsMtPBNVO0vtKCQbCkG
i7MuKCeqsDa43sK7ShLgX2jrC5RIF9udlh2KsFCURlaCK8FWIQKpgsMBhAsFou/wEGS7f7AtBvyR
BoqS9i3EawHsBEogNYHzQmXkBbKLewGBGyrkyCygu4il/ADLIybF5DWUZ0wlL2BoRL+xPdgnfYI0
RlkOL9mVSDjP/Abau4JSMqlnYyMijTFjISMql7GQkKzGlMJMQpew1IgbdFp4+RV8Fp+w0O4L9kuU
yiingj9EegzqvBT1stleCNBeQGhgt6ClSQqSHP2BIoS0LkhzyC18lTopxFyWRzVgXENeEduNFWHd
pO0M3CJQwD2GlxKcbEP0zdhOyw9pW0LksFS3SmkA0M2RRDJQPwMkrXBNsVRSI9leCsbgrllEKurI
CmVdEOhXKbwVcqTxsrKX2Dcq/sjfsJqNlXKetlZ+Qg7guQDl8sVKpe+cApvcWpGdSLvgIbVzTf6P
Oc2oozaud+UmoP8AR5PrMnHkN3dmajHJoo1PyWcHRo1NZPPcSsm8s6/Gqd1jo5136E04rJopnNoT
sjfQldbDnydCk7WyaoSVtmCnLKHqWiuN7rXGVg1K5nhIangpDFkiiBF2YxMq9Vf/AJLWQQ4kNS2A
l4IkXZXCWhTsx0J9rFNf4I8EzVnLt06PLce37b7Wt28nW4vU2klJ3R5eMmhtKrJWd8C8W5ye6ocq
E4qzSb+TSpKX/wDw8TT5jVsnV4fUmrJu69mLG5yegYLeDPS5cKkVnI7u7k7MmN/qIDJFgzlYz4aT
VjszJWbNE53QmSwFP47waVLBjosf34GN9HoJWM8ZewlMBxBfeQDp5JdjnFANHteUFwXok3awLeDN
7bKmzFXzfBpqMz1P7SGsFRZOV1XiutSdstK51prJnqq6a8B34PkPWuI48mTtY51KGbHu/qvpySdS
Ctfdvk8SotVWraON6ezjZI28Ck/uKyurntenRSpL9Hlelr/USecnreGvwRzt1uco2RtfRoha2TPF
BLZmpprtfQyMV8Co+DTTWDlQqUMaF9tvBqsBKPojRQS0X2BJYChUbhJBJEW/kCWKa2H4+SmgxQ2K
t6CsU0GwNC5Id4Fy8hCpAvQxgNBQNZIHYHyBQqQx7K7QhUUwmH2lWwAr5AHNC5JALbyU9hNASfsC
pC56CYthkt7BYxoGSAEW9hSKAoFhANhf/U0RMIBhBJkuDd/JACuEpC7v5In/AAA5T9hxn7M6ZFJ/
IGyM/YcaljHGeAoyA3xqL5GRmvkwRnYdCWNl6G1SCTRmjL2HGRA8lxcZYL7g0O5TYCZd0GYIEpyB
uBbFtkbKuJNbC9FMpsC/sqZVyWAGE3gBsCnoEu5RfFUy/BfgoMWh8gvIYLewhbAaGPQuTBeimrFl
PbBbCAl/bIFBMG+zozUB8F4sC3YMjILuS5WFvZCkyXAsGRXd7JcngoojeAZTSKdreAJSVtgyqK2x
M53KzQ1Z5dgFK5TyyWAZF5+Q4sXBjIhB2vFnlPqKPbL+T1jV4vweW+pPGfJqM1wqNTtm8nd6dUvY
8/RadTJ3uBbFsG3Ou5SlhG3jzOdSxFGyhaxXPk6dKWjTFmKjLKNUPBXP60QeByd/RngaY6KzRBxy
AkHHBnFEg0LT0HcYhiL8goG+RiejwW/2LTLTwWGCSwHDxgGLyGkVZ0tL4DhUaAWvZT/VjNanJ0KH
McLZOtxOepJJs8zcbSqONskxucte1o1ozWGBVyzgcPndlk2dahyoT8mca0Uou5dsGmPbKN0zPW/F
skjWhStcOEsZFd+ClL4KutKZd/YuEk/2MMX1rUv7IQgNegcsgNlfyRntef6VN5I9Az2i/wDlMNkT
Xoz1FhmqX6M9XTCfWGW2Zqnk0TWWZ570HXhccbrUVKg1a54Grxm+RKysrv8A7n0jn0+6EsYseO5F
D7dVtryzlyr18LsZen0XGssHp+KrRRxuND8rnZ4r/FHGvRMxq8asHFAwGxRmsJFZHwwhUTRDRzva
IkXYtIOKI1A9gtxsaEsFSjdBpnSLVgnHeCrWCiS9FNETC8BC2vYLQwFhSxcvI1ipbCAYMtBMqQVQ
AYDAjBuvksD0EFdfJCAsMqewJDGKeg0AWxjFv/cAJeAJBy8C2GfiwJIuxGGSmgPI16YAWTQMB6Dl
/wBygvxAHstlBlCEIBAbk8FfsCdxHL4BZX6AKLfyHGQnuCjIB6YcZteTP3FOfsK3xq+x0J38nMjL
2NhNryEdRSKvkyU6+Mjo1Uw1DrhX9ilLBLgM7gb5BTI2XDUbKKYMmFl7QF4BKuVsTBZLkuRmrIUC
gxJogS1lFgLkxbZc/IthF+Bcgm7oXJlULexbfsKQthEvsFu5GwXs6M1ad0BJl+GA9iJV3JcF+yyu
YlIpsoFsCX9kb+QboCcsfwBcqiV8iZVMbFVJbBjf+Cg+7ANypeCLSIi1stgxD8BFpZDSBjpBlQxu
0TzP1JB79npJZicfq9J1abx4NM3146L7anwdvgSskcevTcarurZOpwf7UrlYd2hUuljZsoP2c6g8
I3UHg05cnS47yjbGWDn0Xo2QZY5NEWaqTujHBmmm9Gk9aV4KBi8BBRx8DBUQroIK4QtMu4UZWiLW
AfJmBsRyQiA1M0giNEL8GaBsRIJLZaQnaaFOzH0eQ4eREkAxW5dd7h89uyvk1T5HftnneLJxqLJs
qVnfDI1rqd9/IUZqxyocl+cmilXUvJcX9OrReh5zqPIUbXY/+rjYz+Wv003RDP8A1S+EQflf29Lc
peSrlnpZBIF6DYJmqUxFVYNTQiqsEVgnES4XZrnHBnas2CesnJpJ03+jx3Vo9rdnezPayV0zznW+
C3ecVjbMc3o/nXD40zscN4OTRp9vo6nDf47PLdeqVvhL0OizPSex0TOKfBDoIRA0QZnw9HFFon6L
Q9PEuVsu2SJEdAlSiMtgtoDM8FOQ+ULiJwYRI5uUyZimL7rhVsB/ojkU2EUwGsBFN4AX5I0WQKFr
0SxbaKTwBTiAxjAkvIQLFPQx7FvQFCmwngCQZAxbGMCQRXgsrwWEKZTiWy0FKkgWhrQDjgAAfJbR
VgeqIQgXwPkENg/JUA9lXJIFDBGVcJ6FyJi9L7s/JTnkrwAEp8J4GRqY9mW5cZewjZGoHCqk9mOM
iu+z2B1YVl8jVUTWzkQqZ2aKdTGwvroKaC7kYVPOwlLGGFjZ3ASExljZfdhFbzoTZTYNyr3DHYv5
KuD3eyXCDuVcG/sl/YbFclyin+wyCe2KYyXkU3/gqKf7FyZHIF+y/EUymRgtsyBYNySefRVzqxVt
k/gq5TZRTsC3YjkLctkBuQE5Y2Lc7C51CsUU6mAFK62Kbuy0wmwTKBbKuDqxd8hWA8hoMrSL0RFM
J9Wn7GRFIODsVTVoycuKcH+jUsoRyIuUWVl47qkO2o2kTgydldeDZ1Ok+7KwZqMe2xWOTrceV0jp
cd4X6OZw82OrQSSNuPJrpSsaYTMkPBogacb620pGiMsIyUjTB6BPToSyh9zNDaNCYKNPAQCIVmUS
LTBTLXozTRoJIWtjU8A+iirWwMS/wBFhphV3sWtFFrQ9VaCQK8BpDALQDWRrXyTtQ6NhMX2vQf3G
yOPsFo1IaJSDhVt6FaIXF/TXHkW2GuUYO4neTD9duj/Uv5IYO4gw/b6fYgTRVjq7YApq1wwWKBEz
WBr0LlozgzTRmnGxrloRURrCVlccsx86n305K17m+Znqfkc+UduFyvGVqbp1GvCY/htWeMmzq1Ht
m2jm0pdk9HnsevjddOm1c0w8GHjyuma4y0c600QZppmWDyPpyRzpD1/sEioWaDSIvqrFIJlB0WmE
AS/oIOyFzVwlL0S/oKROn3JmZw7cPJvaEziEYZJ3C8IbOIpqwA3ywW8bLYFwKZZCBQPyRFtYKYQQ
uWiN4KuAL2Len+hgDsAmQL8jGgJIMhFyGNZBaBhbLI/IP6AFlohTwGUewLBNlZAXJAPWhrQLiGin
svwRoj0XxAsH5DB8AKlsoNoBgQBhgtAA9ADGsANWCKKbtotuwtsAu4pyBbKuMBqQcalvQhyyV3BW
xVs7HU66+TndxX3bDB141kMU7+TkU61ls00uRfyGv06CZL3MarhqtgIe2D3ZFfc9ld/sYyf3E7hP
d/Jfd7KumdxO72K7ge/2TDTZP2Kkyu7OwXo12gWwJMJgs10gXIpskgb7LjOqkwblTlkCUgnplwZS
VhUp4FSmDw2UvYqU/YiU/YtzZTTpSAbF93ol8k1gd2vJaYJSeAmCL8gXJexTB+Q0LT0Egg0wgEUE
vY8fJa/Yu4SeNBDIsuTTQrusC5bKVyurQu36OUkzs87P6aOVL8Wac618K6aOvSvZHL4dnY6tI3HP
k1U/BpprJnpPKNMdGnG9tFMcmZ4PA+GXsgdB6NEZaERX+xoprRWbBkL8A3fyTUWXEG/8hRKCWw08
AIL4IT02LDQtBKQaEw46ASGeALQzwKTDTHqisV/AXwVkuMheirDLXBcfRoLauC4j4wdtbCjSu8oq
ZfWJortfwdGVCNsLJX2F8BcYEmQ2/wBP6IEfT2QhDb1BYt7IQIFi5EIAmQqWyEKzPSJmaWiEOfJ1
4OT1X/wcP/mIQ4V7eDZxvBsiQhx5NH0x8CEMDRT0MiQganinsshDLaEIQCEIQCP+0VUIQBE/ImWy
EAEU9shACXgr5IQCnoCRCF+ivBCEDAWLZCFQEgZEIQA9gshAoHsp6IQKgJCFZRlEIECwXohApcvB
TIQIEohAoWA9kIEQFkIFAwWQgUMhciECKZRCCAXtgkIBfgD5IQJUjsfR/wDJCBT0EtEIUX4ZEQhp
BBEIBI6KeyEC/VfJGQhUAwWQgQMgH4IQ0z9Jn5FshCMFy0xciEC3wp6K8EIGVkIQlVCEISeCkWQh
sWgokIGaYWQgAeSLRCBFvYJCCJXP52kcqXkhCxitnC8HUpaIQ6Ry5NlA0rRCF+ON9Np/+B9PwQgn
o1Q2Oh4IQUH4AIQrNWi4kIQGthEICCXgtEIVTIhshCfEgvguJCFnrRqBZCFRFoKHghAQ1aLWyEK0
ZEshAxUIQhB//9k=" alt="">
                <span>${user.username}</span>
            </div>
        </div>
        <!-- 主体内容容器 -->
        <div class="main-content-box">
            <!-- 左部信息栏 -->
            <div class="left-msg-box">
                <div class="exercises-list-box" id="exercises-list-box">
                    <div class="list-item" id="singleItem">
                        <svg t="1569334127933" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1483" width="24" height="24"><path d="M330 222h170c16.3 0 29.5 13.2 29.5 29.5S516.3 281 500 281h-170c-16.3 0-29.5-13.2-29.5-29.5s13.2-29.5 29.5-29.5z" fill="#0C4991" p-id="1484"></path><path d="M446 254v119c0 16.3-13.2 29.5-29.5 29.5s-29.5-13.2-29.5-29.5V254c0-16.3 13.2-29.5 29.5-29.5s29.5 13.2 29.5 29.5zM323.5 502h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM526.5 380h183c12.7 0 23 10.3 23 23s-10.3 23-23 23H526.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 631h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 759h276c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM848.5 301.6H648.5c-28.7 0-52-23.3-52-52V68h46v181.6c0 3.3 2.7 6 6 6h200v46z" fill="#0C4991" p-id="1485"></path><path d="M811.5 952H222.5c-29.2 0-53-23.8-53-53V105c0-29.2 23.8-53 53-53h41c12.7 0 23 10.3 23 23s-10.3 23-23 23h-41c-3.9 0-7 3.1-7 7v794c0 3.9 3.1 7 7 7h589c3.9 0 7-3.1 7-7V274.5L616.8 98H433.5c-12.7 0-23-10.3-23-23s10.3-23 23-23h192c5.6 0 11 2 15.1 5.7l216 189c5 4.4 7.9 10.7 7.9 17.3v635c0 29.2-23.8 53-53 53zM372.4 98h-39c-12.7 0-23-10.3-23-23s10.3-23 23-23h39c12.7 0 23 10.3 23 23s-10.3 23-23 23z" fill="#0C4991" p-id="1486"></path></svg>                       		单选题
                        <div class="listItemOrder" >
                        </div>
                    </div>
                    <div class="list-item "  id="multipleItem">
                        <svg t="1569334127933" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1483" width="24" height="24"><path d="M330 222h170c16.3 0 29.5 13.2 29.5 29.5S516.3 281 500 281h-170c-16.3 0-29.5-13.2-29.5-29.5s13.2-29.5 29.5-29.5z" fill="#0C4991" p-id="1484"></path><path d="M446 254v119c0 16.3-13.2 29.5-29.5 29.5s-29.5-13.2-29.5-29.5V254c0-16.3 13.2-29.5 29.5-29.5s29.5 13.2 29.5 29.5zM323.5 502h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM526.5 380h183c12.7 0 23 10.3 23 23s-10.3 23-23 23H526.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 631h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 759h276c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM848.5 301.6H648.5c-28.7 0-52-23.3-52-52V68h46v181.6c0 3.3 2.7 6 6 6h200v46z" fill="#0C4991" p-id="1485"></path><path d="M811.5 952H222.5c-29.2 0-53-23.8-53-53V105c0-29.2 23.8-53 53-53h41c12.7 0 23 10.3 23 23s-10.3 23-23 23h-41c-3.9 0-7 3.1-7 7v794c0 3.9 3.1 7 7 7h589c3.9 0 7-3.1 7-7V274.5L616.8 98H433.5c-12.7 0-23-10.3-23-23s10.3-23 23-23h192c5.6 0 11 2 15.1 5.7l216 189c5 4.4 7.9 10.7 7.9 17.3v635c0 29.2-23.8 53-53 53zM372.4 98h-39c-12.7 0-23-10.3-23-23s10.3-23 23-23h39c12.7 0 23 10.3 23 23s-10.3 23-23 23z" fill="#0C4991" p-id="1486"></path></svg>
                       		多选题
                        <div class="listItemOrder">
                        </div>
                    </div>
                    <div class="list-item"  id="judgeItem">
                        <svg t="1569334127933" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1483" width="24" height="24"><path d="M330 222h170c16.3 0 29.5 13.2 29.5 29.5S516.3 281 500 281h-170c-16.3 0-29.5-13.2-29.5-29.5s13.2-29.5 29.5-29.5z" fill="#0C4991" p-id="1484"></path><path d="M446 254v119c0 16.3-13.2 29.5-29.5 29.5s-29.5-13.2-29.5-29.5V254c0-16.3 13.2-29.5 29.5-29.5s29.5 13.2 29.5 29.5zM323.5 502h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM526.5 380h183c12.7 0 23 10.3 23 23s-10.3 23-23 23H526.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 631h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 759h276c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM848.5 301.6H648.5c-28.7 0-52-23.3-52-52V68h46v181.6c0 3.3 2.7 6 6 6h200v46z" fill="#0C4991" p-id="1485"></path><path d="M811.5 952H222.5c-29.2 0-53-23.8-53-53V105c0-29.2 23.8-53 53-53h41c12.7 0 23 10.3 23 23s-10.3 23-23 23h-41c-3.9 0-7 3.1-7 7v794c0 3.9 3.1 7 7 7h589c3.9 0 7-3.1 7-7V274.5L616.8 98H433.5c-12.7 0-23-10.3-23-23s10.3-23 23-23h192c5.6 0 11 2 15.1 5.7l216 189c5 4.4 7.9 10.7 7.9 17.3v635c0 29.2-23.8 53-53 53zM372.4 98h-39c-12.7 0-23-10.3-23-23s10.3-23 23-23h39c12.7 0 23 10.3 23 23s-10.3 23-23 23z" fill="#0C4991" p-id="1486"></path></svg>
                       		判断题
                        <div class="listItemOrder">
                        </div>
                    </div>
                    <div class="list-item" id="flagItem">
                        <svg t="1569334127933" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1483" width="24" height="24"><path d="M330 222h170c16.3 0 29.5 13.2 29.5 29.5S516.3 281 500 281h-170c-16.3 0-29.5-13.2-29.5-29.5s13.2-29.5 29.5-29.5z" fill="#0C4991" p-id="1484"></path><path d="M446 254v119c0 16.3-13.2 29.5-29.5 29.5s-29.5-13.2-29.5-29.5V254c0-16.3 13.2-29.5 29.5-29.5s29.5 13.2 29.5 29.5zM323.5 502h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM526.5 380h183c12.7 0 23 10.3 23 23s-10.3 23-23 23H526.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 631h387c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM323.5 759h276c12.7 0 23 10.3 23 23s-10.3 23-23 23H323.5c-12.7 0-23-10.3-23-23s10.3-23 23-23zM848.5 301.6H648.5c-28.7 0-52-23.3-52-52V68h46v181.6c0 3.3 2.7 6 6 6h200v46z" fill="#0C4991" p-id="1485"></path><path d="M811.5 952H222.5c-29.2 0-53-23.8-53-53V105c0-29.2 23.8-53 53-53h41c12.7 0 23 10.3 23 23s-10.3 23-23 23h-41c-3.9 0-7 3.1-7 7v794c0 3.9 3.1 7 7 7h589c3.9 0 7-3.1 7-7V274.5L616.8 98H433.5c-12.7 0-23-10.3-23-23s10.3-23 23-23h192c5.6 0 11 2 15.1 5.7l216 189c5 4.4 7.9 10.7 7.9 17.3v635c0 29.2-23.8 53-53 53zM372.4 98h-39c-12.7 0-23-10.3-23-23s10.3-23 23-23h39c12.7 0 23 10.3 23 23s-10.3 23-23 23z" fill="#0C4991" p-id="1486"></path></svg>
                       		Flag
                        <div class="listItemOrder" id="listItemOrder">
                        	
                        </div>
                    </div>
                </div>
                <div class="horizontal-decorate-line"></div>
                <div class="esercises-rank" id="esercises-rank"></div>
            </div>
            <!-- 左部答题栏 -->
            <div class="right-exercises-box" id="right-exercises-box">
            	<div class="exer-content" id="exer-content"></div>
            	<div class="exer-img-box" id="exer-img-box"></div>
            	<div class="exer-options" id="exer-options"></div>
            	<form class="layui-form" action="" id="exerAnswer">
            	</form>
            	<button class="submit-btn" onclick="answerSubmit()" id="answer-submit">提交答案</button>
            </div>
        </div>
        <!-- 底部遮罩栏 -->
        <div class="footer-decorate-bar"></div>
    </div>
</body>
<script type="text/javascript">
	var optionChar=['A','B','C','D']
	var exerMsg
	var exerId
	$(document).ready(function(){
		var nowTypeList=[]
		if(userMsg.nowExerType==0){
			$("#singleItem").addClass("listItemHover");
			$("#singleItem").append("<div class='listItemOrder'>"+(userMsg.nowExerNo+1)+"</div>")
			nowTypeList=userMsg.singleChoiceNoArr
		}else if(userMsg.nowExerType==1){
			$("#multipleItem").addClass("listItemHover");
			$("#multipleItem").append("<div class='listItemOrder'>"+(userMsg.nowExerNo+1)+"</div>")
			nowTypeList=userMsg.multipleChoiceNoArr
		}else if(userMsg.nowExerType==2){
			$("#judgeItem").addClass("listItemHover");
			$("#judgeItem").append("<div class='listItemOrder'>"+(userMsg.nowExerNo+1)+"</div>")
			nowTypeList=userMsg.judgeExersNoArr
		}else if(userMsg.nowExerType==3){
			$("#flagItem").addClass("listItemHover");
			$("#flagItem").append("<div class='listItemOrder'>"+(userMsg.nowExerNo+1)+"</div>")
			nowTypeList=userMsg.flagExersNoArr
		}else if(userMsg.nowExerType==null){
			alert("考试结束")
			$("#right-exercises-box").append(
					
			)
			
			
		}
		$.ajax({
	    	"url" : "${base}/exerAPI/getById",
	    	"data":{
	    		id : nowTypeList[userMsg.nowExerNo]
    		},
    		"type" : "get",
    		"dataType" : "json",
    	    "success"	: function (resultMsg) {
    	    	//console.log(resultMsg)
    	    	exerMsg=resultMsg
    	    	exerId=nowTypeList[userMsg.nowExerNo]
    	    	$("#exer-content").text(resultMsg.content);
    	    	if(resultMsg.contentImg!=null&&resultMsg.contentImg!=''){
    	    		var imgJSON=decodeURIComponent(resultMsg.contentImg)
    	    		var imgArr=JSON.parse(imgJSON)
    	    		for(i in imgArr){
    	    			$("#exer-img-box").append(
    	    				'<div class="exer-img-item"><img src="'+ imgArr[i] +'"  class="exer-img"></div>'
    	    			)
    	    		}
    	    	}
    	    	if(resultMsg.exerciseType==0||resultMsg.exerciseType==1){
        	    	var jsonStr=decodeURIComponent(resultMsg.answerOption)
        	    	var anwserOption=JSON.parse(jsonStr)
        	    	for(option in anwserOption){
        	    		$("#exer-options").append("<div class='exer-option-item'>"+optionChar[option]+":"+anwserOption[option]+"</div>")
        	    	}
        	    	if(resultMsg.exerciseType==0){
            	    	$("#exerAnswer").append(
            	    		    '<div class="layui-input-block" id="answer">'+
            	    		    '<label class="layui-form-label">题目答案</label>'+
            	    		    '<div class="answer-option-item"><input  type="radio" name="answer" value="A" title="A"><span>A</span></div>'+
            	    		    '<div class="answer-option-item"><input type="radio" name="answer" value="B" title="B"><span>B</span></div>'+
            	    		    '<div class="answer-option-item"><input type="radio" name="answer" value="B" title="C"><span>C</span></div>'+
            	    		    '<div class="answer-option-item"><input type="radio" name="answer" value="B" title="D"><span>D</span></div>'+
            	    		    '</div>'
            	    		)
        	    	}else if(resultMsg.exerciseType==1){
        		        $('#exerAnswer').append(
        		        		'<div class="layui-input-block" id="answer">'+
            	    		    '<label class="layui-form-label">题目答案</label>'+
        		        		'<div class="answer-option-item"><input type="checkbox" name="answerCheck" value="A" title="A"><span>A</span></div>'+
        		        		'<div class="answer-option-item"><input type="checkbox" name="answerCheck" value="B" title="B"><span>B</span></div>'+
        		        		'<div class="answer-option-item"><input type="checkbox" name="answerCheck" value="C" title="C"><span>C</span></div>'+
        		        		'<div class="answer-option-item"><input type="checkbox" name="answerCheck" value="D" title="D"><span>D</span></div>'+
        		        		'</div>'
        		        	)
        	    		}
        	    	
    	    		}else if(resultMsg.exerciseType==2){
        	    	$("#exerAnswer").append(
        	    		    '<div class="layui-input-block" id="answer">'+
        	    		    '<label class="layui-form-label">题目答案</label>'+
        	    		    '<div class="answer-option-item"><input  type="radio" name="answer" value="1" title="A"><span>正确</span></div>'+
        	    		    '<div class="answer-option-item"><input type="radio" name="answer" value="0" title="B"><span>错误</span></div>'+
        	    		    '</div>'		
        	    		)
    	    		}else if(resultMsg.exerciseType==3){
	        	    	$("#exerAnswer").append(
	        	    		    '<div class="layui-input-block" id="answer">'+
	        	        		'<input type="text" class="answer-input" name="answer" autocomplete="off" class="layui-input">'+
	        	    		    '</div>'		
	        	    	)
    	    		}
    	    }
		})
		$.ajax({
	    	"url" : "${base}/userAPI/getAll",
	    	"data":"",
    		"type" : "get",
    		"dataType" : "json",
    	    "success"	: function (resultMsg) {
    	    	console.log(resultMsg)
    	    	function compare(property){
				    return function(a,b){
				        var value1 = a[property];
				        var value2 = b[property];
				        return value2 - value1;
				    }
				}
    	    	scoreArr=resultMsg.data.sort(compare('score'))
    	    	for(i in scoreArr){
    	    		rankNum=(parseInt(i)+1)
        	    	$("#esercises-rank").append(
        	    		    '<div class="esercises-rank-item">'+
        	    		    '<div class="esercises-rank-item-order">'+rankNum+'</div>'
        	    		    +scoreArr[i].username+'<div class="vertical-decorate-line-12px"></div>'+scoreArr[i].score+
        	    		    '分</div>'		
        	    	)
    	    	}
    	    }
    	})
	});
	var answer=''
	function answerSubmit(){
		if(exerMsg.exerciseType==0){
			answer=$("input:radio[name=answer]:checked").val()
		}else if(exerMsg.exerciseType==1){
			$("input:checkbox[name='answerCheck']:checked").each(function(i){
				answer+=$(this).val()
		    })
		}else if(exerMsg.exerciseType==2){
			answer=$("input:radio[name=answer]:checked").val()
			console.log(answer)
		}else if(exerMsg.exerciseType==3){
			answer=$("input:text[name=answer]").val()
		}
		answer=encodeURIComponent(answer)
		$.ajax({
	    	"url" : "${base}/exerAPI/checkByIdAndAnswer",
	    	"data":{
	    		id : exerId,
	    		answer:answer
    		},
    		"type" : "get",
    		"dataType" : "json",
    	    "success"	: function () {
    	    	window.location.reload();
    	    }
		})
		/* 
        console.log(answerArr) */
	}
</script>
</html>