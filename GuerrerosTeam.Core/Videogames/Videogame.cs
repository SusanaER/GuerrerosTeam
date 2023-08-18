﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.Core.Videogames
{
    public class Videogame
    {
        [Key]
        public int Id { get; set; }
        [Required] 
        public string Title { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public int Year { get; set; }
        [Required]
        public string Genre { get; set; }
        [Required]
        public string Publisher { get; set;}
    }
}
