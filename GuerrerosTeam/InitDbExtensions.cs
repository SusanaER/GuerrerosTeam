using Microsoft.AspNetCore.Identity;

namespace GuerrerosTeam
{
    public static class InitDbExtensions
    {
        public static IApplicationBuilder InitDb(this IApplicationBuilder app)
        {
            using (var scope = app.ApplicationServices.CreateScope())
            {
                var services = scope.ServiceProvider;
                var userManager = services.GetService<UserManager<IdentityUser>>();
                var roleManager = services.GetService<RoleManager<IdentityRole>>();
                if (userManager.Users.Count() == 0)
                {
                    Task.Run(() => InitRoles(roleManager)).Wait();
                    Task.Run(() => InitUsers(userManager)).Wait();
                }
            }
            return app;
        }
        private static async Task InitRoles(RoleManager<IdentityRole> roleManager)
        {
            try
            {
                var role = new IdentityRole("Admin");
                await roleManager.CreateAsync(role);

                role = new IdentityRole("User");
                await roleManager.CreateAsync(role);

                role = new IdentityRole("Supervisor");
                await roleManager.CreateAsync(role);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private static async Task InitUsers(UserManager<IdentityUser> userManager)
        {
            var admin = new IdentityUser()
            {
                UserName = "admin@videogame.com",
                Email = "admin@videogame.com",
                PhoneNumber = "1234567891"
            };
            await userManager.CreateAsync(admin, "3eJ0eMN@*wl9+");
            await userManager.AddToRoleAsync(admin, "Admin");

            var user = new IdentityUser()
            {
                UserName = "user@videogame.com",
                Email = "user@videogame.com",
                PhoneNumber = "1234567890"
            };
            await userManager.CreateAsync(user, "3eJ0eMN@*wl9+");
            await userManager.AddToRoleAsync(user, "User");
        }

        public static Int64 ToUnixEpochDate(this DateTime dateTime)
        {
            var result = (Int64)Math.Round((dateTime.ToUniversalTime() - new DateTimeOffset(1970, 1, 1, 0, 0, 0, TimeSpan.Zero)).TotalSeconds);
            return result;
        }
    }
}
