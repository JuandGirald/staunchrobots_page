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
  $("#educations, #skills, #experiences").nestedFields()