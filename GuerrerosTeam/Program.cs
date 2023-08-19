using GuerrerosTeam.ApplicationServices.Videogames;
using GuerrerosTeam.Core.Videogames;
using GuerrerosTeam.DataAccess;
using GuerrerosTeam.DataAccess.Repositories;
using Microsoft.AspNet.SignalR.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

//Conection String
//string connectionString = builder.Configuration.GetConnectionString("Default");

var configuration = builder.Configuration;

builder.Services.AddIdentity<IdentityUser, IdentityRole>().AddEntityFrameworkStores<VideogamesContext>();

builder.Services.AddDbContext<VideogamesContext>(options =>
{
    options.UseSqlServer(configuration.GetConnectionString("Default"));
});


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTransient<IVideogameAppService, VideogameAppService>();

builder.Services.AddTransient<IRepository<int, Videogame>, Repository<int, Videogame>>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
