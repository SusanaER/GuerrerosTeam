using GuerrerosTeam;
using GuerrerosTeam.ApplicationServices.Users;
using GuerrerosTeam.ApplicationServices.Videogames;
using GuerrerosTeam.Auth;
using GuerrerosTeam.Core.Videogames;
using GuerrerosTeam.DataAccess;
using GuerrerosTeam.DataAccess.Repositories;
using GuerrerosTeam.Shared.Config;
using GymManager.ApplicationServices;
using Microsoft.AspNet.SignalR.Hosting;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.Identity.Web;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

//Conection String
//string connectionString = builder.Configuration.GetConnectionString("Default");

var configuration = builder.Configuration;

//builder.Services.AddIdentity<IdentityUser, IdentityRole>().AddEntityFrameworkStores<VideogamesContext>();

builder.Services.AddDbContext<VideogamesContext>(options =>
{
    options.UseSqlServer(configuration.GetConnectionString("Default"));
});

#region IdentityUser drom DB
/*builder.Services.AddIdentity<IdentityUser, IdentityRole>(
    opts =>
    {
        opts.Password.RequireDigit = true;
        opts.Password.RequireLowercase = true;
        opts.Password.RequireUppercase = true;
        opts.Password.RequireNonAlphanumeric = true;
        opts.Password.RequiredLength = 7;
        opts.Password.RequiredUniqueChars = 4;
    })
    .AddEntityFrameworkStores<VideogamesContext>()
    .AddDefaultTokenProviders();*/
//builder.Services.AddAutoMapper(typeof(MapperProfile));
#endregion
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
/*builder.Services.Configure<JwtTokenValidationSettings>(builder.Configuration.GetSection("JwtTokenValidationSettings"));
builder.Services.AddTransient<IJwtIssuerOptions, JwtIssuerFactory>();*/

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(/*options =>
{
    options.AddSecurityDefinition(JwtBearerDefaults.AuthenticationScheme, new OpenApiSecurityScheme
    {
        Description = "Jwt Authorization header using the bearer scheme  \r\n\r\n Enter your token in the text input before \r\n ",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        BearerFormat = "JWT",
        Scheme = JwtBearerDefaults.AuthenticationScheme
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type=ReferenceType.SecurityScheme,
                    Id=JwtBearerDefaults.AuthenticationScheme
                }
            },
            new string[]{}
        }
    });
}*/);

#region JWT Configuration
/*var tokenValidationSettings = builder.Services.BuildServiceProvider().GetService<IOptions<JwtTokenValidationSettings>>().Value;
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = tokenValidationSettings.ValidIssuer,
        ValidAudience = tokenValidationSettings.ValidAudience,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenValidationSettings.SecretKey)),
        ClockSkew = TimeSpan.Zero
    };
});*/
#endregion

//OIDC Azure
builder.Services.AddMicrosoftIdentityWebApiAuthentication(configuration);

builder.Services.AddTransient<IVideogameAppService, VideogameAppService>();

builder.Services.AddTransient<IRepository<int, Videogame>, Repository<int, Videogame>>();
//builder.Services.AddTransient<IUserService, UserService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("MyCorsPolicy", builder =>
    {
        builder.AllowAnyOrigin()
               .AllowAnyMethod()
               .AllowAnyHeader();
    });
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//app.InitDb();

app.UseHttpsRedirection();
app.UseAuthentication();

app.Use(async (context, next) =>
{
    //verifica si el usuario que ha realizado la solicitud no está autenticado
    if (!context.User.Identity?.IsAuthenticated ?? false)
    {
        // Esto establece el código de estado de respuesta HTTP en 401, que indica "No autorizado
        context.Response.StatusCode = 401;
        await context.Response.WriteAsync("Not Authenticated!!");
    }
    // pasar la solicitud al siguiente
    else await next();
});

//app.UseAuthorization();
app.UseCors("MyCorsPolicy");
app.MapControllers();

app.Run();
