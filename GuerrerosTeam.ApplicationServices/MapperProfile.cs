using AutoMapper;
using GuerrerosTeam.ApplicationServices.DTO.UserDto;

using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GymManager.ApplicationServices
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<IdentityUser, UserDto>();
            CreateMap<IdentityUser, NewUserDto>();
            CreateMap<IdentityUser, EditUserDto>();
            CreateMap<UserDto, IdentityUser>();
            CreateMap<NewUserDto, IdentityUser>();
            CreateMap<EditUserDto, IdentityUser>();
        }
    }
}
