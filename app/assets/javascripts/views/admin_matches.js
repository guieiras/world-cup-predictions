$.get("/admin/teams")
  .done(function(teams) {
    $(".select2").select2({
      data: teams.map(function(team) {
        return {
          id: team.id,
          text: team.name,
          flagURL: team.flag_url
        }
      }),
      templateResult: function(team) {
        return $('<span><img src="' + team.flagURL + '" class="team-flag-icon" /> ' + team.text + '</span>')
      },
      width: '100%'
    })
  })