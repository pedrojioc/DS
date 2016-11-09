$("#buttonLike-<%= @origin.id %>").html(" <%= j render partial: 'likes/show', locals: {like: @like} %> ")
$("#countLike-<%= @origin.id %>").html("<%= @origin.likes.count %>").removeClass("text-muted").addClass("text-danger")
