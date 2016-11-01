$(document).on "click", ".file-activate", (ev)->
	selector = $(this).attr("for")
	$(selector).click()

$(document).on "change", ".remotipart", (ev)->
	console.log "Cambio activado"
	$(this).parent().submit()