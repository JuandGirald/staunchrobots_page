$(document).ready ->
  # ----- Vaariables and user agent check ----- 
  isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  # ----- Function to prevent Default Events ----- 
  pde = (e) ->
    if e.preventDefault
      e.preventDefault()
    else
      e.returnValue = false
    return

  # ----- Darken the revealed menu on mobile ----- 
  $(".navbar-toggle").on "click", ->
    unless $(".navbar-collapse").hasClass("in")
      $(".navbar").addClass "darken-menu"
    else $(".navbar").removeClass "darken-menu"  if $(".navbar-collapse").hasClass("in")
    return

  # ----- Parallax effect on welcome screen ----- 
  $(document).scroll ->
    position = $(document).scrollTop()
    $(".welcome-section .content-wrapper").css opacity: (1 - position / 500)  unless isMobile
    return

  # ----- Collapse navigation on click (Bootstrap 3 is missing it) ----- 
  $(".nav a").on "click", ->
    $("#my-nav").removeClass("in").addClass "collapse"
    return

  # ----- Scroll down from Welcome screen ----- 
  $(".welcome-section .box h1").click (evt) ->
    place = $("body section").eq(1)
    # var offsetTop = $('.navbar').outerHeight();
    $("html, body").animate
      scrollTop: $(place).offset().top
    , 1200, "easeInOutCubic"
    pde evt
    $('#about-menu').addClass('active')
    return

  # ----- Nice scroll to Sections ----- 
  $(".navbar-nav-home li a").click (evt) ->
    place = $(this).attr("href")
    off_ = $(place).offset().top
    $("html, body").animate
      scrollTop: off_
    , 1200, "easeInOutQuart"
    pde evt
    # location.hash = place
    # #add the active class
    # $('ul.nav.navbar-nav li').removeClass('active')
    # $(place+'-menu').addClass('active')
    return

  # ----- Minimize and darken the Menu Bar ----- 
  $("body").waypoint ((direction) ->
    $(".navbar1").removeClass "hidden"
    $(".navbar").addClass "minified dark-menu"
    $(".navbar2").addClass "navbar-fixed-top"
    return
  ),
    offset: "-500px"

  $("body").waypoint ((direction) ->
    $(".navbar2").addClass "navbar-fixed-top"
    return
  ),
    offset: "-200px"

  $("body").waypoint ((direction) ->
    $(".navbar2").removeClass "navbar-fixed-top"
    return
  ),
    offset: "-100px"


  $("body").waypoint ((direction) ->
    $(".navbar").show "fast", "linear" 
    return
  ),
    offset: "-500px"

  # Scroll on Top
  $(".scrolltotop, .navbar-brand").click (e) ->
    $("html, body").animate
      scrollTop: "0"
    , 1200, "easeInOutCubic"
    pde e
    return



  # ----- Filterable Portfolio effect ----- 
  $("ul.og-grid li").append "<div class='hidden-overlay'></div>"
  $("ul.filter-list li").click ->
    $(this).css "outline", "none"
    $("ul.filter-list .active").removeClass "active"
    $(this).addClass "active"
    filterVal = $(this).attr("data-id")
    if filterVal is "all"
      $("ul.og-grid li.hidden-item").addClass "visible-item"
      $("ul.og-grid li.hidden-item").removeClass("hidden-item").animate
        opacity: 1
      , 600
    else
      $("ul.og-grid li").each ->
        attrArr = $(this).attr("data-id").split(" ")
        found = $.inArray(filterVal, attrArr)
        if found is -1
          $(this).animate
            opacity: 0.2
          , 600, ->
            $(this).removeClass("visible-item").addClass "hidden-item"
            return

        else
          $(this).addClass "visible-item"
          $(this).removeClass("hidden-item").animate
            opacity: 1
          , 600
        return
    false

  # ----- Testimonials rotator ----- 
  $("#testimonials-rotator").cbpQTRotator(interval : 8000)

  # ----- Text Rotator ----- 
  $(".rotating-words").textrotator
    animation: "dissolve"
    separator: ","
    speed: 3000

  # ----- Initialize Portfolio Grid ----- 
  #initializeGrid()

  # ----- Initializa Parallax effect ----- 
  parallaxed ".parallax"

  
  # ----- Show Navbar when reload----- 
  position = $(document).scrollTop()
  headerHeight = $("#welcome").outerHeight()

  if location.pathname == '/' and position <= headerHeight - 300
    $(".navbar1").addClass "hidden"

  # if position <= headerHeight - 300
  #   # $(".navbar").hide()
  # else
  #   $(".navbar").removeClass "hidden"
  # return


# ----- Functions ----- 
initializeGrid = ->
  Grid.init()
  return

parallaxed = (obj) ->
  $(window).bind "load resize scroll", ->
    $(obj).each ->
      windowHeight = $(window).height()
      windowWidth = $(window).width()
      scrollPos = $(window).scrollTop()
      objectPos = $(this).offset().top
      position = objectPos - scrollPos
      
      return

    return

  return

