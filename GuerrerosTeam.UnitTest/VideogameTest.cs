using System.Collections.Generic;
using System.Threading.Tasks;
using GuerrerosTeam.ApplicationServices.Videogames;
using GuerrerosTeam.Controllers.Videogames;
using GuerrerosTeam.Core.Videogames;
using Moq;
using NUnit.Framework;

namespace GuerrerosTeam.UnitTest
{
    public class VideogameControllerTests
    {
        private Mock<IVideogameAppService> _videogameServiceMock;
        private VideogameController _controller;

        [SetUp]
        public void Setup()
        {
            _videogameServiceMock = new Mock<IVideogameAppService>();
            _controller = new VideogameController(_videogameServiceMock.Object);
        }

        [Test]
        public async Task TestGetAll()
        {
            // Arrange
            _videogameServiceMock.Setup(service => service.GetVideogameAsync())
                .ReturnsAsync(new List<Videogame>());

            // Act
            var result = await _controller.GetAll();

            // Assert
            var videogames = result as List<Videogame>;
            Assert.NotNull(videogames);
            Assert.IsEmpty(videogames);
        }

        [Test]
        public async Task TestGetById()
        {
            // Arrange
            int testId = 1;
            _videogameServiceMock.Setup(service => service.GetVideogameByIdAsync(testId))
                .ReturnsAsync(new Videogame { Id = testId /*, ... other properties ... */ });

            // Act
            var result = await _controller.GetById(testId);

            // Assert
            var videogame = result as Videogame;
            Assert.NotNull(videogame);
            Assert.AreEqual(testId, videogame.Id);
        }
        [Test]
        public async Task TestEdit()
        {
            // Arrange
            int testId = 1;
            var editedVideogame = new Videogame { Id = testId, Title = "Edited Title" };
            _videogameServiceMock.Setup(service => service.EditVideogameAsync(editedVideogame));

            // Act
            await _controller.Put(testId, editedVideogame);

            // Assert
            _videogameServiceMock.Verify(service => service.EditVideogameAsync(editedVideogame), Times.Once);
        }

        [Test]
        public async Task TestDelete()
        {
            // Arrange
            int testId = 1;
            _videogameServiceMock.Setup(service => service.DeleteVideogameAsync(testId));

            // Act
            await _controller.Delete(testId);

            // Assert
            _videogameServiceMock.Verify(service => service.DeleteVideogameAsync(testId), Times.Once);
        }
    }
}
