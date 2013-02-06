# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# $ ->
# 	# change_check_box = (event) ->
# 	# 	event.preventDefault()
# 	# 	$(this).parents('form:first').submit()
# 	# 	console.log "OK"
# 	$("table form input[type = 'submit']").hide()
# 	# $("table form input[type = 'checkbox']").live("change", change_check_box)

# # 	close_alert = (event) ->
# # 		$(this).remove()
# # 	$(".alert").delay(500).fadeOut("slow", close_alert)

ready = ->
 	###close_alert = (event) ->
		$(this).remove()
	$(".alert").delay(500).fadeOut("slow", close_alert)###

	$("table form input[type = 'submit']").hide()

	$('input[type=checkbox]').click ->
		$(this).parent('form').submit()
		console.log "OK"
	

$(document).ready(ready)
$(document).on('page:load', ready)