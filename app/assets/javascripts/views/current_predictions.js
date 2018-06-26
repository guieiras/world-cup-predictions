(function() {
  var postResult = function (homeScore, awayScore, homePenalty, awayPenalty, matchId, $control) {
    homePenalty = (homeScore === awayScore) ? homePenalty : "";
    awayPenalty = (homeScore === awayScore) ? awayPenalty : "";
    $control.addClass(['fa-spin', 'fa-spinner']);
    $.post('/predictions', {
      home: homeScore, away: awayScore, home_penalty: homePenalty, away_penalty: awayPenalty, match: matchId
    })
      .done(function () {
        setTimeout(function () {
          $control.removeClass(['fa-spin', 'fa-spinner'])
          $control.addClass('fa-check')
          $control.animate({
            opacity: 0.5
          }, 1000, function () {
            $control.removeClass('fa-check')
            $control.css('opacity', 1)
          });
        }, 500)
      })
      .fail(function () {
        $control.removeClass(['fa-spin', 'fa-spinner'])
        $control.addClass('fa-exclamation-triangle')
      });
  }

  $('input[js-match]').each(function() {
    var matchId = $(this).attr('js-match');
    var gameStatus = $('.panel[js-match=' + matchId + ']').find('.game-status')[0];
    var inputHomeScore = $('[js-score=home][js-match=' + matchId + ']')[0];
    var inputAwayScore = $('[js-score=away][js-match=' + matchId + ']')[0];
    var inputHomePenalty = $('[js-penalty=home][js-match=' + matchId + ']')[0];
    var inputAwayPenalty = $('[js-penalty=away][js-match=' + matchId + ']')[0];

    var controlInputs = function(event) {
      var homeScore = inputHomeScore.value;
      var awayScore = inputAwayScore.value;
      var homePenalty = inputHomePenalty && inputHomePenalty.value;
      var awayPenalty = inputAwayPenalty && inputAwayPenalty.value;

      if (homeScore !== "" && awayScore !== "") {
        if ((homeScore === awayScore) && inputHomePenalty && inputAwayPenalty)  {
          $(inputHomePenalty).show();
          $(inputAwayPenalty).show();
        } else {
          $(inputHomePenalty).hide();
          $(inputAwayPenalty).hide();
        }
        if ((!(inputHomePenalty && inputAwayPenalty) || (homeScore !== awayScore) || (homePenalty && awayPenalty && (homePenalty !== awayPenalty))) && !event.skipRequest) {
          postResult(homeScore, awayScore, homePenalty, awayPenalty, matchId, $(gameStatus))
        }
      }
    }

    $(this).keyup(controlInputs);
    controlInputs({ skipRequest: true });
  })
})();
