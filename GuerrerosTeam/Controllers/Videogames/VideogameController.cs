using GuerrerosTeam.ApplicationServices.Videogames;
using GuerrerosTeam.Core.Videogames;
using GuerrerosTeam.Models.Videogames;
using Microsoft.AspNetCore.Mvc;

namespace GuerrerosTeam.Controllers.Videogames
{
    [ApiController]
    [Route("api/[controller]")]
    public class VideogameController : ControllerBase
    {

        private readonly IVideogameAppService _videogameService;

        public VideogameController(IVideogameAppService videogameService)
        {
            _videogameService = videogameService;
        }

        [HttpGet()]
        public async Task<IEnumerable<Videogame>> GetAll()
        {
            List<Videogame> videogames = await _videogameService.GetVideogameAsync();
            return videogames;
        }

        [HttpGet("{id}")]
        public async Task<Videogame> GetById(int id)
        {
            Videogame videogame = await _videogameService.GetVideogameByIdAsync(id);
            return videogame;
        }

        [HttpPost]
        public async Task<Int32> Post(Videogame entity)
        {
            var videogame = await _videogameService.AddVideogameAsync(entity);
            return videogame;
        }

        [HttpPut("{id}")]
        public async Task Put(int id, Videogame model)
        {
            model.Id = id;
            await _videogameService.EditVideogameAsync(model);
        }

        [HttpDelete("{id}")]
        public async Task Delete(int id)
        {
            await _videogameService.DeleteVideogameAsync(id);
        }
    }
}