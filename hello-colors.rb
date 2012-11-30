require "starruby"
include StarRuby

font = Font.new("MS UI Gothic", 24)

col_red = Color.new(255, 17, 13)
col_pink = Color.new(255, 7, 205)
col_purple = Color.new(152, 0, 255)
col_blue = Color.new(21, 5, 255)
col_sky = Color.new(12, 170, 255)
col_green = Color.new(7, 255, 57)
col_yellow = Color.new(246, 255, 12)
col_orange = Color.new(255, 100, 5)

cols = [col_red, col_pink, col_purple, col_blue, col_sky, col_green, col_yellow, col_orange]

pos_x = Array.new
pos_y = Array.new

for i in 0..9
    pos_x[i] = rand(10) * 60
    pos_y[i] = rand(10) * 40
end

lines = Array.new

File.open("data.txt", "r") do |io|
	lines = io.readlines
end

cnt = 0

Game.run(640, 480) do |game|
	cnt += 1
	id = 0
	lines.each{|line|
		pos_x[id] = pos_x[id] + 2
		col = cols[cnt.modulo(8)]
		game.screen.render_text(line.chomp, pos_x[id], pos_y[id], font, col)
		id += 1
	}
	
	id = 0
	pos_x.each{|px|
		if px > 600 then
			pos_x[id] = rand(10) * 10
		end
		id += 1
	}

	if cnt.modulo(8) == 0 then
		game.screen.clear
	end

end