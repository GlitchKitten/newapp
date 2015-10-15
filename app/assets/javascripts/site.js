function ratings(){
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets', readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }    
  });    
};

$(document).on('page:change', function(){                   
  $(".img-zoom").elevateZoom({
    zoomType : "inner",
    cursor: "crosshair"
  });
  ratings();
});
 