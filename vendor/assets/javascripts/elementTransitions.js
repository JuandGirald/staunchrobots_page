/*
  elementTransitions.js
*/
var PageTransitions = (function($) {
  var startElement = 0,
  animEndEventNames = {
    'WebkitAnimation': 'webkitAnimationEnd',
    'OAnimation': 'oAnimationEnd',
    'msAnimation': 'MSAnimationEnd',
    'animation': 'animationend'
  }

  function getTransitionPrefix() {
    var b = document.body || document.documentElement;
    var s = b.style;
    var p = 'animation';
    if(typeof s[p] == 'string')
      return 'animation';

    // Tests for vendor specific prop
    v = ['Moz', 'Webkit', 'Khtml', 'O', 'ms'],
    p = p.charAt(0).toUpperCase() + p.substr(1);
    for( var i=0; i<v.length; i++ ) {
      if(typeof s[v[i] + p] == 'string')
        return v[i] + p;
    }
    return false;
  }
  // animation end event name
  animEndEventName = animEndEventNames[getTransitionPrefix()];

  function init() {
    $(".et-page").each(function() {
      $(this).data('originalClassList', $(this).attr('class'));
    });
    $(".et-wrapper").each(function() {
      $(this).data('current', 0);
      $(this).data('isAnimating', false);
      $(this).children(".et-page").eq(startElement).addClass('et-page-current');
    });

    // var mousewheelevt = (/Firefox/i.test(navigator.userAgent)) ? "DOMMouseScroll" : "mousewheel" //FF doesn't recognize mousewheel as of FF3.x
    // $('.et-rotate').bind(mousewheelevt, function(e){

    //     var evt = window.event || e //equalize event object     
    //     evt = evt.originalEvent ? evt.originalEvent : evt; //convert to originalEvent if possible               
    //     var delta = evt.detail ? evt.detail*(-40) : evt.wheelDelta //check for detail first, because it is used by Opera and FF

    //     if(delta > 0) {
    //       alert("holi"); //scroll up
    //     }
    //     else{
    //       animate($(".et-rotate")); //scroll down
    //     }   
    // });

    $(".et-rotate").click(function() {
      animate($(this));
    });
  }

  function animate(block, callback) {
    debugger
    id = block.attr('href')
    nextPage($(block).closest('.et-wrapper'), $(block).attr('et-out'), $(block).attr('et-in'), id, callback);
  }

  function nextPage(block, outClass, inClass, id, callback) {
    block = $(block);
    inClass = formatClass(inClass);
    outClass = formatClass(outClass);
    var current = block.data('current'),
        $pages = block.children('.et-page'),
        pagesCount = $pages.length,
        endCurrPage = false,
        endNextPage = false;

    if(block.data('isAnimating')) {
      return false;
    }

    block.data('isAnimating', true);

    var $currPage = $('.et-page-current');
    if(current < pagesCount - 1) {
      current++;
    }
    else {
      current = 0;
    }
    block.data('current', current);

    debugger
    var $nextPage = $(id).addClass('et-page-current');

    $currPage.addClass(outClass).on(animEndEventName, function() {
      $currPage.off(animEndEventName);
      endCurrPage = true;
      if(endNextPage) {
        if(jQuery.isFunction(callback)) {
          callback(block, $nextPage, $currPage);
        }
        onEndAnimation($currPage, $nextPage, block);
      }
    });

    $nextPage.addClass(inClass).on(animEndEventName, function() {
      $nextPage.off(animEndEventName);
      endNextPage = true;
      if(endCurrPage) {
        onEndAnimation($currPage, $nextPage, block);
      }
    });
  }

  function onEndAnimation($outpage, $inpage, block) {
    resetPage($outpage, $inpage);
    block.data('isAnimating', false);
  }

  function resetPage($outpage, $inpage) {
    $outpage.attr('class', $outpage.data( 'originalClassList'));
    $inpage.attr('class', $inpage.data( 'originalClassList') + ' et-page-current');
  }

  function formatClass(str) {
    classes = str.split(" ");
    output = "";
    for(var n=0; n<classes.length; n++){
      output += " pt-page-" + classes[n];
    }
    return output;
  }
  return {
    init : init,
    nextPage: nextPage,
    animate: animate
  };
})(jQuery);

jQuery(function($) {
  PageTransitions.init();
});
