require "starruby"
include StarRuby

font = Font.new("MS UI Gothic", 24)
white = Color.new(255, 255, 255)

lines = ""
File.open("data1.txt", "r") do |io|
	lines = io.readlines
end

cnt = 0
pos_x = 8
pos_y = rand(10) * 40

Game.run(640, 480) do |game|
	cnt += 1

	lines.each{|line|
		pos_x = pos_x + 1
		game.screen.render_text(line.chomp, pos_x, pos_y, font, white)
	}

	if pos_x > 600 then
		pos_x = 10
		pos_y = rand(10) * 40
	end
	if cnt.modulo(10) == 0 then
		game.screen.clear
	end

end