﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.Models.Videogames
{
    public class VideogameModel
    {
        public int Id { get; set; }
        
        public string Title { get; set; }
        
        public string Description { get; set; }
        
        public int Year { get; set; }
        
        public string Genre { get; set; }
        
        public string Publisher { get; set; }
    }
}
