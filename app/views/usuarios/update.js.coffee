$("#user-avatar .circle").css
	"background-image": "url(<%= @user.avatar.url(:thumb) %>"

$("#user-cover").css
	"background-image": "url(<%= @user.cover.url(:medium) %>"