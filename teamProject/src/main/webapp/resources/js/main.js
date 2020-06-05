$(function(){
		
	$(this).data("id")
	$(this).attr("data-id", "")
	

	
    var Board = {
        // 초기화
        init: function (){
            this.bindEvent();
            return this;
        },
        // 변수 선언
        cache : function (){
            this.$bizlist_area = $('#bizlist_area');
            
            this.$id = $('input[name="id"]');
            this.$searchKey = $('input[name="searchKey"]');

        },
        // 이벤트 연결
        bindEvent : function (){
        }	
        // 초기화 작업
        ,initBoard : function () {
            //$('input[name="searchKey"]').bind('keyup focusout', this.getCheckedInput());
            Board.$bizlist_area.hide();
        }
       
        

    }
    window.Board = Board.init();
});

