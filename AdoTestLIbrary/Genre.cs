using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdoTestLIbrary
{
    public class Genre
    {
        private Int32 genreNrValue;

        public Int32 GenreNr
        {
            get { return genreNrValue; }
        }

        private String genreNaamValue;

        public String GenreNaam
        {
            get { return genreNaamValue; }
            set { genreNaamValue = value; }
        }

        public Genre(Int32 genreNr, String genreNaam)
        {
            genreNrValue = genreNr;
            this.GenreNaam = genreNaam;
        }

        public Genre()
        {

        }
    }
}
