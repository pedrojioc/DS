# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.snack = (message, time)->
	$("#buttonAdd").html("")
	#Get the snackbar DIV
	x = $("#snackbar")
	#Isert Message
	x.html(message)
	#Add the 'show' 'class to DIV'
	x.addClass("show")
	setTimeout ->
		x.removeClass("show")
	, time
	console.log "Working"
#===============================================================================
window.loading = false
#===============================================================================
$(document).on "page:load page:fetch ready", ()->
	console.log "It works on each visit!"

	$(".close-parent").on "click", (ev)->
		$(this).parent().slideUp()

	###
	$("#notification").on "click", (ev)->
		#Si las notificaiones son visibles, preventDefault()
		ev.preventDefault() if $("#notifications").hasClass("active")

		#Agregamos o removemos la clase
		$("#notifications").toggleClass("active")

		#Si tiene la clase active, es porque antes no la tenia
		#Si no la tiene, es porque antes si la tenia
		return $("#notifications").hasClass("active")
	###

	$(".best_in_place").best_in_place()
	$(window).scroll ->
		if !window.loading && $(window).scrollTop() > $(document).height() - 850
			console.log "entro"
			window.loading = true
			url = $(".next_page").attr("href")
			$.getScript url if url
#===============================================================================
###
jQuery ->
	$('#search').autocomplete
		source: "/search_suggestions"
###
#===============================================================================
window.App ||= {}

App.search = ->
	$( "#search" ).keyup ->
		term = $(this).val()
		if(term.length == 0)
			$("#result").html('')
			return
		console.log("se ejecuta")
		$.ajax
			method: "POST"
			url:"search_people/search_suggestions"
			data:
				term:term
			dataType : 'json',

			success:(data) ->
				show_result(data)
			
			error:(data) ->
				console.log data
				alert('Ocurrio un error')

show_result = (data) ->
	html = ''
	for i in [0...data.length]
		html+= '<a href="usuarios/'+data[i].id+'" class="list-group-item list-group-item-action">'+data[i].name+'</a>'
	
	$("#result").html(html)