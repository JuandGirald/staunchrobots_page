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
    place = $("body").children("section").eq(1)
    
    # var offsetTop = $('.navbar').outerHeight();
    $("html, body").animate
      scrollTop: $(place).offset().top
    , 1200, "easeInOutCubic"
    pde evt
    return

  # ----- Nice scroll to Sections ----- 
  $(".navbar-nav li a").click (evt) ->
    place = $(this).attr("href")
    off_ = $(place).offset().top
    $("html, body").animate
      scrollTop: off_
    , 1200, "easeInOutCubic"
    pde evt
    return

  # ----- Minimize and darken the Menu Bar ----- 
  $("body").waypoint ((direction) ->
    $(".navbar").toggleClass "minified dark-menu"
    $(".navbar .navbar-brand").fadeToggle "slow", "linear" 
    return
  ),
    offset: "-400px"


  # ----- Text Rotator ----- 
  $(".rotating-words").textrotator
    animation: "dissolve"
    separator: ","
    speed: 3000

  # ----- Initializa Parallax effect ----- 
  parallaxed ".parallax"


  $(".navbar .navbar-brand").hide()

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

