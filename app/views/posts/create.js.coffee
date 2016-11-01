$("#posts").prepend("<%= j render(@post, locals:{post:@post}) %>")
$("#post_body").val("")