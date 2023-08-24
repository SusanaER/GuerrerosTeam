﻿using GuerrerosTeam.ApplicationServices.DTO.UserDto;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuerrerosTeam.ApplicationServices.Users
{
    public interface IUserService
    {
        Task<IEnumerable<UserDto>> GetUsersAsync();
        Task<UserDto> GetUserAsync(string id);
        Task<IdentityResult> AddUserAsync(NewUserDto userDto);
        Task EditUserAsync(string id, EditUserDto userDto);
        Task DeleteUserAsync(string id);
    }
}
