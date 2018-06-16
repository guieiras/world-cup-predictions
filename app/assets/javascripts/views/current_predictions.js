$('[js-score]').keyup(function() {
  var matchId = $(this).attr('js-match');
  var gameBox = $('.panel[js-match=' + matchId + ']');
  var homeScore = $('[js-score=home][js-match=' + matchId + ']').val()
  var awayScore = $('[js-score=away][js-match=' + matchId + ']').val()

  if (homeScore !== "" && awayScore !== "" ) {
    gameBox.css('border-color', '#a7a7a7')
    $.post('.', { home: homeScore, away: awayScore, match: matchId  })
    .done(function() {
        setTimeout(function() {
          gameBox.css('border-color', '')
        }, 750)
     })
    .fail(function() {
      gameBox.css('border-color', '#F04864')
    })
  }
})