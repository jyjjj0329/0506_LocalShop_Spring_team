$(function(){

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
        //검색리스트  삭제해도 됨
        ,searhList : function () {

            var formData = Board.$frm.formToJson();

            $.ajax({
                url: '/api/v1/payable-merchants',
                contentType: 'application/json; charset=UTF-8',
                type: 'POST',
                async: true,
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function(response){
                    //console.log('response: ', response);
                    Board.$dataList.empty();
                    if(response.header.resultCode == 200) {
                        var totalCount = response.data.totalCount;
                        var contents = response.data.merchants;
                        if(totalCount > 0) {
                            var tempTag = '';
                            $(contents).each(function (i) {
                                tempTag += '<tr data-seq="'+contents[i].seq+'">';
                                tempTag += '<td>'+contents[i].simpleNm+'</td>';
                                tempTag += '<td>'+(CommonJs.isNull(contents[i].bizTypeNm) ? '-' : contents[i].bizTypeNm)+'</td>';
                                tempTag += '<td>'+contents[i].addr+'</td>';
                                tempTag += '<td>'+contents[i].telephone+'</td>';
                                tempTag += '</tr>';
                            });
                            Board.$count.text(totalCount);
                            Board.$dataList.append(tempTag);

                            Board.$paging.show();
                            CommonJs.setPage(Board.$count, Board.$paging, totalCount);
                        } else {
                            var tempTag = '';
                            tempTag += '<tr>';
                            tempTag += '<td colspan="4">';
                            tempTag += '<img src="/img/no_data.png" alt="검색 결과가 없습니다." class="no_data">';
                            tempTag += '<p class="notice">검색 결과가 없습니다.</p>';
                            tempTag += '</td>';
                            tempTag += '</tr>';
                            Board.$count.text(0);
                            Board.$dataList.append(tempTag);

                            Board.$paging.hide();
                        }

                    }
                    Board.$table_view.show();
                },
                error: function(response){
                    alert('이용에 불편을 드려 죄송합니다.\n잠시 후에 다시 시도해주세요.\n동일한 문제가 지속적으로 발생할 경우 고객센터로 문의하시길 바랍니다.');
                }

            });

        },

        fnBtnSearchDisable : function () {
            $('.btn_search').attr("disabled", true);
            setTimeout( function() {
                $('.btn_search').attr("disabled", false);
            }, 2000 );
        }

        //여기 까지 검색리스트  삭제해도됨 bongjaesung
        

    }
    window.Board = Board.init();
});

$(document)
    .on('click', '.area_list>ul>li', function () {
        $('.area_list>ul>li').removeClass('on');
        $(this).addClass('on');
    })
    .on('click', '.btn_cancel', function () {
        $('.area_list>ul>li').removeClass('on');
    })
    .on('click', '.btn_select', function () {

        var $selectedKa = $('.area_list>ul>li.on');
        var id = $selectedKa.data('id');

        Board.$affiliateName.val(affiliateName);
        Board.$id.val(id);

        Board.$search_area.show();
        Board.$table_view.hide();
        Board.$searchKey.focus();

        Board.$bizlist_area.show();
    })
    .on('click', '.btn_change', function () {
        Board.$kalist_area.show();
    })
    .on('click', '.btn_search', function () {
        if(CommonJs.isNull(Board.$affiliateName.val())) {
            alert('검색할 지역을 선택해주세요.');
            Board.$affiliateName.focus();
            return false;
        }
        Board.fnBtnSearchDisable();

        $("#pageNum").val(1);
        Board.searhList();

        $('.area_list>ul>li').removeClass('on');
        $('.area_list>ul>li').each(function () {
            if($(this).data('id') == Board.$id.val()) {
                $(this).addClass('on')
            }
        })
    })
    .on('keydown', 'input[name="searchKey"]', function (e) {
        if(e.keyCode == 13){
            if(!CommonJs.getCheckedString($(this).val(), Board.$regexText)) {
                $(this).val("");
            } else {
                $('.btn_search').click();
            }

            return false;
        }
    })
    .on('keyup focusout', 'input[name="searchKey"]', function () {
        CommonJs.getCheckedInput(this, Board.$regexText);
    })
    .on('click', '.biz_area_list>ul>li', function () {
        if($(this).hasClass('on')) {
            $('.biz_area_list>ul>li').removeClass('on');
            Board.$bizType.val('');
        } else {
            $('.biz_area_list>ul>li').removeClass('on');
            $(this).addClass('on');
            var bizType = $(this).data('bizType');
            if(!CommonJs.isNull(bizType)) {
                Board.$bizType.val(bizType);
            } else {
                Board.$bizType.val('');
            }
        }
    })
