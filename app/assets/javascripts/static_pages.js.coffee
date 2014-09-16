$(document).ready ->
  # ----- Vaariables and user agent check ----- 
  isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  # ----- Parallax effect on welcome screen ----- 
  $(document).scroll ->
    position = $(document).scrollTop()
    $(".welcome-section .content-wrapper").css opacity: (1 - position / 500)  unless isMobile
    return

  # ----- Collapse navigation on click (Bootstrap 3 is missing it) ----- 
  # $(".nav a").on "click", ->
  #   $("#my-nav").removeClass("in").addClass "collapse"
  #   return

  # # ----- Nice scroll to Sections ----- 
  # $(".navbar-nav li a").click (evt) ->
  #   place = $(this).attr("href")
  #   off_ = $(place).offset().top
  #   $("html, body").animate
  #     scrollTop: off_
  #   , 1200, "easeInOutCubic"
  #   pde evt
  #   return

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

  # ----- Text Rotator ----- 
  $(".rotating-words").textrotator
    animation: "dissolve"
    separator: ","
    speed: 3000

  # ----- Initialize Portfolio Grid ----- 
  initializeGrid()

  # ----- Initializa Parallax effect ----- 
  parallaxed ".parallax"

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

