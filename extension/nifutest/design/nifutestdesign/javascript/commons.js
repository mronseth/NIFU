$(function(){

    var maxHeight = -1;
    
    if($('#topmenu').find('.sub').length) {
      $('#topmenu .sub').each(function() {
       maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
      });
      
      $('#topmenu .sub').each(function() {
       $(this).height(maxHeight);
      });
    } 
    
    $('#header').css('margin-top', maxHeight+20);
    
    $('#menuhide.show a').live('click', function(){
      $('#topmenu .sub').hide();
      $('#header').animate({'margin-top': '16px'});
      $(this).text('Vis meny');
      $(this).parent().removeClass('show').addClass('hider');
      return false;
    });
    
    $('#menuhide.hider a').live('click', function(){
      $('#topmenu .sub').slideDown('slow');
      $('#header').animate({'margin-top': maxHeight+20});
      $(this).text('Skjul meny');
      $(this).parent().removeClass('hider').addClass('show');
      return false;
    });
    
    $('.overlay').parent().css('position', 'relative');
    $('.overlay').each(function(){
      $(this).width($(this).parent().width());
    });
    
    $('#searchbox input[type="radio"]').hide();
    
    $('#searchbox a').click(function(){
      $(this).prev('input[type="radio"]').trigger('click');
      $('#searchbox a').removeClass('selected');
      $(this).addClass('selected');
      return false;
    });
    
});