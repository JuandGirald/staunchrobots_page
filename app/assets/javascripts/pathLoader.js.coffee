((window) ->
  PathLoader = (el) ->
    @el = el
    
    # clear stroke
    @el.style.strokeDasharray = @el.style.strokeDashoffset = @el.getTotalLength()
    return
  "use strict"
  PathLoader::_draw = (val) ->
    @el.style.strokeDashoffset = @el.getTotalLength() * (1 - val)
    return

  PathLoader::setProgress = (val, callback) ->
    @_draw val
    
    # give it a time (ideally the same like the transition time) so that the last progress increment animation is still visible.
    setTimeout callback, 200  if callback and typeof callback is "function"
    return

  PathLoader::setProgressFn = (fn) ->
    fn this  if typeof fn is "function"
    return

  
  # add to global namespace
  window.PathLoader = PathLoader
  return
) window


$(document).ready ->
  
  # animation end event name
  init = ->
    onEndInitialAnimation = ->
      @removeEventListener animEndEventName, onEndInitialAnimation  if support.animations
      startLoading()
      return

    
    # disable scrolling
    window.addEventListener "scroll", noscroll
    
    # initial animation
    classie.add container, "loading"
    if support.animations
      container.addEventListener animEndEventName, onEndInitialAnimation
    else
      onEndInitialAnimation()
    return

  startLoading = ->
    
    # simulate loading something..
    simulationFn = (instance) ->
      progress = 0
      interval = setInterval(->
        progress = Math.min(progress + Math.random() * 0.1, 1)
        instance.setProgress progress
        
        # reached the end
        if progress is 1
          classie.remove container, "loading"
          classie.add container, "loaded"
          clearInterval interval
          onEndHeaderAnimation = (ev) ->
            if support.animations
              return  if ev.target isnt header
              @removeEventListener animEndEventName, onEndHeaderAnimation
            classie.add document.body, "layout-switch"
            window.removeEventListener "scroll", noscroll
            return

          if support.animations
            header.addEventListener animEndEventName, onEndHeaderAnimation
          else
            onEndHeaderAnimation()
        return
      , 80)
      return

    loader.setProgressFn simulationFn
    return

  noscroll = ->
    window.scrollTo 0, 0
    return

  support = animations: Modernizr.cssanimations
  container = document.getElementById("ip-container")
  header = container.querySelector("header.ip-header")
  loader = new PathLoader(document.getElementById("ip-loader-circle"))
  animEndEventNames =
    WebkitAnimation: "webkitAnimationEnd"
    OAnimation: "oAnimationEnd"
    msAnimation: "MSAnimationEnd"
    animation: "animationend"

  animEndEventName = animEndEventNames[Modernizr.prefixed("animation")]
  init()
  return


((window) ->
  
  # class helper functions from bonzo https://github.com/ded/bonzo
  classReg = (className) ->
    new RegExp("(^|\\s+)" + className + "(\\s+|$)")
  
  # classList support for class management
  # altho to be fair, the api sucks because it won't accept multiple classes at once
  toggleClass = (elem, c) ->
    fn = (if hasClass(elem, c) then removeClass else addClass)
    fn elem, c
    return
  "use strict"
  hasClass = undefined
  addClass = undefined
  removeClass = undefined
  if "classList" of document.documentElement
    hasClass = (elem, c) ->
      elem.classList.contains c

    addClass = (elem, c) ->
      elem.classList.add c
      return

    removeClass = (elem, c) ->
      elem.classList.remove c
      return
  else
    hasClass = (elem, c) ->
      classReg(c).test elem.className

    addClass = (elem, c) ->
      elem.className = elem.className + " " + c  unless hasClass(elem, c)
      return

    removeClass = (elem, c) ->
      elem.className = elem.className.replace(classReg(c), " ")
      return
  classie =
    
    # full names
    hasClass: hasClass
    addClass: addClass
    removeClass: removeClass
    toggleClass: toggleClass
    
    # short names
    has: hasClass
    add: addClass
    remove: removeClass
    toggle: toggleClass

  
  # transport
  if typeof define is "function" and define.amd
    
    # AMD
    define classie
  else
    
    # browser global
    window.classie = classie
  return
) window