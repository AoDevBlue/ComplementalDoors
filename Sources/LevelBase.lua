local LevelBase = {
	-- Layer 1
	{	{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,9,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,9,1,1,1,1,1,1,1,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,1,1,1,9,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,},
			{1,1,1,1,9,0,0,0,0,0,0,0,9,1,1,1,1,1,1,1,},
			{1,1,1,1,1,0,0,0,0,0,0,0,9,1,1,1,1,1,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,0,0,0,1,},
			{1,1,1,0,0,9,1,1,1,1,1,1,1,1,1,9,0,0,0,1,},
			{1,1,9,0,0,9,1,1,1,1,1,1,1,1,1,1,0,0,0,1,},
			{1,1,9,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,0,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,0,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{{{290,260},-1},},					-- Rats 	format {{x,y},dir}
		{{{250,60},1},{{150,370},2},},		-- Orbs		format {{x,y},id}
	},
	-- Layer 2
	{	{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,1,1,9,0,0,0,0,9,1,8,0,0,0,0,0,0,9,1,1,},
			{1,1,1,9,0,0,0,0,9,1,8,0,0,0,0,0,0,9,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,},
			{1,0,0,0,8,1,1,1,1,1,1,1,1,0,0,0,0,9,1,1,},
			{1,0,0,0,8,1,0,0,0,0,1,1,8,0,0,1,0,9,1,1,},
			{1,0,1,1,1,1,0,0,0,0,1,1,8,0,0,1,1,1,1,1,},
			{1,0,1,1,1,1,0,0,0,0,9,1,1,1,0,8,1,1,1,1,},
			{1,0,1,1,1,8,0,0,0,0,9,1,1,1,0,8,1,1,1,1,},
			{1,0,8,1,1,8,0,1,1,0,1,1,1,1,1,1,1,1,1,1,},
			{1,0,8,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,},
			{1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,},
			{1,1,9,0,9,1,1,1,9,0,0,0,0,1,9,0,8,1,1,1,},
			{1,1,9,0,9,1,1,1,9,0,0,0,0,1,9,0,8,1,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{},
		{},
	},
	-- Layer 3
	{	{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,8,1,1,1,1,8,0,0,0,0,9,1,1,1,8,0,1,},
			{1,0,0,8,1,1,1,1,8,0,0,0,0,9,1,1,1,8,0,1,},
			{1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,},
			{1,0,9,1,1,1,0,9,1,0,0,0,0,0,0,0,1,8,0,1,},
			{1,0,9,1,1,1,0,9,1,0,0,0,0,0,0,0,1,8,0,1,},
			{1,0,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,0,1,},
			{1,0,1,1,1,1,0,1,1,1,8,0,1,1,0,0,0,0,0,1,},
			{1,0,1,1,1,1,0,1,1,1,8,0,1,9,0,0,0,0,0,1,},
			{1,0,1,1,9,0,0,0,0,0,1,1,1,9,0,0,0,0,0,1,},
			{1,0,1,1,9,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,},
			{1,0,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,},
			{1,0,8,1,8,0,1,0,8,1,0,0,0,0,8,1,1,1,1,1,},
			{1,0,8,1,8,0,1,0,8,1,1,1,0,0,8,1,1,1,1,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{},
		{{{70,60},3},{{50,290},4},{{450,310},5},},
	},
	-- Layer 4
	{	{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,1,1,1,1,9,0,0,0,0,0,9,1,8,0,0,0,0,1,1,},
			{1,1,1,1,1,9,0,0,0,0,0,9,1,8,0,0,0,0,1,1,},
			{1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,1,1,},
			{1,1,8,0,0,1,1,8,0,0,1,1,1,1,0,0,0,0,1,1,},
			{1,1,8,0,0,1,1,8,0,1,1,1,1,1,0,0,0,1,1,1,},
			{1,1,1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,},
			{1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,},
			{1,1,0,0,1,0,0,0,0,1,1,0,0,8,1,1,0,0,0,1,},
			{1,1,0,0,8,1,0,0,0,1,1,0,0,8,1,0,0,0,0,1,},
			{1,1,1,0,8,1,1,0,0,1,1,0,0,1,0,0,0,0,1,1,},
			{1,1,1,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,1,1,},
			{1,0,0,0,9,0,0,0,1,1,9,0,0,0,0,1,0,0,0,1,},
			{1,0,0,0,9,0,0,1,1,1,9,0,0,0,0,1,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{{{690,540},1},},
		{{{270,70},6},{{90,500},7},},
	},
	-- Layer 5
	{	{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,8,1,1,1,1,1,8,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,8,1,1,1,1,1,8,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,},
			{1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,},
			{1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,0,0,1,0,0,1,0,0,1,1,0,0,0,1,0,0,0,1,},
			{1,1,0,0,8,0,0,1,1,0,8,1,0,0,0,0,0,0,0,1,},
			{1,1,1,0,8,0,1,1,1,0,8,1,1,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,},
		},
		{{{570,540},1},{{680,540},-1},{{560,180},1},{{100,260},1},{{290,260},-1},},
		{},
	},

}

return LevelBase