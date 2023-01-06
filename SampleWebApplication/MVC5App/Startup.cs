using Microsoft.Owin;
using Owin;

//[assembly: OwinStartup(typeof(MVC5App.Startup))]
[assembly:Owin]
namespace MVC5App_OLD
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
