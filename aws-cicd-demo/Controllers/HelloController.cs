using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace YourNamespace.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloController : ControllerBase
    {
        private readonly IConfiguration _config;

        public HelloController(IConfiguration config)
        {
            _config = config;
        }

        [HttpGet]
        public IActionResult Get()
        {
            // Example: Read from appsettings.json
            var message = _config.GetValue<string>("MyAppSettings:WelcomeMessage");
            return Ok(new { Message = message });
        }

        [HttpPost]
        public IActionResult Echo([FromBody] string value)
        {
            return Ok(new { YouSent = value });
        }
    }
}
