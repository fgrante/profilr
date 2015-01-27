---
---

#
# Submit main form
#

$ ->
  $("#main_form").submit ->

    $("html, body").animate
      scrollTop: $("#find_button").offset().top
    , "slow"
    false

    if window.social == 'linkedin'
      query = '-intitle:&quot;profiles&quot; -inurl:&quot;dir/ &quot; site:linkedin.com/in/ OR site:linkedin.com/pub/ '+$("#job_input").val()+' -intitle:&quot;'+$("#job_input").val()+'&quot; &quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()+'&quot;'

    else if window.social == 'google-plus'
      query = 'site:plus.google.com -inurl:&quot;app/basic/&quot; &quot;lives * '+$("#location_input").val()+'&quot; &quot;works at '+$("#company_input").val()+'&quot; -intext:&quot;Contact Information&quot; inurl:about '+$("#job_input").val()

    else if window.social == 'twitter'
      query = '-inurl:(search|favorites|status|statuses|jobs|lists|media) site:twitter.com -intitle:&quot;'+$("#job_input").val()+'&quot; -intitle:&quot;'+$("#company_input").val()+'&quot; -intitle:&quot;'+$("#location_input").val()+'&quot; '+$("#job_input").val()+' &quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()

    else if window.social == 'viadeo'
      query = 'site:viadeo.com/*/profile/ '+$("#job_input").val()+' intitle:&quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()+'&quot;'

    else if window.social == 'github'
      query = 'site:github.com intext:&quot;joined on&quot; -intitle:&quot;at master&quot; -inurl:(tab|jobs|articles) '+$("#job_input").val()+' '+$("#company_input").val()+' &quot;'+$("#location_input").val()+'&quot;'

    else if window.social == 'dribbble'
      query = '-inurl:(jobs|highlights|shots|designers|teams|meetups|goods|projects|buckets|colors|tags|about|click|followers|following|likes|page) -site:&quot;blog.dribbble.com&quot; site:dribbble.com -intitle:&quot;'+$("#job_input").val()+'&quot; -intitle:&quot;'+$("#company_input").val()+'&quot; -intitle:&quot;'+$("#location_input").val()+'&quot; '+$("#job_input").val()+' '+$("#company_input").val()+' &quot;'+$("#location_input").val()+'&quot;'

    excluded_words = '-'+$("#exclude_input").val().split(" ").join(" -")

    if window.date != 'undefined'
      date = '&tbs='+window.date
    else
      date = ''

    link = 'https://google.com/search?q='+query+' '+excluded_words+'&num=100&pws=0&filter=0'+date


    $("#result1").html('
      <div class="form-group">
        <input type="text" value="'+link+'" class="form-control input-lg link-input">
      </div>
      <a href="'+link+'" target="_blank" class="btn btn-default btn-lg">
        Open on Google
        <i class="fa fa-external-link"></i>
      </a>
    ')

    if window.social == 'twitter'
      twitter_link = 'https://twitter.com/search?mode=users&q='+$("#company_input").val()+' '+$("#location_input").val()
      $("#result2").html('
        <div class="form-group">
          <input type="text" value="'+twitter_link+'" class="form-control input-lg link-input">
        </div>
        <a href="'+twitter_link+'" target="_blank" class="btn btn-default btn-lg">
          Open on Twitter
          <i class="fa fa-external-link"></i>
        </a>
      ')
    else if window.social == 'github'
      github_link = 'https://github.com/search?l='+$("#job_input").val()+'&q=location%3A&quot;'+$("#location_input").val()+'&quot; '+$("#company_input").val()+'&ref=advsearch&type=Users&utf8=%E2%9C%93'
      $("#result2").html('
        <div class="form-group">
          <input type="text" value="'+github_link+'" class="form-control input-lg link-input">
        </div>
        <a href="'+github_link+'" target="_blank" class="btn btn-default btn-lg">
          Open on Github
          <i class="fa fa-external-link"></i>
        </a>
      ')
    else
      $("#result2").html('')

    $(".link-input").click ->
      $(this).select()

    return false

$ ->
  $('.dropdown-toggle').dropdown()


#
# Choice of social network
#

window.social = 'linkedin'

$ ->
  $('#choose-linkedin').click ->
    $('#selected-social').html('<span class="social"><i class="fa fa-linkedin"></i>LinkedIn</span>')
    window.social = 'linkedin'

  $('#choose-twitter').click ->
    $('#selected-social').html('<span class="social"><i class="fa fa-twitter"></i>Twitter</span>')
    window.social = 'twitter'

  $('#choose-viadeo').click ->
    $('#selected-social').html('<span class="social"><i class="el-icon-viadeo"></i>Viadeo</span>')
    window.social = 'viadeo'

  $('#choose-google-plus').click ->
    $('#selected-social').html('<span class="social"><i class="fa fa-google-plus"></i>Google+</span>')
    window.social = 'google-plus'

  $('#choose-github').click ->
    $('#selected-social').html('<span class="social"><i class="fa fa-github"></i>Github</span>')
    window.social = 'github'

  $('#choose-dribbble').click ->
    $('#selected-social').html('<span class="social"><i class="fa fa-dribbble"></i>Dribbble</span>')
    window.social = 'dribbble'

window.date = 'undefined'


#
# Choice of time
#

$ ->
  $('#choose-no-date').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Any time</span>')
    window.date = 'undefined'

  $('#choose-day').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Past 24 hours</span>')
    window.date = 'qdr:d'

  $('#choose-week').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Past week</span>')
    window.date = 'qdr:w'

  $('#choose-month').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Past month</span>')
    window.date = 'qdr:m'

  $('#choose-year').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Past year</span>')
    window.date = 'qdr:y'


#
# Show / hide advanced options
#

$ ->
  $(".advanced_options_link a").click ->
    if $("#advanced_options").is(":visible")
      $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Any time</span>')
      window.date = 'undefined'
      $("#exclude_input").val('')
      $("#advanced_options").slideUp()
      console.log "ok"
    else
      $("#advanced_options").slideDown()

$ ->
  $("#open-share-buttons").click ->
    $("#share-buttons").slideToggle()


#
# Show examples
#

$ ->
  $("#example1").click ->
    $("#job_input").val("ruby (developer|software engineer)")
    $("#company_input").val("")
    $("#location_input").val("san francisco")
    $('#selected-social').html('<span class="social"><i class="fa fa-linkedin"></i>LinkedIn</span>')
    window.social = 'linkedin'

$ ->
  $("#example2").click ->
    $("#job_input").val("")
    $("#company_input").val("google")
    $("#location_input").val("")
    $('#selected-social').html('<span class="social"><i class="fa fa-google-plus"></i>Google+</span>')
    window.social = 'google-plus'

$ ->
  $("#example3").click ->
    $("#job_input").val("")
    $("#company_input").val("")
    $("#location_input").val("berlin")
    $('#selected-social').html('<span class="social"><i class="fa fa-dribbble"></i>Dribbble</span>')
    window.social = 'dribbble'


#
# On ferme l'onboarding
#

$ ->
  $("#close-onboarding").click ->
    $(".welcome-message").hide ->
      $(".onboarding-link").show ->
        $.cookie("onboarding", "1", { expires: 60 });


#
# On ferme l'onboarding
#

$ ->
  $(".onboarding-link a").click ->
    $(".welcome-message").show ->
      $(".onboarding-link").hide ->
        $.cookie("onboarding", null);



#
# Affichage de ou pas l'onboarding en fonction du cookie
#

$ ->
  if $.cookie("onboarding") != "1"
    $(".welcome-message").show()


#
# Affichage du lien vers l'onboarding en fonction du cookie
#

$ ->
  if $.cookie("onboarding") == "1"
    $(".onboarding-link").show()


#
# Toltips
#
$ ->
  $("[rel='tooltip']").tooltip()


#
# jQuery Cookie
#
((factory) ->
  if typeof define is "function" and define.amd

    # AMD
    define ["jquery"], factory
  else if typeof exports is "object"

    # CommonJS
    factory require("jquery")
  else

    # Browser globals
    factory jQuery
  return
) ($) ->
  encode = (s) ->
    (if config.raw then s else encodeURIComponent(s))
  decode = (s) ->
    (if config.raw then s else decodeURIComponent(s))
  stringifyCookieValue = (value) ->
    encode (if config.json then JSON.stringify(value) else String(value))
  parseCookieValue = (s) ->

    # This is a quoted cookie as according to RFC2068, unescape...
    s = s.slice(1, -1).replace(/\\"/g, "\"").replace(/\\\\/g, "\\")  if s.indexOf("\"") is 0
    try

      # Replace server-side written pluses with spaces.
      # If we can't decode the cookie, ignore it, it's unusable.
      # If we can't parse the cookie, ignore it, it's unusable.
      s = decodeURIComponent(s.replace(pluses, " "))
      return (if config.json then JSON.parse(s) else s)
    return
  read = (s, converter) ->
    value = (if config.raw then s else parseCookieValue(s))
    (if $.isFunction(converter) then converter(value) else value)
  pluses = /\+/g
  config = $.cookie = (key, value, options) ->

    # Write
    if arguments.length > 1 and not $.isFunction(value)
      options = $.extend({}, config.defaults, options)
      if typeof options.expires is "number"
        days = options.expires
        t = options.expires = new Date()
        t.setTime +t + days * 864e+5
      # use expires attribute, max-age is not supported by IE
      return (document.cookie = [
        encode(key)
        "="
        stringifyCookieValue(value)
        (if options.expires then "; expires=" + options.expires.toUTCString() else "")
        (if options.path then "; path=" + options.path else "")
        (if options.domain then "; domain=" + options.domain else "")
        (if options.secure then "; secure" else "")
      ].join(""))

    # Read
    result = (if key then `undefined` else {})

    # To prevent the for loop in the first place assign an empty array
    # in case there are no cookies at all. Also prevents odd result when
    # calling $.cookie().
    cookies = (if document.cookie then document.cookie.split("; ") else [])
    i = 0
    l = cookies.length

    while i < l
      parts = cookies[i].split("=")
      name = decode(parts.shift())
      cookie = parts.join("=")
      if key and key is name

        # If second argument (value) is a function it's a converter...
        result = read(cookie, value)
        break

      # Prevent storing a cookie that we couldn't decode.
      result[name] = cookie  if not key and (cookie = read(cookie)) isnt `undefined`
      i++
    result

  config.defaults = {}
  $.removeCookie = (key, options) ->
    return false  if $.cookie(key) is `undefined`

    # Must not alter options, thus extending a fresh object...
    $.cookie key, "", $.extend({}, options,
      expires: -1
    )
    not $.cookie(key)

  return
