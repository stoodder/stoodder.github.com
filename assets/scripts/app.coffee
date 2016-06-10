---
---
#=======================================
# Animate the main screen and logos
#=======================================
$ ->
	$logos = $(".header--logo img")
	$main = $(".main").first()
	$header = $(".header").first()
	$portfolioItems = $(".portfolio--item")

	animate = ->
		#Aimate the logos
		active_logo = $logos.filter(".is-active").first()
		deactivating_logo = $logos.filter(".is-deactivating").first()
		next_logo = active_logo.next()
		next_logo = $logos.first() if next_logo.length <= 0

		deactivating_logo.removeClass("is-deactivating")
		active_logo.removeClass("is-active").addClass("is-deactivating")
		next_logo.addClass("is-active")

		#Animate the main screen
		$main.removeClass( active_logo.data("animation-class") )
		$main.addClass( next_logo.data("animation-class") )
		
		$header.removeClass( active_logo.data("animation-class") )
		$header.addClass( next_logo.data("animation-class") )
		
		$portfolioItems.removeClass( active_logo.data("animation-class") )
		$portfolioItems.addClass( next_logo.data("animation-class") )

		setTimeout(animate, 10000)
	#END animate

	setTimeout(animate, 10000)
#END onReady

#=======================================
# Add triggers for the main skills/foreground
#=======================================
$ ->
	$foreground = $(".main--foreground").first()
	$skills = $(".main--skills").first()

	$skills.on("mouseenter", -> $foreground.addClass("is-faded"))
	$skills.on("mouseleave", -> $foreground.removeClass("is-faded"))
#END onReady
