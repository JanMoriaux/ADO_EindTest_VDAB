using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Common;

namespace AdoTestLIbrary
{
    public class FilmManager
    {
        public ObservableCollection<Film> GetFilms()
        {
            ObservableCollection<Film> films = new ObservableCollection<Film>();
            var manager = new VideoManager();
            using (var conVideo = manager.GetConnection())
            {
                using (var comFilms = conVideo.CreateCommand())
                {
                    comFilms.CommandType = CommandType.Text;
                    comFilms.CommandText = "SELECT * FROM Films " +
                        "ORDER BY Films.Titel";

                    conVideo.Open();
                    using (var rdrFilms = comFilms.ExecuteReader())
                    {
                        Int32 posBandNr = rdrFilms.GetOrdinal("BandNr");
                        Int32 posTitel = rdrFilms.GetOrdinal("Titel");
                        Int32 posGenre = rdrFilms.GetOrdinal("GenreNr");
                        Int32 posInVoorraad = rdrFilms.GetOrdinal("InVoorraad");
                        Int32 posUitVoorraad = rdrFilms.GetOrdinal("UitVoorraad");
                        Int32 posPrijs = rdrFilms.GetOrdinal("Prijs");
                        Int32 posTotaalVerhuurd = rdrFilms.GetOrdinal("TotaalVerhuurd");

                        while (rdrFilms.Read())
                        {
                            Int32 bandNr = rdrFilms.GetInt32(posBandNr);
                            String titel = rdrFilms.GetString(posTitel);
                            Int32 genre = rdrFilms.GetInt32(posGenre);
                            Int32 inVoorraad = rdrFilms.GetInt32(posInVoorraad);
                            Int32 uitVoorraad = rdrFilms.GetInt32(posUitVoorraad);
                            Decimal prijs = rdrFilms.GetDecimal(posPrijs);
                            Int32 totaalVerhuurd = rdrFilms.GetInt32(posTotaalVerhuurd);
                            films.Add(new Film(bandNr, titel, genre,
                                inVoorraad, uitVoorraad, prijs, totaalVerhuurd));
                        }
                    }
                }
            }
            return films;
        }

        public Int32 InsertFilm(Film film)
        {
            var manager = new VideoManager();
            
            using (var conVideo = manager.GetConnection())
            {
                using (var comInsert = conVideo.CreateCommand())
                {
                    comInsert.CommandType = CommandType.Text;
                    comInsert.CommandText = "INSERT INTO Films(Titel,GenreNr,InVoorraad,UitVoorraad,Prijs,TotaalVerhuurd)"
                    + " VALUES (@titel,@genre,@inVoorraad,@uitgeleend,@prijs,@totaalVerhuurd)";

                    var parTitel = comInsert.CreateParameter();
                    parTitel.ParameterName = "@titel";
                    parTitel.Value = film.Titel;
                    comInsert.Parameters.Add(parTitel);

                    
                    var parGenre = comInsert.CreateParameter();
                    parGenre.ParameterName = "@genre";
                    parGenre.Value = film.Genre;
                    comInsert.Parameters.Add(parGenre);

                    var parInVoorraad = comInsert.CreateParameter();
                    parInVoorraad.ParameterName = "@inVoorraad";
                    parInVoorraad.Value = film.InVoorraad;
                    comInsert.Parameters.Add(parInVoorraad);

                    var parUitVoorraad = comInsert.CreateParameter();
                    parUitVoorraad.ParameterName = "@uitgeleend";
                    parUitVoorraad.Value = film.Uitgeleend;
                    comInsert.Parameters.Add(parUitVoorraad);

                    var parPrijs = comInsert.CreateParameter();
                    parPrijs.ParameterName = "@prijs";
                    parPrijs.Value = film.Prijs;
                    comInsert.Parameters.Add(parPrijs);

                    var parTotaalVerhuurd = comInsert.CreateParameter();
                    parTotaalVerhuurd.ParameterName = "@totaalVerhuurd";
                    parTotaalVerhuurd.Value = film.TotaalVerhuurd;
                    comInsert.Parameters.Add(parTotaalVerhuurd);

                    conVideo.Open();

                    return (comInsert.ExecuteNonQuery());                   
                }
            }
        }

        public Int32 DeleteFilm(Film film)
        {
            var manager = new VideoManager();
            using (var conVideo = manager.GetConnection())
            {
                using (var comDelete = conVideo.CreateCommand())
                {
                    comDelete.CommandType = CommandType.Text;
                    comDelete.CommandText = "DELETE FROM Verhuur WHERE BandNr = @bandNr";
                    
                    var parBandNr = comDelete.CreateParameter();                    
                    parBandNr.ParameterName = "@bandNr";
                    parBandNr.Value = film.BandNr;
                    comDelete.Parameters.Add(parBandNr);

                    conVideo.Open();
                    comDelete.ExecuteNonQuery();
                    conVideo.Close();

                    comDelete.CommandText = "DELETE FROM Films WHERE BandNr = @bandnr";
                    conVideo.Open();
                    return comDelete.ExecuteNonQuery();
                    
                }
            }
        }

        public void UpdateFilms(List<Film> films)
        {
            var manager = new VideoManager();
            using (var conVideo = manager.GetConnection())
            {
                using (var comUpdate = conVideo.CreateCommand()) 
                {
                    comUpdate.CommandType = CommandType.Text;
                    comUpdate.CommandText = "Update Films set Titel=@titel,Genrenr=@genre," +
                        "InVoorraad=@inVoorraad,UitVoorraad=@uitVoorraad,Prijs=@prijs,TotaalVerhuurd=@totaalVerhuurd "
                        + "Where BandNr= @bandNr";

                    var parTitel = comUpdate.CreateParameter();
                    parTitel.ParameterName = "@titel";
                    comUpdate.Parameters.Add(parTitel);

                    var parGenreNr = comUpdate.CreateParameter();
                    parGenreNr.ParameterName = "@genre";
                    comUpdate.Parameters.Add(parGenreNr);

                    var parInVoorraad = comUpdate.CreateParameter();
                    parInVoorraad.ParameterName = "@inVoorraad";
                    comUpdate.Parameters.Add(parInVoorraad);

                    var parUitVoorraad = comUpdate.CreateParameter();
                    parUitVoorraad.ParameterName = "@uitVoorraad";
                    comUpdate.Parameters.Add(parUitVoorraad);

                    var parPrijs = comUpdate.CreateParameter();
                    parPrijs.ParameterName = "@prijs";
                    comUpdate.Parameters.Add(parPrijs);

                    var parTotaalVerhuurd = comUpdate.CreateParameter();
                    parTotaalVerhuurd.ParameterName = "@totaalVerhuurd";
                    comUpdate.Parameters.Add(parTotaalVerhuurd);

                    var parBandNr = comUpdate.CreateParameter();
                    parBandNr.ParameterName = "@bandNr";
                    comUpdate.Parameters.Add(parBandNr);

                    conVideo.Open();
                    foreach (var eenFilm in films)
                    {
                        parBandNr.Value = eenFilm.BandNr;
                        parTitel.Value = eenFilm.Titel;
                        parGenreNr.Value = eenFilm.Genre;
                        parInVoorraad.Value = eenFilm.InVoorraad;
                        parUitVoorraad.Value = eenFilm.Uitgeleend;
                        parPrijs.Value = eenFilm.Prijs;
                        parTotaalVerhuurd.Value = eenFilm.TotaalVerhuurd;

                        comUpdate.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}
