$('[js-score]').keyup(function() {
  var matchId = $(this).attr('js-match');
  var gameStatus = $('.panel[js-match=' + matchId + ']').find('.game-status');
  var homeScore = $('[js-score=home][js-match=' + matchId + ']').val()
  var awayScore = $('[js-score=away][js-match=' + matchId + ']').val()

  if (homeScore !== "" && awayScore !== "" ) {
    gameStatus.addClass(['fa-spin', 'fa-spinner'])
    $.post('/predictions', { home: homeScore, away: awayScore, match: matchId  })
    .done(function() {
      setTimeout(function() {
        gameStatus.removeClass(['fa-spin', 'fa-spinner'])
        gameStatus.addClass('fa-check')
        gameStatus.animate({
          opacity: 0.15
        }, 3000, function () {
          gameStatus.removeClass('fa-check')
          gameStatus.css('opacity', 1)
        });
      }, 750)
    })
    .fail(function() {
      gameStatus.removeClass(['fa-spin', 'fa-spinner'])
      gameStatus.addClass('fa-exclamation-triangle')
    })
  }
})
