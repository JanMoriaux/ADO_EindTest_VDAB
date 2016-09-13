using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdoTestLIbrary
{
    public class Film
    {
        private Int32 bandNrValue;

        public Int32 BandNr
        {
            get { return bandNrValue; }
        }

        private String titelValue;

        public String Titel
        {
            get { return titelValue; }
            set 
            { 
                this.Changed = true;
                titelValue = value;
            }
        }

        private Int32 genreValue;

        public Int32 Genre
        {
            get { return genreValue; }
            set 
            {
                this.Changed = true;
                genreValue = value; 
            }
        }

        private Int32 inVoorraadValue;

        public Int32 InVoorraad
        {
            get { return inVoorraadValue; }
            set 
            {
                this.Changed = true;
                inVoorraadValue = value; }
        }

        private Int32 uitgeleendValue;

        public Int32 Uitgeleend
        {
            get { return uitgeleendValue; }
            set 
            {
                this.Changed = true;
                uitgeleendValue = value; 
            }
        }

        private Decimal prijsValue;

        public Decimal Prijs
        {
            get { return prijsValue; }
            set 
            {
                this.Changed = true;
                prijsValue = value; 
            }
        }

        private Int32 totaalVerhuurdValue;

        public Int32 TotaalVerhuurd
        {
            get { return totaalVerhuurdValue; }
            set 
            {
                this.Changed = true;
                totaalVerhuurdValue = value; 
            }
        }

        public bool Changed
        {
            get;
            set;
        }

        public Film(Int32 bandNr, String titel, Int32 genre, Int32 inVoorraad,
            Int32 uitgeleend, Decimal prijs, Int32 totaalVerhuurd)
        {
            bandNrValue = bandNr;
            this.Titel = titel;
            this.Genre = genre;
            this.InVoorraad = inVoorraad;
            this.Uitgeleend = uitgeleend;
            this.Prijs = prijs;
            this.TotaalVerhuurd = totaalVerhuurd;
            this.Changed = false;
        }

        public Film()
        {
            
        }
    }
}
