(function($){
            /*
                - 가로로 움직이는 갤러리
                @params : 옵션이며 없다면 기본값으로 적용됨
                    target : 움직일 부모 객체 (css selector default : .vertical_motion)
                    mover : 마우스오버할 target 의 '자식' 객체 (css selector default : .vm_list)
    
                @html data-* : 옵션이며 없다면 기본값으로 적용됨
                    data-min : 최소넓이값(string numberic type default : "130") 
                    data-motion-auto : 자동으로 움직일것인가? (string default : "true" ... or "false") 
                    data-delay : 모션후 멈춤 시간 (string numberic type default : "3" per second)
                    data-speed : 모션 동작 속도 (numberic type defalut : "200" pe millisecond)
                    data-start-index : 몇번째 박스부터 시작 할 것인가?(numberic type default : 0) - 0부터 시작함
    
                @sample
                ul.vertical_motion, li.vm_list 의 타겟 class 는 기본으로 세팅되어 있으며 다른 것으로 하고 싶다면 
                vm.setTarget("option1","option2") 또는 verticalMotion("option1","option2").exe()로 정의함.
    
                <style>
                .vertical_motion{margin:0;padding:0;list-style:none;}
                .vertical_motion .vm_list{float:left;margin-right:5px;overflow:hidden;}	
                .vertical_motion .vm_list img{vertical-align:middle}
                .vertical_motion .vm_list.last{margin-right:0}
                </style>
                <ul class="height_auto vertical_motion" data-min="130" data-motion-auto="true" data-delay="3" data-speed="200" data-start-index="0">
                    <li class="vm_list">1번째 박스</li>
                    <li class="vm_list">2번째 박스</li>
                    <li class="vm_list">3번째 박스</li>
                    <li class="vm_list">4번째 박스</li>
                </ul>
            */
	   
	function verticalMotion(target, mover){
          if(!(this instanceof verticalMotion)) return new verticalMotion();
    
          this.target = target||".vertical_motion";
          this.$target = null;
          this.mover = mover||".vm_list";
          this.$mover = null;
    
          this.vars={
        		  	rmargin:0, fwidth:null, min:130, mauto:true, delay:1, speed:100, index:0,si:{}
                };
                return this;
           }
    
           verticalMotion.prototype={
           // 스크립트로 옵션설정
              set:function(key, val){
                  this.vars[key] = val;
                  return this;
              }
    
           // 타겟 새로 세팅
              ,setTarget:function(target, mover){
                   if(!target) return this;
                   this.target = target;
    
                   if(mover) this.mover = mover;
    
                   return this.exe();
              }
    
                // 움직임
                ,motion:function(opts, current){
                    opts.$mover.stop().animate({"width":opts.min+"px"}, opts.speed).removeClass("on").filter(current).stop().animate({"width":opts.max+"px"}, opts.speed).addClass("on");
    
                    return this;
                }
    
                // 자동			
                ,autoMotion:function(opts){
                    var parents=this;
                    parents.vars.si[opts.rand]=setInterval(function(){ 
                                        parents.motion(opts, opts.$mover.eq(opts.index));
                                        opts.index++;
                                        if(opts.index>=opts.len) opts.index=0;
                                    }, opts.delay);
    
                    return this;
                 }
    
                // 해당 모션의 옵션 가져오기
                ,exe:function(){			
                    var parents = this
                        ,vars = parents.vars
                        ,$targets = $(parents.target);
    
                    if($targets.length<=0) return false;
                    $.each($targets, function(i, ele){
                                                    var $target = $(ele)
                                                        ,$mover = $target.find(parents.mover)
                                                        ,opts={
                                                                    $target:$target
                                                                    ,$mover:$mover
                                                                    ,rmargin : Number($mover.eq(0).css("margin-right").replace("px",""))||vars.rmargin
                                                                    ,fwidth : Number($target.innerWidth()||($target.parent().innerWidth())) // 값이 없다면 부모객체의 넓이가 기준이 됨
                                                                    ,min : Number($target.attr("data-min"))||vars.min
                                                                    ,mauto : $target.attr("data-motion-auto") ? $target.attr("data-motion-auto")=="true" : vars.mauto
                                                                    ,delay : (Number($target.attr("data-delay"))||vars.delay)*1000
                                                                    ,speed : (Number($target.attr("data-speed"))||vars.speed)
                                                                    ,index : (Number($target.attr("data-start-index"))||vars.index)
                                                                    ,rand:"r_"+Math.round(Math.random()*1000)
                                                                    ,max:null
                                                                    ,len:null
                                                                };
    
                                                    parents.setDisplay(opts);
                                                });
    
                    return this;
                }
    
                // 옵션에 따라 객체 자리잡음
                ,setDisplay:function(opts){
                    if(!opts.$target || !opts.$mover){
                        alert("이벤트를 처리할 타겟을 지정해 주세요.");
                        return this;
                    }
    
                    var parents = this 
                        ,len = opts.$mover.length
                        ,min = opts.min
                        ,lenm = len-1
                        ,max = opts.fwidth-(((lenm)*min) + (opts.rmargin*lenm))
                        ,si = null;
                    
                    opts.max=max;
                    opts.len = len;
                    opts.$mover.css("width",min+"px").eq(opts.index).css("width", max+"px").end().last().addClass("last")
                    .end().off().on({
                                        mouseenter:function(){
                                            if(parents.vars.si[opts.rand]) clearInterval(parents.vars.si[opts.rand]);
    
                                            opts.index=opts.$mover.index(this);
                                            parents.motion(opts, this);
                                        }
                                        ,mouseleave:function(){
                                            if(opts.mauto===true) parents.autoMotion(opts);
                                        }
                                    });
                    
                    if(opts.mauto===true) parents.autoMotion(opts);	// motion auto라면
                    //if(opts.index>0) parents.motion(opts, opts.$mover.eq(opts.index)); // start-index 가 있다면
                    return this;
                }
            };
            $(function(){
                var vm = new verticalMotion();
    
                vm.exe();		// 실행
    
                vm.setTarget(".vertical_motion2", ".vm_list2");		// 실행 2
            });
})(jQuery);
