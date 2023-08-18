using GuerrerosTeam.Core.Videogames;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.ApplicationServices.Videogames
{
    public interface IVideogameAppService
    {
        Task<List<Videogame>> GetVideogameAsync();

        Task<int> AddVideogameAsync(Videogame videogame);

        Task DeleteVideogameAsync(int videogameId);

        Task<Videogame> GetVideogameByIdAsync(int videogameId);

        Task EditVideogameAsync(Videogame videogame);
    }
}
