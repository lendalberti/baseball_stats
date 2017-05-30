require 'nokogiri'
require 'byebug'


# ----------------------------------------
def get_batting_avg( player )
  hits = player.xpath('HITS').text
  at_bats = player.xpath('AT_BATS').text 
  avg = '%.3f' % (hits.to_f/at_bats.to_f)
  avg.sub!(/^0/, "")
end

# ----------------------------------------
def get_player_ops( player )
  h = player.xpath('HITS').text.to_i
  bb = player.xpath('WALKS').text.to_i
  hbp = player.xpath('HIT_BY_PITCH').text.to_i
  ab = player.xpath('AT_BATS').text.to_i
  sf = player.xpath('SACRIFICE_FLIES').text.to_i
  
  h2 = 2*player.xpath('DOUBLES').text.to_i
  h3 = 3*player.xpath('TRIPLES').text.to_i
  h4 = 4*player.xpath('HOME_RUNS').text.to_i

  tb = h + h2 + h3 + h4
  if tb > 0
    obp = ((h+bb+hbp).to_f/(ab+bb+sf+hbp).to_f).round(3)
    slg = (tb.to_f/ab.to_f).round(3)
    ops = '%.3f' % (obp + slg)
    ops.sub!(/^0/, "")
    ops
  else
    0
  end
end


# ----------------------------------------
def save_player_stats(obj, team_id)
  batting = ["SURNAME", "GIVEN_NAME", "POSITION", "GAMES", "GAMES_STARTED", "AT_BATS", "RUNS", "HITS", "DOUBLES", "TRIPLES", "HOME_RUNS", "RBI", "STEALS", "CAUGHT_STEALING", "SACRIFICE_HITS", "SACRIFICE_FLIES", "ERRORS", "PB", "WALKS", "STRUCK_OUT", "HIT_BY_PITCH"]
  pitching = ["SURNAME", "GIVEN_NAME", "THROWS", "POSITION", "WINS", "LOSSES", "SAVES", "GAMES", "GAMES_STARTED", "COMPLETE_GAMES", "SHUT_OUTS", "ERA", "INNINGS", "HOME_RUNS", "RUNS", "EARNED_RUNS", "HIT_BATTER", "WILD_PITCHES", "BALK", "WALKED_BATTER", "STRUCK_OUT_BATTER"]

  player = Player.new
  if obj.xpath('POSITION').text =~ /^.+Pitcher$/
    pitching.each do |pitcher|
      field = pitcher.downcase
      player["#{field}"] = obj.xpath(pitcher).text
    end
  else
    batting.each do |batter|
      field = batter == 'ERRORS' ? batter : batter.downcase    #  don't lowercase 'ERRORS' because 'errors' is already defined in Active Record
      player["#{field}"] = obj.xpath(batter).text
      player.avg = get_batting_avg( obj )
      player.ops = get_player_ops( obj )
    end
  end

  player.team_id = team_id
  player.save
end


# ----------------------------
def get_new_id(obj, name)
  m = obj.new(name: name) 
  if m.save 
    m.id
  else
    nil
  end
end


# ----------------------------  
def process_data(rec)
  results   = Season.find_by(name: rec[:year].text)
  season_id = results ? results.id : get_new_id(Season, rec[:year].text)

  results   = League.find_by(name: rec[:league].xpath('LEAGUE_NAME').text)
  league_id = results ? results.id : get_new_id(League, rec[:league].xpath('LEAGUE_NAME').text)  

  results     = Division.find_by(name: rec[:division].xpath('DIVISION_NAME').text)
  division_id = results ? results.id : get_new_id(Division, rec[:division].xpath('DIVISION_NAME').text)

  results = Team.find_by(name: rec[:team].xpath('TEAM_CITY').text + " " + rec[:team].xpath('TEAM_NAME').text)
  team_id = results ? results.id : get_new_id(Team, rec[:team].xpath('TEAM_CITY').text + " " + rec[:team].xpath('TEAM_NAME').text)

  if !save_player_stats(rec[:player], team_id)
    puts "\nCouldn't save stats for: #{player.xpath('GIVEN_NAME').text} #{player.xpath('SURNAME').text}"
  end

end
