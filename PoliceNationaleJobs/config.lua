Config             = {}

Config.jeveuxmarker = true --- true = Oui | false = Non

Config.Nombredeballe = 150 -- Nombre de balle � donner pour chaque arme


Config.Webhookplainte = ""
Config.Webhookservice = ""


Config.pos = {
	garage = {
		position = {x = -562.76, y =  -935.1, z =  18.12}
	},
	spawnvoiture = {
		position = {x = -563.81, y = -920.32, z = 18.12, h = 357.92}
	},
	boss = {
		position = {x = -575.6, y = -936.7, z = 27.6}
	},
	blips = {
		position = {x = -592.52, y = -929.98, z = 23.86}
	},
	vestiaire = {
		position = {x = -595.05, y = -922.09, z = 28.7}
	},
    vestiaire2 = {
		position = {x = -597.21, y = -926.55, z = 28.7}
	},
    vestiaire3 = {
		position = {x = -595.54, y = -926.54, z = 28.7}
	},
    vestiaire4 = {
		position = {x = -590.97, y = -922.13, z = 28.7}
	},
}

Gpolicevoiture = {
	{nom = "Dacia Duster", modele = "duster2022pn"},
    {nom = "Peugeot 3008", modele = "30082022pn"},
    {nom = "Peugeot 5008", modele = "p5008_pn"},
    {nom = "Peugeot 308", modele = "p308_pn"},
    {nom = "Ford Transit", modele = "ftransit_pn"},
    {nom = "Ford C-MAX", modele = "fcmax_pn"},
    {nom = "Peugeot Expert Vigipirate", modele = "pexpert17_pn"},
    {nom = "Peugeot Expert CRSA", modele = "pexpert17_crsa"},
    {nom = "Citroën Berlingo", modele = "cberlingo_pn"},
    {nom = "Peugeot Partner", modele = "partnerpn"},
    {nom = "Renault Mégane IV 1", modele = "rmegane4e18_pn"},
    {nom = "Renault Mégane IV 2", modele = "megane5pn"},
    {nom = "Renault Scenic", modele = "gscenic17pn"},
    {nom = "Skoda Octavia", modele = "soctavia_pn"},
    {nom = "Skoda Octavia Combi", modele = "soctaviacombi_pn"},
    {nom = "Skoda Kodiaq", modele = "skodiaq_pn"},
    {nom = "Renault Master", modele = "rmaster205_pn"},
}

Gpolicevoiturebana = {
	{nom = "Peugeot 3008", modele = "30082022bana"},
    {nom = "Peugeot 308", modele = "3082022swbac"},
    {nom = "Skoda Octavia", modele = "oct17bana"},
    {nom = "Renault Talisman", modele = "talismanbanapn"},
}

Gpolicemoto = {
	{nom = "BMW 1250RT", modele = "motopn"},
    {nom = "BMW 1250RT CRS", modele = "motocrs"},
}

Gpolicevoiturebri = {
	{nom = "Bouclier", modele = "ramsesraid"},
    {nom = "PVP", modele = "ppvp_bri"},
}

Gpolicevoiturecrs = {
    {nom = "Renault Mégane IV", modele = "megane5crsa"},
	{nom = "Renault Master", modele = "rmaster317_crs"},
    {nom = "Renault Master PCO", modele = "pcmastercrs"},
    {nom = "Ford Transit", modele = "ftransit_crs"},
    {nom = "Renault Trafic", modele = "trafic15crs"},
    {nom = "Ford Focus", modele = "ffocus3sw_crs"},
	{nom = "Sprinter DOPC", modele = "sprinterdopc"},
}

Config.PS = {
	pa = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 0,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 0,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 1,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 1,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 2,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 2,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 3,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 3,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 4,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 4,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 5,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 5,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 6,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 6,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 7,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 7,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 8,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 8,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 9,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 9,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 11,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 11,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 12,
		   decals_1 = 27,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 34,   torso_2 = 12,
			decals_1 = 17,   decals_2 = 0,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
      
}

-- FIN TENUE DP Chaud 
-- TENUE DP Froid
    
Config.PSFroid = {
	ads = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 0,
		   decals_1 = 31,   decals_2 = 2,
		   arms = 1,
            masks_1 = 261,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 0,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 1,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 1,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 2,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 2,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 3,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 3,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    brc = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 4,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 4,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 5,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 5,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 6,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 6,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 7,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 7,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 8,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 8,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 9,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 9,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 11,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 11,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 12,
			decals_1 = 31,   decals_2 = 2,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 12,
		   decals_1 = 23,   decals_2 = 2,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
-- FIN TENUE DP Froid 
    
}

Config.PSBLEU = {
	ads = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 0,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 0,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 1,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 1,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 2,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 2,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 3,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 3,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 4,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 4,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 5,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 5,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 6,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 6,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 7,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 7,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 8,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 8,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 9,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 9,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 11,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 11,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 55,   torso_2 = 12,
		   decals_1 = 27,   decals_2 = 1,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
			torso_1 = 35,   torso_2 = 12,
			decals_1 = 17,   decals_2 = 1,
			arms = 9,
			pants_1 = 17,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
		    chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		    bags_1 = 0,     bags_2 = 0,
		    bproof_1 = 0,     bproof_2 = 0
		}
	},
      
}

-- FIN TENUE DP Froid 
-- TENUE DP Froid Bleu
    
Config.PSFroidBLEU = {
	ads = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 0,
		   decals_1 = 31,   decals_2 = 9,
		   arms = 1,
            masks_1 = 261,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 0,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 1,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 1,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 2,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 2,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 3,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 3,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 4,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 4,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 5,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 5,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 6,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 6,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 7,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 7,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 8,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 8,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 9,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 9,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 11,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 11,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 64,   torso_2 = 12,
			decals_1 = 31,   decals_2 = 9,
			arms = 1,
			 masks_1 = 261,    masks_2 = 0,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 16,   shoes_2 = 0,
			helmet_1 = 30,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 0,     bproof_2 = 0
		 },
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 44,   torso_2 = 12,
		   decals_1 = 23,   decals_2 = 1,
		   arms = 3,
            masks_1 = -1,    masks_2 = 0,
		   pants_1 = 19,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 30,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
-- FIN TENUE DP Froid Bleu
    
}

-- TENUE DP C�r�monie
    
Config.CR = {
	ads = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 0,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 0,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 1,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 1,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 2,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 2,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 3,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 3,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 4,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 4,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 5,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 5,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 6,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 6,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 7,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 7,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 8,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 8,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 9,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 9,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 11,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 11,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 64,   torso_2 = 12,
		   decals_1 = 30,   decals_2 = 0,
		   arms = 0,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 43,   torso_2 = 12,
		   decals_1 = 18,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
-- FIN TENUE C�r�monie
    
}

-- TENUE MOTO
    
Config.MOTO = {

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 3,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 3,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 4,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 4,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 5,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 5,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 6,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 6,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 7,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 7,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 8,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 8,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 9,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 9,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 11,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 11,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 68,   torso_2 = 12,
		   decals_1 = 34,   decals_2 = 8,
		   arms = 256,
		   pants_1 = 22,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 48,   torso_2 = 12,
		   decals_1 = 24,   decals_2 = 0,
		   arms = 298,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 17,   shoes_2 = 0,
		   helmet_1 = 22,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = 261,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
-- FIN TENUE Moto
    
}

-- TENUE MOTO
    
Config.MOTOCOMBI = {

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 3,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 3
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 3,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 3
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 4,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 5
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 4,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 4
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 5,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 4
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 5,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 6,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 7
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 6,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 7,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 8
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 7,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 8,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 9
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 8,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 9,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 10
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 9,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 11,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 11
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 11,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 54,   torso_2 = 12,
		   decals_1 = 27,   decals_2 = 8,
		   arms = 0,
		   pants_1 = 23,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 102,     bproof_2 = 12
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 34,   torso_2 = 12,
		   decals_1 = 17,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 21,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 12
		}
	},
-- FIN TENUE Moto Combi
    
}
    
Config.PULL = {
	ads = {
		male = {
           tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 0,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 0,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	eg = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 1,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 1,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 2,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 2,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 3,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 3,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 5,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 5,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 6,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 6,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 7,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 7,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 8,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 8,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 9,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 9,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 10,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 10,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		  torso_1 = 61,   torso_2 = 11,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 11,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 61,   torso_2 = 12,
		   decals_1 = 29,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 41,   torso_2 = 12,
		   decals_1 = 23,   decals_2 = 0,
		   arms = 3,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
-- FIN TENUE PULL

}
    
Config.CRS = {
	eg = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 0,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 1,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 1,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 2,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

	gdlp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 2,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 3,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 4,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 4,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 5,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 5,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 6,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 6,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 7,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 7,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 8,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 8,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 9,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 9,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		  torso_1 = 67,   torso_2 = 10,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 10,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
		   torso_1 = 67,   torso_2 = 11,
		   decals_1 = 39,   decals_2 = 0,
		   arms = 1,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		},
		female = {
			tshirt_1 = 14,  tshirt_2 = 0,
		   torso_1 = 40,   torso_2 = 11,
		   decals_1 = 26,   decals_2 = 0,
		   arms = 9,
		   pants_1 = 17,   pants_2 = 0,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = -1,  helmet_2 = 0,
		   chain_1 = 0,    chain_2 = 0,
            masks_1 = -1,    masks_2 = 0,
		   bags_1 = 0,     bags_2 = 0,
		   bproof_1 = 0,     bproof_2 = 0
		}
	},

}

Config.CEINTURON = {
    
    ads = {
		male = {
		   tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    
    eg = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    
    gdlps = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},

	gdlp = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},

    brc = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    maj = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    cpts = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 40,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 25,  tshirt_2 = 0
		}
	},
-- FIN TENUE CEINTURE
    
}

Config.CEINTURONCDB = {

	gdlp = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    eg = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},

    brc = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    maj = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    cpts = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0
		}
	},
-- FIN TENUE CEINTURE Chef De Bord
    
}

Config.CEINTURONBTD = {
    
    ads = {
		male = {
		   tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    
    eg = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},

	gdlps = {
		male = {
		   tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},

	gdlp = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},

    brc = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    maj = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    cpts = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 24,  tshirt_2 = 0
		},
		female = {
			tshirt_1 = 24,  tshirt_2 = 0
		}
	},
-- FIN TENUE CEINTURE BTD
    
}

Config.HOLSTER1 = {
    
    ads = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    
    eg = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},

	gdlps = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},

	gdlp = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},

    brc = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    maj = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    cpts = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    cmd = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    cdp = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
    boss = {
		male = {
			chain_1 = 24,  chain_2 = 0
		},
		female = {
			chain_1 = 10,  chain_2 = 0
		}
	},
-- FIN TENUE HOLSTERS1
    
}

Config.HOLSTER2 = {
    
    ads = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    
    eg = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
  
	gdlps = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},

	gdlp = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},

    brc = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    maj = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    cpts = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    cmd = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    cdp = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
    boss = {
		male = {
			chain_1 = 29,  chain_2 = 0
		},
		female = {
			chain_1 = 13,  chain_2 = 0
		}
	},
-- FIN TENUE HOLSTERS2
    
}

Config.HOLSTER3 = {
    
    ads = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},   
    
    eg = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},

	gdlps = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},

	gdlp = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    brc = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    maj = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    cpts = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    cptp = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    cmd = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    cdp = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
    boss = {
		male = {
			chain_1 = 34,  chain_2 = 0
		},
		female = {
			chain_1 = 14,  chain_2 = 0
		}
	},
-- FIN TENUE HOLSTERS3
    
}

Config.HOLSTER4 = {
    
    ads = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    
    eg = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},

	gdlps = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},

	gdlp = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},

    brc = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    maj = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    cpts = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    cptp = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    cptp = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    cmd = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    cdp = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
    boss = {
		male = {
			bags_1 = 14,  bags_2 = 0
		},
		female = {
			bags_1 = 0,  bags_2 = 0
		}
	},
-- FIN TENUE HOLSTERS4
    
}

Config.CALOT = {
    
    ads = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    
    eg = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},

	gdlps = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},

	gdlp = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},

    brc = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    maj = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    cpts = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    cmd = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    cdp = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
    boss = {
		male = {
			helmet_1 = 198,  helmet_2 = 0
		},
		female = {
			helmet_1 = 197,  helmet_2 = 0
		}
	},
-- FIN TENUE CALOT
    
}

Config.BONNET = {
    
    ads = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    
    eg = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},

	gdlps = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},

	gdlp = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},

    brc = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    maj = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    cpts = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    cmd = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    cdp = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
    boss = {
		male = {
			helmet_1 = 200,  helmet_2 = 0
		},
		female = {
			helmet_1 = 199,  helmet_2 = 0
		}
	},
-- FIN TENUE BONNET
    
}

Config.CASQUETTE = {
    
    ads = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    
    eg = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},

	gdlps = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},

	gdlp = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},

    brc = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    maj = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    cpts = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    cptp = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    cmd = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    cdp = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
    boss = {
		male = {
			helmet_1 = 202,  helmet_2 = 0
		},
		female = {
			helmet_1 = 201,  helmet_2 = 0
		}
	},
-- FIN TENUE CASQUETTE

}

Config.CASQUECRS = {
    
    ads = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    eg = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},

	gdlps = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},

	gdlp = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},

    brc = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    maj = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    cpts = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    cptp = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    cptp = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    cmd = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    cdp = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},
    
    boss = {
		male = {
			helmet_1 = 33,  helmet_2 = 0
		},
		female = {
			helmet_1 = 33,  helmet_2 = 0
		}
	},

}

Config.GILET1 = {
    
    ads = {
		male = {
			bproof_1 = 76,     bproof_2 = 0
		},
		female = {
			bproof_1 = 55,     bproof_2 = 0
		}
	},
    
    eg = {
		male = {
			bproof_1 = 76,     bproof_2 = 1
		},
		female = {
			bproof_1 = 55,     bproof_2 = 1
		}
	},

	gdlps = {
		male = {
			bproof_1 = 76,     bproof_2 = 2
		},
		female = {
			bproof_1 = 55,     bproof_2 = 2
		}
	},

	gdlp = {
		male = {
			bproof_1 = 76,     bproof_2 = 3
		},
		female = {
			bproof_1 = 55,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 76,     bproof_2 = 4
		},
		female = {
			bproof_1 = 55,     bproof_2 = 4
		}
	},
    maj = {
		male = {
			bproof_1 = 76,     bproof_2 = 5
		},
		female = {
			bproof_1 = 55,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
			bproof_1 = 76,     bproof_2 = 6
		},
		female = {
			bproof_1 = 55,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
			bproof_1 = 76,     bproof_2 = 7
		},
		female = {
			bproof_1 = 55,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 76,     bproof_2 = 8
		},
		female = {
			bproof_1 = 55,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			bproof_1 = 76,     bproof_2 = 9
		},
		female = {
			bproof_1 = 55,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			bproof_1 = 76,     bproof_2 = 11
		},
		female = {
			bproof_1 = 55,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			bproof_1 = 76,     bproof_2 = 12
		},
		female = {
			bproof_1 = 55,     bproof_2 = 12
		}
	},
-- FIN TENUE GILET 1
    
}

Config.GILET4 = {
    
    ads = {
		male = {
			bproof_1 = 105,     bproof_2 = 0
		},
		female = {
			bproof_1 = 85,     bproof_2 = 0
		}
	},
    
    eg = {
		male = {
			bproof_1 = 105,     bproof_2 = 1
		},
		female = {
			bproof_1 = 85,     bproof_2 = 1
		}
	},

	gdlps = {
		male = {
			bproof_1 = 105,     bproof_2 = 2
		},
		female = {
			bproof_1 = 85,     bproof_2 = 2
		}
	},

	gdlp = {
		male = {
			bproof_1 = 105,     bproof_2 = 3
		},
		female = {
			bproof_1 = 85,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 105,     bproof_2 = 5
		},
		female = {
			bproof_1 = 85,     bproof_2 = 5
		}
	},
    maj = {
		male = {
			bproof_1 = 105,     bproof_2 = 6
		},
		female = {
			bproof_1 = 85,     bproof_2 = 6
		}
	},
    cpts = {
		male = {
			bproof_1 = 105,     bproof_2 = 7
		},
		female = {
			bproof_1 = 85,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 105,     bproof_2 = 8
		},
		female = {
			bproof_1 = 85,     bproof_2 = 8
		}
	},
    cptp = {
		male = {
			bproof_1 = 105,     bproof_2 = 9
		},
		female = {
			bproof_1 = 85,     bproof_2 = 9
		}
	},
    cmd = {
		male = {
			bproof_1 = 105,     bproof_2 = 10
		},
		female = {
			bproof_1 = 85,     bproof_2 = 10
		}
	},
    cdp = {
		male = {
			bproof_1 = 105,     bproof_2 = 11
		},
		female = {
			bproof_1 = 85,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			bproof_1 = 105,     bproof_2 = 12
		},
		female = {
			bproof_1 = 85,     bproof_2 = 12
		}
	},
-- FIN TENUE GILET 4
    
}

Config.GILET2 = {   

	gdlp = {
		male = {
			bproof_1 = 103,     bproof_2 = 3
		},
		female = {
			bproof_1 = 83,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 103,     bproof_2 = 4
		},
		female = {
			bproof_1 = 83,     bproof_2 = 4
		}
	},
    maj = {
		male = {
			bproof_1 = 103,     bproof_2 = 5
		},
		female = {
			bproof_1 = 83,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
			bproof_1 = 103,     bproof_2 = 6
		},
		female = {
			bproof_1 = 83,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
			bproof_1 = 103,     bproof_2 = 7
		},
		female = {
			bproof_1 = 83,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 103,     bproof_2 = 8
		},
		female = {
			bproof_1 = 83,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			bproof_1 = 103,     bproof_2 = 9
		},
		female = {
			bproof_1 = 83,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			bproof_1 = 103,     bproof_2 = 11
		},
		female = {
			bproof_1 = 83,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			bproof_1 = 103,     bproof_2 = 12
		},
		female = {
			bproof_1 = 83,     bproof_2 = 12
		}
	},
-- FIN TENUE GILET 2
    
}

Config.GILET3 = {
    
    ads = {
		male = {
			bproof_1 = 106,     bproof_2 = 0
		},
		female = {
			bproof_1 = 60,     bproof_2 = 0
		}
	},
    
    eg = {
		male = {
			bproof_1 = 106,     bproof_2 = 1
		},
		female = {
			bproof_1 = 60,     bproof_2 = 1
		}
	},

	gdlps = {
		male = {
			bproof_1 = 106,     bproof_2 = 2
		},
		female = {
			bproof_1 = 60,     bproof_2 = 2
		}
	},

	gdlp = {
		male = {
			bproof_1 = 106,     bproof_2 = 3
		},
		female = {
			bproof_1 = 60,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 106,     bproof_2 = 4
		},
		female = {
			bproof_1 = 60,     bproof_2 = 4
		}
	},
    maj = {
		male = {
			bproof_1 = 106,     bproof_2 = 5
		},
		female = {
			bproof_1 = 60,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
			bproof_1 = 106,     bproof_2 = 6
		},
		female = {
			bproof_1 = 60,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
			bproof_1 = 106,     bproof_2 = 7
		},
		female = {
			bproof_1 = 60,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 106,     bproof_2 = 8
		},
		female = {
			bproof_1 = 60,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			bproof_1 = 106,     bproof_2 = 9
		},
		female = {
			bproof_1 = 60,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			bproof_1 = 106,     bproof_2 = 10
		},
		female = {
			bproof_1 = 60,     bproof_2 = 10
		}
	},
    boss = {
		male = {
			bproof_1 = 106,     bproof_2 = 11
		},
		female = {
			bproof_1 = 60,     bproof_2 = 11
		}
	},
-- FIN TENUE GILET 3
    
}

Config.GILET5 = {
    
    ads = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 0
		}
	},
    
    eg = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 1
		}
	},

	gdlps = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 2
		}
	},

	gdlp = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 4
		}
	},
    maj = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			bproof_1 = 88,     bproof_2 = 0
		},
		female = {
			bproof_1 = 65,     bproof_2 = 12
		}
	},
-- FIN TENUE GILET 5
    
}

Config.GILET6 = {
    
	gdlp = {
		male = {
			bproof_1 = 84,     bproof_2 = 3
		},
		female = {
			bproof_1 = 61,     bproof_2 = 3
		}
	},

    brc = {
		male = {
			bproof_1 = 84,     bproof_2 = 4
		},
		female = {
			bproof_1 = 61,     bproof_2 = 4
		}
	},
    maj = {
		male = {
			bproof_1 = 84,     bproof_2 = 5
		},
		female = {
			bproof_1 = 61,     bproof_2 = 5
		}
	},
    cpts = {
		male = {
			bproof_1 = 84,     bproof_2 = 6
		},
		female = {
			bproof_1 = 61,     bproof_2 = 6
		}
	},
    cptp = {
		male = {
			bproof_1 = 84,     bproof_2 = 7
		},
		female = {
			bproof_1 = 61,     bproof_2 = 7
		}
	},
    cptp = {
		male = {
			bproof_1 = 84,     bproof_2 = 8
		},
		female = {
			bproof_1 = 61,     bproof_2 = 8
		}
	},
    cmd = {
		male = {
			bproof_1 = 84,     bproof_2 = 9
		},
		female = {
			bproof_1 = 61,     bproof_2 = 9
		}
	},
    cdp = {
		male = {
			bproof_1 = 84,     bproof_2 = 11
		},
		female = {
			bproof_1 = 61,     bproof_2 = 11
		}
	},
    boss = {
		male = {
			bproof_1 = 84,     bproof_2 = 12
		},
		female = {
			bproof_1 = 61,     bproof_2 = 12
		}
	},
-- FIN TENUE GILET 6
    
}

Config.RAID = {
	gdlp = {
		male = {
		   tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

    brc = {
		male = {
		   tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    maj = {
		male = {
		   tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    cpts = {
		male = {
		   tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    cptp = {
		male = {
		   tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    cptp = {
		male = {
			tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    cmd = {
		male = {
			tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    cdp = {
		male = {
			tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    boss = {
		male = {
			tshirt_1 = 13,  tshirt_2 = 1,
		   torso_1 = 48,   torso_2 = 1,
		   decals_1 = 37,   decals_2 = 14,
		   arms = 263,
		   pants_1 = 24,   pants_2 = 1,
		   shoes_1 = 16,   shoes_2 = 0,
		   helmet_1 = 172,  helmet_2 = 1,
		   chain_1 = 28,    chain_2 = 0,
           mask_1 = 144,    mask_2 = 0,
           glasses_1 = 3,    glasses_2 = 1,
		   bags_1 = 14,     bags_2 = 0,
		   bproof_1 = 82,     bproof_2 = 0,
           ears_1 = 103,     ears_2 = 1
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
    }
-- FIN TENUE RAID
