json.comment do
	json.id @comment.id
	json.body @comment.body
	json.user_id @comment.user_id
	json.created_at @comment.created_at
	json.updated_at @comment.updated_at
end