using GuerrerosTeam.Core.Videogames;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.DataAccess
{
    public class VideogamesContext : IdentityDbContext<IdentityUser, IdentityRole, string>
    {

        public virtual DbSet<Videogame> Videogames { get; set; }

        public VideogamesContext(DbContextOptions<VideogamesContext> options) : base(options)
        {

        }

    }
}
