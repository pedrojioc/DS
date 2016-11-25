$("#post-comments-<%= @comment.item_id %>").append("<%= j render(@comment, locals:{comments:@comment}) %>")
$("[data-input-comment-id='<%= @comment.item_id %>']").val("")