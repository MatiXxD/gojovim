return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		local dashboard_v1 = {
			[[ ⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⣾⡳⣼⣆⠀⠀⢹⡄⠹⣷⣄⢠⠇⠻⣷⣶⢀⣸⣿⡾⡏⠀⠰⣿⣰⠏⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⣀⣀⣀⡹⣟⡪⢟⣷⠦⠬⣿⣦⣌⡙⠿⡆⠻⡌⠿⣦⣿⣿⣿⣿⣦⣿⡿⠟⠚⠉⠀⠉⠳⣄⡀⠀⠀    ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⡀⢀⣼⣟⠛⠛⠙⠛⠉⠻⢶⣮⢿⣯⡙⢶⡌⠲⢤⡑⠀⠈⠛⠟⢿⣿⠛⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀   ]],
			[[ ⠀⠀⠀⠀⠀⡸⠯⣙⠛⢉⣉⣙⣿⣿⡳⢶⣦⣝⢿⣆⠉⠻⣄⠈⢆⢵⡈⠀⠀⢰⡆⠀⣼⠓⠀⠀⠀  Nah    ⠈⣷⠀   ]],
			[[ ⠀⠀⠀⠖⠉⠻⣟⡿⣿⣭⢽⣽⣶⣈⢛⣾⣿⣧⠀⠙⠓⠀⠑⢦⡀⠹⣧⢂⠀⣿⡇⢀⣿⠺⠇    I'd      ⣿⠀  ]],
			[[ ⠀⠀⠀⠀⠐⠈⠉⢛⣿⣿⣶⣤⣈⠉⣰⣗⡈⢛⣇⠀⣵⡀⠀⠘⣿⡄⢻⣤⠀⢻⡇⣼⣧⣿⡄⠀⠀  Win⠀     ⡿⠀⠀ ]],
			[[ ⠀⠀⠀⠀⠀⣠⣾⣿⢍⡉⠛⠻⣷⡆⠨⣿⣭⣤⣍⠀⢹⣷⡀⠀⠹⣿⡄⠈⠀⢿⠁⣿⣿⠏⠀            ⠀⣇⠀  ]],
			[[ ⠀⣿⣇⣠⣾⣿⣛⣲⣿⠛⠀⠀⢀⣸⣿⣿⣟⣮⡻⣷⣤⡙⢟⡀⠀⠙⢧⠀⠀⠎⠀⠉⠁⠰⣿⠀⠀          ⢀⡿⠀⠀ ]],
			[[ ⠀⠈⢻⣿⣿⣽⣿⣿⣿⣴⡏⠚⢛⣈⣍⠛⠛⠿⢦⣌⢙⠻⡆⠁⠀⠀⠀⣴⣦⠀⠀⠀⠐⢳⢻⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠮⠀⠀⠀  ]],
			[[ ⠀⠀⠈⠙⣿⣧⣶⣿⠿⣧⣴⣿⢻⡉⠀⢀⣠⣴⣾⡟⠿⠃⠁⣠⣤⡶⣾⡟⠅⠀⣀⡄⠀⣾⢸⣿⣏⢻⢶⣦⣤⣤⣄⢶⣾⣿⣡⣤⡄⠀  ]],
			[[ ⠀⠀⣠⣞⣋⣿⣿⣾⣿⡿⡛⣹⡟⣤⢰⡿⠟⠉⣀⣀⣤⣤⡠⠙⢁⣾⡿⠂⠀⣿⠟⣁⠀⣹⠀⣹⣿⡟⣼⣿⣿⣌⣿⣞⣿⣿⠁⠀⠀⠀  ]],
			[[ ⠀⢠⡿⢛⢟⣿⣿⣿⣿⣿⣿⡟⣼⣿⣟⢓⠛⣿⣏⣿⣵⣗⣵⣴⣿⢟⡵⣣⣼⣿⢟⣵⣶⢻⣶⣿⠀⠀⣈⢻⣿⣿⣿⢿⣾⢿⣧⠀⠀⠀  ]],
			[[ ⠀⠘⠃⢸⣿⡾⣿⣿⣿⣿⣯⣿⣿⣿⣶⣿⣿⣟⣾⡿⣫⣿⣿⣿⣽⣿⣿⣿⣿⢫⣾⣿⣿⣿⣿⣿⣴⡆⣻⣿⡏⣿⢻⣧⣿⡿⣿⡆⠀⠀  ]],
			[[ ⠀⠀⠀⠜⣿⣾⢿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣭⣿⣖⣿⢿⣿⡿⣿⣿⣿⡿⢡⢯⣿⣿⣿⣿⣿⣿⣿⣧⡿⣾⣷⣿⣿⢿⣿⡇⠉⠁⠀⠀  ]],
			[[ ⠀⠀⠀⠀⣿⣥⣾⣿⣿⣿⣿⣿⣿⣿⡇⣭⣿⣿⣿⣿⠃⠞⠟⣸⣿⠏⣸⣧⣀⠿⢿⣿⣿⣟⣿⣿⣿⣿⣽⣿⢿⣿⣿⣿⣿⠁⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠈⠛⣹⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣟⣿⣿⡿⢶⣦⣄⣿⠏⠀⣿⣟⣿⣶⠾⣿⣟⣋⣛⣿⣿⣿⣿⡇⣻⣿⣿⣿⡏⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠟⠛⠫⣿⣿⣿⣿⣿⡿⣧⠛⣿⠛⣿⣿⣿⣷⡌⠹⡟⠀⠀⠉⡟⠋⢠⣾⣿⣿⣿⡟⣿⣿⣿⣿⢀⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠘⠋⣾⣷⣿⣿⣧⠙⠀⠙⢣⠝⠛⠋⣽⣷⢦⠇⠀⠀⠘⠁⣤⣾⣿⠝⠛⠉⠘⢻⣿⣿⢿⣼⣷⡟⢻⣷⠉⠀ ⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠐⠟⢻⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠈⠛⠀⠀⠀⠀⠀⣾⠟⠀⢸⣷⣿⡇⠀⠛⠀  ⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠁⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⢻⡿⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠲⣄⠀⡄⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⣀⠀⠀⣠⣾⣿⠁⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⢻⣆⠀⠛⠁⠶⣶⣶⣶⣶⣶⣶⡶⠆⠘⠋⣠⡾⢫⣾⡟⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠛⠀⠙⣷⡀⠀⠀⠙⠛⠛⠛⠛⠋⠁⠀⢀⣴⠋⠀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⣰⣦⡀⠸⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣴⡟⠁⠀⠐⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⡄⢺⣿⡄⠹⣿⠻⢦⣤⣤⣤⣤⣶⣿⡟⢀⣀⠀⠀⢸⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣮⣿⣿⡀⠹⡷⣦⣀⡀⡀⢸⣿⠏⢠⣾⣿⠀⠀⣾⣿⣿⣿⣿⣶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
			[[ ⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠘⣷⣻⡟⠀⡼⠁⣴⣿⣿⣯⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀  ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣯⣿⣤⣤⣤⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄  ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿  ]],
		}

    local dashboard_v2 = {
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⢆⣤⣵⣦⣬⣉⡛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡉⠻⣿⣿⣿⣿⠿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⢋⢧⣩⣥⣤⣭⡍⠉⢉⣉⠿⢷⣄⢐⣦⣀⡀⣬⣍⢍⠩⣭⣭⣥⡄⣴⣌⡙⠿⣿⣿⣿⣿⣿⣿⣿⠀⣬⣅⡈⠻⡿⠗⠢⣸ ]],
      [[ ⣿⣿⣟⣫⣭⡡⢝⡒⢋⡐⠀⢒⠲⣦⡉⠃⡀⢾⣷⣌⣻⣷⣜⢻⣷⡀⠘⣿⣿⡆⢸⣿⢀⡶⣌⠛⢿⣿⣿⣿⣿⠘⠒⠒⠒⡂⠄⢠⣾⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣮⣤⡚⠀⡞⢓⠶⣦⣽⡷⣻⣮⠌⣿⣟⡹⣿⣿⡄⡹⣷⠀⢸⣿⠁⣿⡧⡼⢡⣿⠃⢰⡌⠛⢿⡏⠠⢥⡤⢄⣠⣴⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⡿⡋⢵⠪⢤⣘⡀⠻⣿⡠⡱⡹⣷⣼⣿⠀⢹⣿⣿⡀⠘⣰⣦⣿⢀⣿⠐⠡⡵⠃⢂⡎⠊⣙⣦⠄⢴⡠⢀⢌⠙⢿⣿⣿⣿ ]],
      [[ ⡟⢙⣻⡿⠫⢐⣒⣛⠻⣉⣽⣿⣾⠈⠓⠕⢜⢦⡈⠻⢧⡀⢹⣿⣷⡄⣹⣿⡿⣹⣭⣦⡲⠒⣴⠛⠸⠦⣠⣉⠣⣴⣈⠘⠳⠝⣦⢙⣿⣿ ]],
      [[ ⣿⣆⠈⠡⢬⠍⠛⠒⣛⢭⢚⣛⣳⣶⢤⣄⣀⠑⠿⣦⣌⡙⢾⣽⣿⣿⣾⠟⢿⣿⣿⣿⣯⣻⣟⣼⣿⡿⠛⠋⢙⠐⢦⡁⢲⡹⣦⡑⣸⣿ ]],
      [[ ⣿⣿⣧⣀⠰⡶⠄⢁⠬⡶⡟⢋⣩⣶⣿⣿⡿⠟⠃⡉⢉⣭⣿⣿⠿⢛⠋⠀⣴⣿⣿⣿⣿⣿⣿⢹⠷⢀⡤⠾⢄⠺⣄⡙⠦⢑⣿⣷⣿⣿ ]],
      [[ ⣿⣿⡟⢋⢄⡰⠔⣚⠏⢀⣤⡞⣵⢿⠟⢉⣠⣴⣾⣿⣿⠿⡯⣠⡴⠃⢐⣽⡟⠫⣠⡾⢯⣼⡇⢸⠰⢸⢰⡶⠡⣁⠪⠛⢤⣜⠿⣿⣿⣿ ]],
      [[ ⣿⠏⠔⡡⣁⠔⢒⠁⠒⠋⠕⣼⠏⠞⣑⣛⢛⠩⡩⢐⠶⣫⠾⠟⡁⣠⠟⣿⠩⠚⣩⡾⡛⡼⠇⢸⠀⣸⢸⢻⠑⢝⠿⣦⠐⣹⣿⣿⣿⣿ ]],
      [[ ⣿⣄⣾⡙⡰⢋⡰⢀⠔⡀⢴⠋⢐⢜⢕⠕⢉⡼⠡⢋⡾⠁⢊⢬⠚⠁⠉⠠⡂⡽⠃⢀⢰⠁⢰⢸⠀⡏⣾⢸⢠⣔⢬⣀⡈⣻⣿⣿⣿⣿ ]],
      [[ ⣿⣿⡿⢆⡰⠫⢂⢁⢰⠸⠆⢀⠊⠀⠰⣫⢀⡣⢱⣋⠤⢒⢁⡰⠊⢐⠀⢄⡞⡠⣪⠂⢢⢣⠗⣼⠀⡇⡿⠈⠜⡙⠋⠉⡍⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⡏⢠⠾⠑⠁⠂⠀⠠⡆⡗⠈⠷⡤⢈⠐⠈⡁⡼⡃⣪⠎⠨⣱⠅⢺⡼⣡⡓⢀⠊⣼⠐⠏⡖⢳⡗⠎⡰⠁⡄⠇⢧⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣏⣠⣔⢔⠕⠂⠤⢡⠁⠛⠠⠟⡁⠔⢠⡘⠘⠿⠿⣿⡨⣵⡟⣀⠁⠳⠿⠃⣀⣠⣭⣙⠃⡧⠕⠀⣼⡱⣀⢰⠀⣼⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣟⣫⣤⡕⠄⡀⠈⡇⡄⠀⣰⡈⢀⡁⣙⠁⠙⢳⣦⡈⢱⣿⣿⡴⢃⣴⣾⡛⠄⠙⡉⣀⠠⡇⠆⢱⣿⠀⠈⢢⠂⢿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣋⣴⠁⡞⠀⡇⣶⡸⣷⡘⢷⣌⣸⣵⠀⠿⠧⣸⣿⣿⣗⣼⢿⠇⢰⣮⣾⣴⠟⡄⠀⠀⢸⠏⡴⣠⡡⢳⣮⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⡿⣀⡄⠀⢣⢹⣿⣿⣿⣷⣿⣾⣶⣮⣖⣴⣿⣿⣿⣿⣿⣆⣵⣶⣶⣾⣿⣿⠇⣼⣾⡇⡕⠀⣿⣷⣸⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣩⣾⣷⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⣿⢙⠀⡄⢿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⡎⢠⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣸⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠙⢿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣧⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⣎⠻⣿⣿⣛⣛⠿⠿⠿⠿⠿⠿⠿⠿⣟⣛⣽⣿⢟⣵⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⢸⣷⡙⢿⣿⣿⣶⣄⣒⣋⣉⣁⣠⣾⣿⣿⠟⣡⣾⠁⠂⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⠻⣿⣿⡀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢡⣾⣿⠷⣠⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⢸⣯⠊⢻⣷⡀⢌⠻⢿⣿⣿⣿⣿⠟⠋⢠⣿⣿⣿⣿⡇⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠈⠻⣆⠈⢿⣧⡈⠿⢷⣶⣶⣶⡖⠄⣠⣿⠏⢩⣿⣿⠇⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⡿⠿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠈⣿⣿⡔⠐⠯⢉⣿⢙⣼⡿⠃⠀⣀⡿⠟⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣿⣿⣿⣿⣿⣿ ]],
    }

    dashboard.section.header.val = dashboard_v2

		alpha.setup(dashboard.opts)
	end,
}
