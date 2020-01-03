//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function () {
    var element = layui.element;

    //…
});
layui.use(['carousel', 'form'], function(){
    var carousel = layui.carousel
        ,form = layui.form;

    //常规轮播
    carousel.render({
        elem: '#test1'
        ,arrow: 'always'
    });

    //改变下时间间隔、动画类型、高度
    carousel.render({
        elem: '#test2'
        ,interval: 1800
        ,anim: 'fade'
        ,height: '120px'
    });

    //设定各种参数
    var ins3 = carousel.render({
        elem: '#test3'
    });
    //图片轮播
    carousel.render({
        elem: '#test3'
        ,width: '100%'
        ,height: '230px'
        ,interval: 5000
    });


    var $ = layui.$, active = {
        set: function(othis){
            var THIS = 'layui-bg-normal'
                ,key = othis.data('key')
                ,options = {};

            othis.css('background-color', '#5FB878').siblings().removeAttr('style');
            options[key] = othis.data('value');
            ins3.reload(options);
        }
    };

    //监听开关
    form.on('switch(autoplay)', function(){
        ins3.reload({
            autoplay: this.checked
        });
    });

    $('.demoSet').on('keyup', function(){
        var value = this.value
            ,options = {};
        if(!/^\d+$/.test(value)) return;

        options[this.name] = value;
        ins3.reload(options);
    });

    //其它示例
    $('.demoTest .layui-btn').on('click', function(){
        var othis = $(this), type = othis.data('type');
        active[type] ? active[type].call(this, othis) : '';
    });
});
$(function(){
    //初始化,i代表遍历的索引,e代表遍历的对象
    $.each($("#box div"),function(i,e){
        $(e).css("transform","translateX("+i*40+"px)").css("transition","1s");
    });
    //点击事件
    /**
     * 小于等于点击的索引  向左
     * 大于点击的索引  向右
     */
    $("#ad div").click(function(){
        //获取点击的索引
        var index = $(this).index();
        $.each($("#ad div"),function(i,e){
            if(i<=index){//小于等于点击的索引  向左
                $(e).css("transform","translateX("+i*20+"px)").css("transition","1s");
            }else{//大于点击的索引  向右
                //总长度-5*40=偏移量
                $(e).css("transform","translateX("+(321-5*20+i*20)+"px)").css("transition","1s");
            }
        });

    });

});


