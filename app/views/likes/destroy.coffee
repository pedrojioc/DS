$("#buttonLike-<%= @origin.id %>").html(" <%= j render partial: 'likes/new', locals: {origin: @origin} %> ")
$("#countLike-<%= @origin.id %>").html("<%= @origin.likes.count %>").removeClass("text-danger").addClass("text-muted")
