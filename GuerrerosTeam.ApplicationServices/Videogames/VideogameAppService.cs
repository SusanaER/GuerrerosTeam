using GuerrerosTeam.Core.Videogames;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.ApplicationServices.Videogames
{
    public class VideogameAppService: IVideogameAppService
    {
        //agregar la refrenecia al proyecto entiti framework con el nombre de la clase.
        private readonly IRepository<int, Videogame> _repository;

        public VideogameAppService(IRepository<int, Videogame> repository)
        {
            _repository = repository;
        }

        public async Task<int> AddVideogameAsync(Videogame videogame)
        {
            await _repository.AddAsync(videogame);
            return videogame.Id;
        }

        public async Task DeleteVideogameAsync(int videogameId)
        {
            await _repository.DeleteAsync(videogameId);
        }

        public async Task EditVideogameAsync(Videogame videogame)
        {
            await _repository.UpdateAsync(videogame);
        }

        public async Task<List<Videogame>> GetVideogameAsync()
        {
            //using Microsoft.EntityFrameworkCore; cuando de error el tolistasync
            return await _repository.GetAll().ToListAsync();
        }

        public async Task<Videogame> GetVideogameByIdAsync(int videogameId)
        {
            return await _repository.GetAsync(videogameId);
        }
    }
}
