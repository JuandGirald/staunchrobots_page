jQuery ($) ->
  resourcesOptions = {
    itemSelector: ".project_interest_point",
    containerSelector: ".project_interest_point-container",
    addSelector: ".project_interest_point-add",
    removeSelector: ".project_interest_point-remove",
    itemTemplateSelector: ".project_interest_point.template",
    newItemIndex: "new_project_interest_point_item"
  }

  $(".cv-form").nestedFields({
    itemSelector: ".project",
    containerSelector: ".projects-container",
    addSelector: ".project-add",
    removeSelector: ".project-remove",
    itemTemplateSelector: ".project.template",
    newItemIndex: "new_project_item",
    afterInsert: (item) ->
      # Applies nestedFields to this projects's resources
      item.find(".nested-level-2").nestedFields(resourcesOptions)
      # Inserts a project_interest_points item
      item.find(".nested-level-2").nestedFields("insert")
  })

  # Applies nestedFields to all projects on page
  $(".cv-form").find(".nested-level-2").nestedFields(resourcesOptions)
  $("#educations, #skills, #experiences, #languages, #code_samples").nestedFields()


  $books = $("#bk-list > li > div.bk-book")
  booksCount = $books.length
  $books.each ->
    $book = $(this)
    $other = $books.not($book)
    $parent = $book.parent()
    $bookview = $parent.find("button.bk-bookview")
    $gif = $book.children("div.bk-back").children()
    $back = $book.children("div.bk-back")
    $front = $book.children("div.bk-front")
    current = 0
    $front.hover (->
      $back.addClass 'expand'
      return
    ), ->
      $back.removeClass 'expand'
      return

    $parent.find("button.bk-bookback, div.bk-front").on "click", ->
      $front.removeClass "bk-active"
      if $book.data("flip")
        $book.data(
          opened: false
          flip: false
        ).removeClass("bk-viewback").addClass "bk-bookdefault"
        $gif.addClass "hidden"
      else
        $book.data(
          opened: false
          flip: true
        ).removeClass("bk-viewinside bk-bookdefault").addClass "bk-viewback"
        $gif.removeClass "hidden"
      return
  return