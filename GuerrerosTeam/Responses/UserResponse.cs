using GuerrerosTeam.ApplicationServices.DTO.UserDto;

namespace GuerrerosTeam.Responses
{
    public class UserResponse
    {
        public bool HasError { get; set; }
        public string Message { get; set; }
        public UserDto Model { get; set; }
        public string RequestId { get; set; }
    }
}
