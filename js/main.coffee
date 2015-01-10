---
---

$ ->
  $("#main_form").submit ->

    if window.social == 'linkedin'
      query = '-intitle:&quot;profiles&quot; -inurl:&quot;dir/ &quot; site:linkedin.com/in/ OR site:linkedin.com/pub/ '+$("#job_input").val()+' &quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()+'&quot;'

    else if window.social == 'google-plus'
      query = 'site:plus.google.com  &quot;lives * '+$("#location_input").val()+'&quot; &quot;work at '+$("#company_input").val()+'&quot; -intext:&quot;Contact Information&quot; inurl:about '+$("#job_input").val()

    else if window.social == 'twitter'
      query = '-inurl:(search|favorites|status|statuses|jobs|lists|media) site:twitter.com -intitle:&quot;'+$("#company_input").val()+'&quot; -intitle:&quot;'+$("#location_input").val()+'&quot; '+$("#job_input").val()+' &quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()

    else if window.social == 'viadeo'
      query = 'site:viadeo.com/*/profile/ '+$("#job_input").val()+' intitle:&quot;'+$("#company_input").val()+'&quot; &quot;'+$("#location_input").val()+'&quot;'

    else if window.social == 'github'
      query = 'site:github.com intext:&quot;joined on&quot; -intitle:&quot;at master&quot; -inurl:(tab|jobs|articles) '+$("#job_input").val()+' '+$("#company_input").val()+' &quot;'+$("#location_input").val()+'&quot;'

    excluded_words = '-'+$("#exclude_input").val().split(" ").join(" -")

    if window.date != 'undefined'
      date = '&tbs='+window.date
    else
      date = ''

    link = 'https://google.com/search?q='+query+' '+excluded_words+'&num=100&pws=0'+date


    $("#result1").html('
      <div class="form-group">
        <input type="text" value="'+link+'" class="form-control input-lg link-input">
      </div>
      <a href="'+link+'" target="_blank" class="btn btn-default btn-lg">
        Ouvrir sur Google
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
          Ouvrir sur Twitter
          <i class="fa fa-external-link"></i>
        </a>
      ')
    else if window.social == 'github'
      github_link = 'https://github.com/search?l='+$("#job_input").val()+'&q=location%3A'+$("#location_input").val()+'&ref=advsearch&type=Users&utf8=%E2%9C%93'
      $("#result2").html('
        <div class="form-group">
          <input type="text" value="'+github_link+'" class="form-control input-lg link-input">
        </div>
        <a href="'+github_link+'" target="_blank" class="btn btn-default btn-lg">
          Ouvrir sur Github
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


window.date = 'undefined'

$ ->
  $('#choose-no-date').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Date indifférente</span>')
    window.date = 'undefined'

  $('#choose-day').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Moins de 24 heures</span>')
    window.date = 'qdr:d'

  $('#choose-week').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Moins d\'une semaine</span>')
    window.date = 'qdr:w'

  $('#choose-month').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Moins d\'un mois</span>')
    window.date = 'qdr:m'

  $('#choose-year').click ->
    $('#selected-date').html('<span class="social"><i class="fa fa-clock-o"></i>Moins d\'un an</span>')
    window.date = 'qdr:y'


$ ->
  $(".advanced_options_link a").click ->
    $("#advanced_options").slideToggle()

$ ->
  $("#open-share-buttons").click ->
    $("#share-buttons").slideToggle()
