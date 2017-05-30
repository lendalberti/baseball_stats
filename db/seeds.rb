require_relative 'seeds_helper' 

# ---------------------------- Start
[Season,League,Division,Team,Player].each do |model|
  model.delete_all
end

xml_file = File.join(File.dirname(__FILE__), "1998statistics.xml")
doc = Nokogiri::XML(File.open xml_file)
count = 0

if doc
  seasons = doc.xpath('//SEASON') 
  seasons.each do |season|
    years = season.xpath('//YEAR') 
    years.each do |year|
      leagues = year.xpath('//LEAGUE')
      leagues.each do |league|
        divisions = league.xpath('DIVISION') 
        divisions.each do |division|
          teams = division.xpath('TEAM') 
          teams.each do |team|
            players = team.xpath('PLAYER')
            players.each do |player|
              record = {year: year, league: league, division: division, team: team, player:player}
              process_data(record)
              count += 1
              print "Players processed: #{count}\r"              
            end
          end
        end
      end
    end
  end
end
puts "\nDone.\n"
