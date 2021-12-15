// 신착도서/대출BEST Tab을 각각 선택할 경우 거기에 해당하는 탭과 거기와 연관된 도서목록으로 이동하도록 하는 js
$(document).ready(function(){
    
  $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');

      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
  })

});




<BODY>
    <div class="container">
 
    <ul class="tabs">
        <li class="tab-link current" data-tab="tab-1">메뉴1</li>
        <li class="tab-link" data-tab="tab-2">메뉴2</li>
        <li class="tab-link" data-tab="tab-3">메뉴3</li>
    </ul>
 
    <div id="tab-1" class="tab-content current">내용1    </div>
    <div id="tab-2" class="tab-content">내용2    </div>
    <div id="tab-3" class="tab-content">내용3    </div>
</div>
 </BODY>



// 달력 넘겨보도록 하는 slick JS


// sub-banner 영역 JS
