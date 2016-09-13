using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Common;

namespace AdoTestLIbrary
{
    public class VideoManager
    {
        private static ConnectionStringSettings videoConSetting =
            ConfigurationManager.ConnectionStrings["video"];

        private static DbProviderFactory videoFactory =
            DbProviderFactories.GetFactory(videoConSetting.ProviderName);
 
        public DbConnection GetConnection()
        {
            DbConnection conVideo = videoFactory.CreateConnection();
            conVideo.ConnectionString = videoConSetting.ConnectionString;
            return conVideo;
        }
    }
}
