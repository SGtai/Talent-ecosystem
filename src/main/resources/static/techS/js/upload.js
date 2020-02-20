

// var   value =mySelect.options[index].value; // 选中值

$(function () {
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
//选完文件后不自动上传
        upload.render({
            elem: '#test8'
            , url: 'techUpload.data'
            , auto: false
            , accept: 'file' //普通文件
            //,multiple: true  selectType
            , bindAction: '#test9'
            , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                this.data = {
                    type: $("#selectType").val(),
                    name: $("#domTittle").val(),
                    xx: $("#fileInfo").val(),
                    jg: $("#jg").val()
                }
            }
            // ,progress: function(n){
            //     var percent = n + '%' //获取进度百分比
            //     element.progress('demo', percent); //可配合 layui 进度条元素使用
            // }
            , choose: function (obj) {
                var files = this.files = obj.pushFile();
                obj.preview(function (index, file, result) {
                    if (isImg(file.name)) {
                        $("#tp").val(file.name);
                    }else{
                        $("#tp").val(file.name);
                        alert("你选择的不是图片可能导致图片显示异常!!!");
                    }
                })
            }
            , done: function (res) {
                if (res.code == 0) {
                    $("#tianjia").show();
                    document.getElementById("domTittle").disabled="disabled";
                    document.getElementById("fileInfo").disabled="disabled";
                    document.getElementById("jg").disabled="disabled";
                    document.getElementById("selectType").disabled="disabled";
	                $("#sc1").hide();
                    $("#myUpload").hide();
	                kcid=res.kcid;
                    alert(res.kcid);
                    layer.msg("成功保存并上传!!!请进行添加章节");
                }
            }
        });
    });
    layui.use('form', function () {
        var form = layui.form;
        form.on('submit(upload)', function (data) {
            var   mySelect = document.getElementById("selectType");//定位id(获取select)

            var   index =mySelect.selectedIndex;// 选中索引(选取select中option选中的第几个)

            var   text =mySelect.options[index].text; // 选中文本
            if (text!='请选择一个类型') {
	            $("#sc1").show();
            $('#test9').click();
            }else{
            alert("类型未选择");
            }
        })
    })
});
$("#sc1").hide();
$("#tianjia").hide();
$(function(){
    $("#tianjia").click(function(){
        showChapter();
    });
});
//JavaScript根据文件名后缀判断是否图片文件

//图片文件的后缀名
var imgExt = new Array(".png",".jpg",".jpeg",".bmp",".gif");

//图片文件的后缀名
var voideExt = new Array(".ogg",".mp4",".webm");
//判断Array中是否包含某个值
Array.prototype.contain = function(obj){
    for(var i=0; i<this.length; i++){
        if(this[i] === obj)
            return true;
    }
    return false;
};

//获取文件名后缀名
String.prototype.extension = function(){
    var ext = null;
    var name = this.toLowerCase();
    var i = name.lastIndexOf(".");
    if(i > -1){
        var ext = name.substring(i);
    }
    return ext;
}

//判断是否图片文件
function isImg(filename){
    var ext = filename.extension();
    if(imgExt.contain(ext)){
        return true;
    }
    return false;
}

//判断是否视频文件
function isVoide(filename){
    var ext = filename.extension();
    if(voideExt.contain(ext)){
        return true;
    }
    return false;
}

//添加章节页面显示
function showChapter(){
    layui.use(['layer', 'table', 'form'], function () {
        var $ = layui.$;
        var layer = layui.layer;
        var table = layui.table;
        var form = layui.form;
        layer.msg('添加章节');
        var myAssess = layer.open({
            type: 1,//嵌入网页
            content: $('#chapter').html(),
            area: ['600px', '430px'],
            title: '添加章节',
        });
        form.render();
	    $("#sc2").hide();
        $("#voide").hide();
        $(function () {
            layui.use('upload', function () {
                var $ = layui.jquery
                    , upload = layui.upload;
//选完文件后不自动上传
                upload.render({
                    elem: '#test1'
                    , url: 'techUploadCt.data'
                    , auto: false
                    , accept: 'file' //普通文件
                    //,multiple: true
                    , bindAction: '#test2'
                    , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                        this.data = {
                            id: kcid,
                            name: $("#domTittleS").val(),
                            xx: $("#fileInfoS").val()
                        }
                    }
                    // ,progress: function(n){
                    //     var percent = n + '%' //获取进度百分比
                    //     element.progress('demo', percent); //可配合 layui 进度条元素使用
                    // }
                    , choose: function (obj) {
                        var files = this.files = obj.pushFile();
                        obj.preview(function (index, file, result) {
                            if (isImg(file.name)) {
                                $("#tpS").val(file.name);
                            }else{
                                $("#tpS").val(file.name);
                                alert("你选择的不是图片可能导致图片显示异常!!!");
                            }

                        })
                    }
                    , done: function (res) {
                        if (res.code == 0) {
	                        $("#sc2").hide();
                            $("#voide").show();
                            $("#myUploadS").hide();
	                        zjId=res.zjid;
                            alert(res.zjid+"dd"+zjId);
                            document.getElementById("domTittle").disabled="disabled";
                            document.getElementById("fileInfo").disabled="disabled";
                            layer.msg("成功上传!!!请进行按顺序添加视频");
                        }
                    }
                });
            });
            layui.use('form', function () {
                var form = layui.form;
                form.on('submit(upload)', function (data) {
	                $("#sc2").show();
                    $('#test2').click();
                })
            })
        });
        $(function(){
            $("#voide").click(function(){
                showChapter2();
            });
        });
    });
}
//添加视频页面显示
function showChapter2(){
    layui.use(['layer', 'table', 'form'], function () {
        var $ = layui.$;
        var layer = layui.layer;
        var table = layui.table;
        var form = layui.form;
        layer.msg('添加视频');
        var myAssess = layer.open({
            type: 1,//嵌入网页
            content: $('#chapter2').html(),
            area: ['600px', '430px'],
            title: '添加视频',
        });
        form.render();
	    $("#sc3").hide();
        $(function () {
            layui.use('upload', function () {
                var $ = layui.jquery
                    , upload = layui.upload;
//选完文件后不自动上传
                upload.render({
                    elem: '#test12'
                    , url: 'techUploadV.data'
                    , auto: false
                    , accept: 'file' //普通文件
                    //,multiple: true
                    , bindAction: '#test22'
                    , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                        this.data = {
                            name: $("#domTittleS2").val(),
                            xx: $("#fileInfoS2").val(),
                            id: zjId
                        }
                    }
                    // ,progress: function(n){
                    //     var percent = n + '%' //获取进度百分比
                    //     element.progress('demo', percent); //可配合 layui 进度条元素使用
                    // }
                    , choose: function (obj) {
                        var files = this.files = obj.pushFile();
                        obj.preview(function (index, file, result) {
                            if (isVoide(file.name)) {
                                $("#tpS2").val(file.name);
                            }else{
                                $("#tpS2").val(file.name);
                                alert("请上传符合要求的文件!!!");
                            }

                        })
                    }
                    , done: function (res) {
                        if (res.code == 0) {
	                        $("#sc3").hide();
                            spid=res.spid;
                            alert(res.spid+"dd"+spid);
                            layer.msg("上传成功!!可继续为本章节添加视频");
                            $("#domTittleS2").val("");
                            $("#fileInfoS2").val("");
                            $("#tpS2").val("");
                            spid=null;
                        }
                    }
                });
            });
            layui.use('form', function () {
                var form = layui.form;
                form.on('submit(upload)', function (data) {
	                $("#sc3").show();
                    $('#test22').click();
                })
            })
        });
    });

}



