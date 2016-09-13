using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace AdoTestLIbrary
{
    public class GenreManager
    {
        public List<Genre> GetGenres()
        {
            List<Genre> genres = new List<Genre>();
            var manager = new VideoManager();

            using (var conVideo = manager.GetConnection())
            {
                using (var comGenres = conVideo.CreateCommand())
                {
                    comGenres.CommandType = CommandType.Text;
                    comGenres.CommandText = "SELECT * FROM Genres ORDER BY Genre";

                    conVideo.Open();
                    using (var rdrGenres = comGenres.ExecuteReader())
                    {
                        Int32 posGenreNr = rdrGenres.GetOrdinal("GenreNr");
                        Int32 posGenre = rdrGenres.GetOrdinal("Genre");

                        while (rdrGenres.Read())
                        {
                            genres.Add(new Genre(
                                rdrGenres.GetInt32(posGenreNr),
                                rdrGenres.GetString(posGenre)));
                        }
                    }
                }
            }            
            return genres;
        }
    }
}
